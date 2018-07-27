#include "applicationui.hpp"
#include "timer.hpp"

#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>
#include <bb/cascades/LocaleHandler>

#include <bb/device/Led>
#include <bb/device/LedColor>

#include <bb/system/InvokeManager>
#include <bb/cascades/Invocation>
#include <bb/cascades/InvokeQuery>

#include <bb/cascades/SceneCover>
#include <bb/cascades/Container>

//LIBRERIAS DATA NOTES
#include <QFile>
#include <QTextStream>
#include <fstream>
#include <iostream>
//LIBRERIAS CALENDARIO:
#include <bb/pim/calendar/CalendarService>
#include <bb/pim/calendar/CalendarEvent>
#include <bb/pim/calendar/EventSearchParameters>
#include <QtCore/QDateTime>
#include <QPair>

using namespace bb::cascades;
using namespace bb::device;
using namespace bb::system;

ApplicationUI::ApplicationUI(bb::cascades::Application *app) :
        QObject(app)
{

	// Register the Timer class in QML as part of version 1.0 of the
	    // CustomTimer library
	    qmlRegisterType<Timer>("CustomTimer", 1, 0, "Timer");
	    // ...


    // prepare the localization
    m_pTranslator = new QTranslator(this);
    m_pLocaleHandler = new LocaleHandler(this);
    if(!QObject::connect(m_pLocaleHandler, SIGNAL(systemLanguageChanged()), this, SLOT(onSystemLanguageChanged()))) {
        // This is an abnormal situation! Something went wrong!
        // Add own code to recover here
        qWarning() << "Recovering from a failed connect()";
    }
    // initial load
    onSystemLanguageChanged();



    // Create scene document from main.qml asset, the parent is set
    // to ensure the document gets destroyed properly at shut down.


    QmlDocument *qmlCover = QmlDocument::create("asset:///AppCover.qml").parent(
            this);

    if (!qmlCover->hasErrors()) {
        // Create the QML Container from using the QMLDocument.
        Container *coverContainer = qmlCover->createRootObject<Container>();

        // Create a SceneCover and set the application cover
        SceneCover *sceneCover = SceneCover::create().content(coverContainer);
        Application::instance()->setCover(sceneCover);
    }



    QmlDocument *qml = QmlDocument::create("asset:///main.qml").parent(this);

    listmodel = new MyStringListModel();
    qml->setContextProperty("tareas_modelList",&tareas);
    qml->setContextProperty("listmodel",listmodel);
    qml->setContextProperty("mainObj",this);

    // Create root object for the UI
    AbstractPane *root = qml->createRootObject<AbstractPane>();

    // Set created root object as the application scene
    app->setScene(root);
}

void ApplicationUI::onSystemLanguageChanged()
{
    QCoreApplication::instance()->removeTranslator(m_pTranslator);
    // Initiate, load and install the application translation files.
    QString locale_string = QLocale().name();
    QString file_name = QString("StudyPartner_%1").arg(locale_string);
    if (m_pTranslator->load(file_name, "app/native/qm")) {
        QCoreApplication::instance()->installTranslator(m_pTranslator);
    }
}


void ApplicationUI::addData(QString data){

	listmodel->append(data);   //Aqui lo que esta en el textfield entra al listmodel...(Append)

}

void ApplicationUI::saveData(){
	//GUARDA LA INFORMACION EN UN TXT
	QFile file("data/list.txt");
	if(file.open(QIODevice::WriteOnly)){
		QTextStream stream(&file);
		for(int i=0,s = listmodel->size();i<s;i++){
			stream << listmodel->value(i) << '\n';
		}

	}
}

void ApplicationUI::loadData(){

	std::ifstream in(QString("data/list.txt").toStdString().c_str());
	QStringList list;
	std::string line;
	if(in){
		while(std::getline(in,line))
			list.push_back(QString::fromStdString(line));
		listmodel->append(list);

	}
}


void ApplicationUI::editData(int indice ,QString texto){

	listmodel->replace(indice,texto);

}

void ApplicationUI::deleteData(int indice){

	listmodel->removeAt(indice);

}





//CALENDAR IMPLEMENTATION:


void ApplicationUI::loadEvents(){

    bb::pim::calendar::CalendarService calService;
    bb::pim::calendar::Result::Type result_type;

    bb::pim::calendar::EventSearchParameters proximos;
    QDateTime now = QDateTime::currentDateTime();

    proximos.setStart(now);
    proximos.setEnd(now.addDays(30));

    QList<bb::pim::calendar::CalendarEvent> eventList =
    		calService.events(proximos,&result_type);
    if(result_type != -1)
    {
    	foreach(const bb::pim::calendar::CalendarEvent& event, eventList)
		{
    		tareas.append(event.startTime().toString("dd-MM-yy ||  ")
    				+ event.subject());
		}
    }

}

void ApplicationUI::addNewEvent(QString Subject,QDateTime Finish,QDateTime reminder){


	QString minutesS = reminder.toString("mm");
	int minutes = minutesS.split(" ")[0].toInt();

	bb::pim::calendar::CalendarService calService;
	bb::pim::calendar::CalendarEvent evento;
	bb::pim::calendar::Result::Type result;

	QPair<int,int> defaultFolder = calService.defaultCalendarFolder(&result);
	if(result == -1)
		return;

	evento.setAccountId(defaultFolder.first);
	evento.setFolderId(defaultFolder.second);
	evento.setStartTime(Finish);
	evento.setEndTime(Finish);
	evento.setReminder(minutes);
	evento.setSubject(Subject);

	if(calService.createEvent(evento)!=-1)
	{
		tareas.append(evento.startTime().toString("dd-MM-yy ||  ")
			    				+ evento.subject());
	}
	else
	{
		qDebug()<<"No se creo el evento";

			//Failed to create event
	}
}

void ApplicationUI::share(QString thedata)
{
	qDebug()<<"LO QUE SE VA A COMPARTIR: "<< thedata;

     m_pInvocation = Invocation::create(
          InvokeQuery::create()
	       .parent(this)
	       .mimeType("text/plain")
	       .data(thedata.toUtf8()));
	  QObject::connect(m_pInvocation, SIGNAL(armed()),
	    this, SLOT(onArmed()));
	  QObject::connect(m_pInvocation, SIGNAL(finished()),
	    m_pInvocation, SLOT(deleteLater()));
}

// Declare the following method as SLOT on your .hpp file
void ApplicationUI::onArmed() {
	m_pInvocation->trigger("bb.action.SHARE");
}

