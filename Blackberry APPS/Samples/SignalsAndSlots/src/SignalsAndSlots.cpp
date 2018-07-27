#include "SignalsAndSlots.hpp"
#include "timer.hpp"

#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>

using namespace bb::cascades;

SignalsAndSlots::SignalsAndSlots(bb::cascades::Application *app)
: QObject(app)
{
    // Register the Timer class in QML as part of version 1.0 of the CustomTimer
    // library
    qmlRegisterType<Timer>("CustomTimer", 1, 0, "Timer");

    // create scene document from main.qml asset
    // set parent to created document to ensure it exists for the whole application lifetime
    QmlDocument *qml = QmlDocument::create("asset:///main.qml").parent(this);

    // create root object for the UI
    AbstractPane *root = qml->createRootObject<AbstractPane>();
    // set created root object as a scene
    app->setScene(root);
}

