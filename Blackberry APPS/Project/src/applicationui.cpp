#include "applicationui.hpp"
#include "timer.hpp"
#include <stdio.h>
#include <string.h>
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

#include <bb/cascades/GroupDataModel>
#include <bb/cascades/QListDataModel>

#include <bb/cascades/Page>
#include <bb/cascades/LocaleHandler>


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


	   /* QTranslator translator;
	        QString locale_string = QLocale().name();
	        QString filename = QString( "StudyPartner_%1" ).arg( locale_string );
	        if (translator.load(filename, "app/native/qm")) {
	            QCoreApplication::instance()->installTranslator(&translator);

	            //app.installTranslator(  );
	        }*/
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

   // root = qml->createRootObject<Page>();

    listmodel = new MyStringListModel();

    modeloGrupo = new modelRandom(QStringList()<<"materia"<<"maestro");

    modeloCalifi = new modeloMain(QStringList()<<"materia"<<"promedio");

    modeloIndividual = new modeloInd(QStringList()<<"materia"<<"promedio");

    modeloFotoNotes = new modelofoto(QStringList()<<"image"<<"header");

    qml->setContextProperty("photoNotes_Model",modeloFotoNotes);
    qml->setContextProperty("calificaciones_model",modeloCalifi);
    qml->setContextProperty("individual_model",modeloIndividual);
    qml->setContextProperty("horario_model",modeloGrupo);
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

void ApplicationUI::primeraVistaQuitar(){

	QFile file("data/primero.txt");
				if(file.open(QIODevice::WriteOnly)){
					QTextStream stream(&file);
						stream <<"1"<< '\n';
				}

}

int ApplicationUI::primeraVista(){


	std::ifstream in(QString("data/primero.txt").toStdString().c_str());
	std::string line;
		if(in){
			std::getline(in,line);
		    if(QString::fromStdString(line) == "1"){
		    	return 1;
		    }
		}

	return 0;
}


void ApplicationUI::deleteFotoNote(QString elemento){

	int indice = elemento.toInt();

	QStringList materias;
	QStringList fotos;
	QStringList titulos;

	std::ifstream in(QString("data/notasfotos.txt").toStdString().c_str());
	std::string line;
	if(in){
		while(std::getline(in,line)){
			materias.append(QString::fromStdString(line));
			std::getline(in,line);
			fotos.append(QString::fromStdString(line));
			std::getline(in,line);
			titulos.append(QString::fromStdString(line));
		}
	}

	//SEGUN EL NUMERO DE ELEMENTO LO BUSCAS EN TODAS LAS LISTAS Y LO BORRAS
	//PARA CONFIRMAR COMPARAS ELEMENTO Y MATERIA::::

	materias.removeAt(indice);
	fotos.removeAt(indice);
	titulos.removeAt(indice);


	//YA BORRADO EL ELEMENTO SOBRESCRIBES TODO EN EL TXT
	//COMO SI GUARDARAS NORMALMENTE
	QFile file("data/notasfotos.txt");
			if(file.open(QIODevice::WriteOnly)){
				QTextStream stream(&file);
				for(int i=0;i<materias.size();i++){
					stream << materias[i]<< '\n';
					stream << fotos[i]<< '\n';
					stream << titulos[i]<< '\n';
				}
			}
}


void ApplicationUI::loadFotoNote(){

	qDebug()<<"ENTRO A CARGAR LAS FOTONOTES";

	modeloFotoNotes->clear();

	QStringList materias;
	QStringList fotos;
	QStringList titulos;
	QVariantMap map;

	std::ifstream in(QString("data/notasfotos.txt").toStdString().c_str());
	std::string line;
	if(in){
		while(std::getline(in,line)){
			materias.append(QString::fromStdString(line));
			std::getline(in,line);
			fotos.append(QString::fromStdString(line));
			std::getline(in,line);
			titulos.append(QString::fromStdString(line));
		}
	}

	for(int i=0;i<materias.size();i++){

		map["elemento"] = i;
		map["foto"]= fotos.at(i);
		map["materia"]= materias.at(i);
		map["titulo"]= titulos.at(i);

		modeloFotoNotes->insert(map);
	}

}


void ApplicationUI::saveFotoNote(QString foto,QString materia, QString titulo){

	qDebug()<<materia;
	qDebug()<<foto;
	qDebug()<<titulo;

	QStringList materias;
	QStringList fotos;
	QStringList titulos;

	//Recuperar las materias anteriores.....para juntarlas con esta nueva y meterlas al vector...

		std::ifstream in(QString("data/notasfotos.txt").toStdString().c_str());
		std::string line;
		if(in){
			while(std::getline(in,line)){
				materias.append(QString::fromStdString(line));
				std::getline(in,line);
				fotos.append(QString::fromStdString(line));
				std::getline(in,line);
				titulos.append(QString::fromStdString(line));
			}
		}

		//Añadir a las listas la nueva informacion.....

		materias.append(materia);
		fotos.append(foto);
		titulos.append(titulo);

		//Guardar todo el vector junto con esta nueva materia....

		QFile file("data/notasfotos.txt");
				if(file.open(QIODevice::WriteOnly)){
					QTextStream stream(&file);
					for(int i=0;i<materias.size();i++){
						stream << materias[i]<< '\n';
						stream << fotos[i]<< '\n';
						stream << titulos[i]<< '\n';
					}
				}



}

double ApplicationUI::location2double(QString location){

	double loc = location.toDouble();

	return loc;
}

void ApplicationUI::loadCalifiMateria(QString materia){

	qDebug()<<"ENTRO A BUSCAR LAS CALIFICACIONES DE LA MATERIA";

	qDebug()<<materia;


	modeloIndividual->clear();

	//Recuperas las calificaciones de todas las materias...

	QStringList materias;
	QStringList parciales;
	QStringList calificaciones;

	qDebug()<<materias.size();

	std::ifstream in(QString("data/calificaciones.txt").toStdString().c_str());
	std::string line;
	if(in){
		while(std::getline(in,line)){
			materias.append(QString::fromStdString(line));
			std::getline(in,line);
			parciales.append(QString::fromStdString(line));
			std::getline(in,line);
			calificaciones.append(QString::fromStdString(line));
		}

	}
	qDebug()<<materias.size();

	QStringList materiaInd;
	QStringList parcialInd;
	QStringList califiInd;

    float suma=0;
	for(int i=0;i<materias.size();i++){

		if(materias.at(i) == materia){
			materiaInd.append(materias.at(i));
			parcialInd.append(parciales.at(i));
			califiInd.append(calificaciones.at(i));
		}
	}

	qDebug()<<materias.size();

	QVariantMap map;

	for(int i=0;i<materiaInd.size();i++){

		map["materia"] = materiaInd.at(i);
		map["parcial"] = parcialInd.at(i);
		map["calificacion"] = califiInd.at(i);

		suma = suma+califiInd.at(i).toInt();

		modeloIndividual->insert(map);
	}
	qDebug()<<materias.size();
	qDebug()<<califiInd.size();
	qDebug()<<suma;


	if(califiInd.size()!= 0){

		   suma = suma/califiInd.size();

			map["materia"]= materiaInd.at(0);
			map["parcial"]="Promedio";
			map["calificacion"] = suma;

			modeloIndividual->insert(map);

	}



	qDebug()<<materias.size();
	qDebug()<<califiInd.size();

}


void ApplicationUI::deleteCalificacion(QString elemento){

	//RECUPERAS TODO EN LOS QSTRINGLIST

	int indice = elemento.toInt();

	QStringList materias;
	QStringList parciales;
	QStringList calificaciones;

	std::ifstream in(QString("data/calificaciones.txt").toStdString().c_str());
	std::string line;
	if(in){
		while(std::getline(in,line)){
			materias.append(QString::fromStdString(line));
			std::getline(in,line);
			parciales.append(QString::fromStdString(line));
			std::getline(in,line);
			calificaciones.append(QString::fromStdString(line));
		}

	}

	//SEGUN EL NUMERO DE ELEMENTO LO BUSCAS EN TODAS LAS LISTAS Y LO BORRAS
	//PARA CONFIRMAR COMPARAS ELEMENTO Y MATERIA::::

	materias.removeAt(indice);
	parciales.removeAt(indice);
	calificaciones.removeAt(indice);

	//YA BORRADO EL ELEMENTO SOBRESCRIBES TODO EN EL TXT
	//COMO SI GUARDARAS NORMALMENTE

	QFile file("data/calificaciones.txt");
			if(file.open(QIODevice::WriteOnly)){
				QTextStream stream(&file);
				for(int i=0;i<materias.size();i++){
					stream << materias[i]<< '\n';
					stream << parciales[i]<< '\n';
					stream << calificaciones[i]<< '\n';
				}
			}

}


void ApplicationUI::loadCalificacion(){

	modeloCalifi->clear();

	QStringList materias;
	QStringList parciales;
	QStringList calificaciones;
	QVariantMap map;

	std::ifstream in(QString("data/calificaciones.txt").toStdString().c_str());
	std::string line;
	if(in){
		while(std::getline(in,line)){
			materias.append(QString::fromStdString(line));
			std::getline(in,line);
			parciales.append(QString::fromStdString(line));
			std::getline(in,line);
			calificaciones.append(QString::fromStdString(line));
		}

	}

	for(int i=0;i<materias.size();i++){

		map["elemento"] = i;
		map["materia"] = materias.at(i);
		map["parcial"] = parciales.at(i);
		map["calificacion"] = calificaciones.at(i);

		modeloCalifi->insert(map);
	}
}


void ApplicationUI::saveCalificacion(QString materia, QString parcial, QString calificacion){

		QStringList materias;
		QStringList parciales;
		QStringList calificaciones;


		//Recuperar las materias anteriores.....para juntarlas con esta nueva y meterlas al vector...

		std::ifstream in(QString("data/calificaciones.txt").toStdString().c_str());
		std::string line;
		if(in){
			while(std::getline(in,line)){
				materias.append(QString::fromStdString(line));
				std::getline(in,line);
				parciales.append(QString::fromStdString(line));
				std::getline(in,line);
				calificaciones.append(QString::fromStdString(line));
			}
		}

		//Añadir a las listas la nueva informacion.....

		materias.append(materia);
		parciales.append(parcial);
		calificaciones.append(calificacion);

		//Guardar todo el vector junto con esta nueva materia....

		QFile file("data/calificaciones.txt");
				if(file.open(QIODevice::WriteOnly)){
					QTextStream stream(&file);
					for(int i=0;i<materias.size();i++){
						stream << materias[i]<< '\n';
						stream << parciales[i]<< '\n';
						stream << calificaciones[i]<< '\n';
					}
				}
}


void ApplicationUI::loadMateria(){

	modeloGrupo->clear();

	QStringList maestros;
	QStringList materias;
	QStringList iniciohora;
	QStringList finalhora;
	QVariantMap map;


	std::ifstream in(QString("data/horario.txt").toStdString().c_str());
	std::string line;
	if(in){
		while(std::getline(in,line)){
			materias.append(QString::fromStdString(line));
			std::getline(in,line);
			maestros.append(QString::fromStdString(line));
			std::getline(in,line);
			iniciohora.append(QString::fromStdString(line));
			std::getline(in,line);
			finalhora.append(QString::fromStdString(line));
		}

	}

	for(int i=0;i<materias.size();i++){

		map["elemento"] = i;
		map["materia"] = materias.at(i);
		map["maestro"] = maestros.at(i);
		map["horainicial"] = iniciohora.at(i);
		map["horafinal"] = finalhora.at(i);

		modeloGrupo->insert(map);
	}


}


void ApplicationUI::saveMateria(QString materia, QString maestro, QTime inicio, QTime final){

	qDebug()<<materia;
	qDebug()<<maestro;

	QString horaInicio = inicio.toString("hh:mm");
	QString horaFinal = final.toString("hh:mm");

	qDebug()<<horaInicio;
	qDebug()<<horaFinal;

	QStringList maestros;
	QStringList materias;
	QStringList iniciohora;
	QStringList finalhora;


	//Recuperar las materias anteriores.....para juntarlas con esta nueva y meterlas al vector...

	std::ifstream in(QString("data/horario.txt").toStdString().c_str());
	std::string line;
	if(in){
		while(std::getline(in,line)){
			materias.append(QString::fromStdString(line));
			std::getline(in,line);
			maestros.append(QString::fromStdString(line));
			std::getline(in,line);
			iniciohora.append(QString::fromStdString(line));
			std::getline(in,line);
			finalhora.append(QString::fromStdString(line));
		}
	}

	//Añadir a las listas la nueva informacion.....

	maestros.append(maestro);
	materias.append(materia);
	iniciohora.append(horaInicio);
	finalhora.append(horaFinal);

	//Guardar todo el vector junto con esta nueva materia....

	QFile file("data/horario.txt");
			if(file.open(QIODevice::WriteOnly)){
				QTextStream stream(&file);
				for(int i=0;i<materias.size();i++){
					stream << materias[i]<< '\n';
					stream << maestros[i]<< '\n';
					stream << iniciohora[i]<< '\n';
					stream << finalhora[i]<< '\n';
				}
			}
}


void ApplicationUI::deleteMateria(QString materia,QString elemento){

	qDebug()<<materia;
	qDebug()<<elemento;

	//RECUPERAS TODO EN LOS QSTRINGLIST
	int indice = elemento.toInt();

	QStringList maestros;
	QStringList materias;
	QStringList iniciohora;
	QStringList finalhora;

	std::ifstream in(QString("data/horario.txt").toStdString().c_str());
	std::string line;
	if(in){
		while(std::getline(in,line)){
			materias.append(QString::fromStdString(line));
			std::getline(in,line);
			maestros.append(QString::fromStdString(line));
			std::getline(in,line);
			iniciohora.append(QString::fromStdString(line));
			std::getline(in,line);
			finalhora.append(QString::fromStdString(line));
		}

	}

	//SEGUN EL NUMERO DE ELEMENTO LO BUSCAS EN TODAS LAS LISTAS Y LO BORRAS
	//PARA CONFIRMAR COMPARAS ELEMENTO Y MATERIA::::

	materias.removeAt(indice);
	maestros.removeAt(indice);
	iniciohora.removeAt(indice);
	finalhora.removeAt(indice);

	//YA BORRADO EL ELEMENTO SOBRESCRIBES TODO EN EL TXT
	//COMO SI GUARDARAS NORMALMENTE


	QFile file("data/horario.txt");
			if(file.open(QIODevice::WriteOnly)){
				QTextStream stream(&file);
				for(int i=0;i<materias.size();i++){
					stream << materias[i]<< '\n';
					stream << maestros[i]<< '\n';
					stream << iniciohora[i]<< '\n';
					stream << finalhora[i]<< '\n';
				}
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




void ApplicationUI::saveNombre(QString Name){
	qDebug()<<Name;

	QFile file("data/nombre.txt");
		if(file.open(QIODevice::WriteOnly)){
			QTextStream stream(&file);
			stream << Name << '\n';
			qDebug()<<"DEBIO ESCRIBIR EL NOMBRE EN EL TXT";
		}
	emit PerfilSalvado();
}

QString ApplicationUI::loadNombre(){
    qDebug()<<"ENTRO A LOADNOMBRE";

	std::ifstream in(QString("data/nombre.txt").toStdString().c_str());
	std::string line;
	if(in){
		std::getline(in,line);
		return QString::fromStdString(line);
	}

	qDebug()<<"NO REGRESO NADA";
	return QString::fromStdString("");
}


void ApplicationUI::saveFoto(QString Foto){
	qDebug()<<Foto;

	QFile file("data/foto.txt");
		if(file.open(QIODevice::WriteOnly)){
			QTextStream stream(&file);
			stream << Foto << '\n';
			qDebug()<<"DEBIO GUARDAR LA URL DE LA FOTO";
		}
}

QString ApplicationUI::loadFoto(){
    qDebug()<<"ENTRO A LOadFoto";

	std::ifstream in(QString("data/foto.txt").toStdString().c_str());
	std::string line;
	if(in){
		std::getline(in,line);
		return QString::fromStdString(line);
	}

	qDebug()<<"NO REGRESO NADA";
	return QString::fromStdString("");
}

void ApplicationUI::saveEscuela(QString Escuela){

	qDebug()<<Escuela;

	QFile file("data/escuela.txt");
		if(file.open(QIODevice::WriteOnly)){
			QTextStream stream(&file);
			stream << Escuela << '\n';
			qDebug()<<"DEBIO GUARDAR LA ESCUELA";
		}
	emit PerfilSalvado();
}
QString ApplicationUI::loadEscuela(){

    qDebug()<<"ENTRO A LOADESCUELA";

	std::ifstream in(QString("data/escuela.txt").toStdString().c_str());
	std::string line;
	if(in){
		std::getline(in,line);
		return QString::fromStdString(line);
	}

	qDebug()<<"NO REGRESO NADA";
	return QString::fromStdString("");


}

void ApplicationUI::saveGrupo(QString Grupo){

	qDebug()<<Grupo;

	QFile file("data/grupo.txt");
		if(file.open(QIODevice::WriteOnly)){
			QTextStream stream(&file);
			stream << Grupo << '\n';
			qDebug()<<"DEBIO GUARDAR EL GRUPO";
		}
	emit PerfilSalvado();
}
QString ApplicationUI::loadGrupo(){

    qDebug()<<"ENTRO A LOADGRUPO";

	std::ifstream in(QString("data/grupo.txt").toStdString().c_str());
	std::string line;
	if(in){
		std::getline(in,line);
		return QString::fromStdString(line);
	}

	qDebug()<<"NO REGRESO NADA";
	return QString::fromStdString("");

}

void ApplicationUI::saveSemestre(QString Semestre){

	qDebug()<<Semestre;

	QFile file("data/semestre.txt");
		if(file.open(QIODevice::WriteOnly)){
			QTextStream stream(&file);
			stream << Semestre << '\n';
			qDebug()<<"DEBIO GUARDAR EL SEMESTRE";
		}
	emit PerfilSalvado();

}

QString ApplicationUI::loadSemestre(){

    qDebug()<<"ENTRO A LOADSEMESTRE";

	std::ifstream in(QString("data/semestre.txt").toStdString().c_str());
	std::string line;
	if(in){
		std::getline(in,line);
		return QString::fromStdString(line);
	}

	qDebug()<<"NO REGRESO NADA";
	return QString::fromStdString("");


}

void ApplicationUI::saveFechaInicio(QDate FechaInicio){

	QString FI = FechaInicio.toString("dd-MM-yyyy");
	qDebug()<<FI;

	QFile file("data/fechaInicio.txt");
		if(file.open(QIODevice::WriteOnly)){
			QTextStream stream(&file);
			stream << FI << '\n';
			qDebug()<<"DEBIO GUARDAR LA FECHA INICIAL";
		}
	emit PerfilSalvado();

}
QString ApplicationUI::loadFechaInicio(){

    qDebug()<<"ENTRO A LOADFI";

	std::ifstream in(QString("data/fechaInicio.txt").toStdString().c_str());
	std::string line;
	if(in){
		std::getline(in,line);
		return QString::fromStdString(line);
	}

	qDebug()<<"NO REGRESO NADA";
	return QString::fromStdString("");



}

void ApplicationUI::saveFechaFinal(QDateTime FechaFinal){

	QString FF = FechaFinal.toString("dd-MM-yyyy");
	qDebug()<<FF;

	QFile file("data/fechaFinal.txt");
		if(file.open(QIODevice::WriteOnly)){
			QTextStream stream(&file);
			stream << FF << '\n';
			qDebug()<<"DEBIO GUARDAR LA FECHA INICIAL";
		}
	emit PerfilSalvado();
}
QString ApplicationUI::loadFechaFinal(){

    qDebug()<<"ENTRO A LOADFI";

	std::ifstream in(QString("data/fechaFinal.txt").toStdString().c_str());
	std::string line;
	if(in){
		std::getline(in,line);
		return QString::fromStdString(line);
	}

	qDebug()<<"NO REGRESO NADA";
	return QString::fromStdString("");
}

float ApplicationUI::progress(){

	qDebug()<<"ENTRO A LA FUNCION PROGRESO!! ";

	int total,parcial;
	QDate inicio, ahora, final;
	QString tmpInicio,tmpFinal;

	///////////////
	std::ifstream inInicio(QString("data/fechaInicio.txt").toStdString().c_str());
	std::string lineInicio;
	if(inInicio){
		  while(std::getline(inInicio,lineInicio))
			tmpInicio =  QString::fromStdString(lineInicio);
	}

	inicio = QDate::fromString(tmpInicio,"dd-MM-yyyy");
	qDebug()<<"FECHA INICIO EN PROGRESO"<<inicio<<"TMP"<<tmpInicio;


	//////////////

	std::ifstream inFinal(QString("data/fechaFinal.txt").toStdString().c_str());
		std::string lineFinal;
		if(inFinal){
			  while(std::getline(inFinal,lineFinal))
				tmpFinal =  QString::fromStdString(lineFinal);
		}

	final = QDate::fromString(tmpFinal,"dd-MM-yyyy");

	qDebug()<<"FECHA FINAL EN PROGRESO"<<final<<"TMP"<<tmpFinal;

	//////////////////////////////

	ahora = QDate::currentDate();

	qDebug()<<"FECHA ACTUAL EN PROGRESO"<<ahora;

	/////////////////////
    if(inicio.operator !=(final)){
		total = inicio.daysTo(final);
		parcial = inicio.daysTo(ahora);
    }
    else
    	return 0;

	qDebug()<<"TOTAL DE DIAS:"<<total<<"PARCIAL:"<<parcial<<"RESULTADO:"<<parcial*100/total;

	return parcial*100/total;
}

int ApplicationUI::daysLeft(){

	qDebug()<<"ENTRO A LA FUNCION DIAS RESTANTES!! ";
		int parcial;
		QDate ahora, final;
		QString tmpFinal;

		std::ifstream inFinal(QString("data/fechaFinal.txt").toStdString().c_str());
			std::string lineFinal;
			if(inFinal){
				  while(std::getline(inFinal,lineFinal))
					tmpFinal =  QString::fromStdString(lineFinal);
			}

		final = QDate::fromString(tmpFinal,"dd-MM-yyyy");

		qDebug()<<"FECHA FINAL EN PROGRESO"<<final<<"TMP"<<tmpFinal;

		//////////////////////////////

		ahora = QDate::currentDate();

		qDebug()<<"FECHA ACTUAL EN PROGRESO"<<ahora;

		/////////////////////
		if(ahora.operator !=(final)){
		    parcial = ahora.daysTo(final);
		}
		else
			return 0;


		qDebug()<<"PARCIAL:"<<parcial;
		if(parcial >= 0)
			return parcial;
		else
			return 0;
}
