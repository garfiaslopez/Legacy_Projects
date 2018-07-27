// Default empty project template
#include "QMLHelloWorld.hpp"

#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>

#include <QFile>
#include <QTextStream>
#include <fstream>
#include <iostream>

using namespace bb::cascades;

QMLHelloWorld::QMLHelloWorld(bb::cascades::Application *app)
: QObject(app),app(app)
{
    // create scene document from main.qml asset
    // set parent to created document to ensure it exists for the whole application lifetime
    QmlDocument *qml = QmlDocument::create("asset:///main.qml").parent(this);

    listmodel = new MyStringListModel();
    qml->setContextProperty("listmodel",listmodel);
    qml->setContextProperty("mainObj",this);
    // create root object for the UI
    AbstractPane *root = qml->createRootObject<AbstractPane>();

    QObject::connect(root,SIGNAL(qmlSignal()),this,SLOT(receiveSignalFromQML()));

    // set created root object as a scene
    app->setScene(root);
}

void QMLHelloWorld::addData(QString data)
{
	listmodel->append(data);
}

void QMLHelloWorld::saveData()
{
	QFile file("data/list.txt");
	if(file.open(QIODevice::WriteOnly))
	{
		QTextStream stream(&file);
		for(int i = 0, s = listmodel->size(); i < s; ++i)
		   stream << listmodel->value(i) << '\n';
	}
}

void QMLHelloWorld::loadData()
{
	std::ifstream in(QString("data/list.txt").toStdString().c_str());
	QStringList list;
	std::string line;
	if(in)
	{
		while(std::getline(in,line))
			list.push_back(QString::fromStdString(line));
		listmodel->append(list);
		emit dataReady();
	}
}

void QMLHelloWorld::receiveSignalFromQML()
{
	listmodel->append("receiveSignalFromQML");
	qDebug() << "Signal Received";
}

