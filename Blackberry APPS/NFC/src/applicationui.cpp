#include "applicationui.hpp"

#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>
#include <bb/cascades/LocaleHandler>

#include <bb/system/InvokeManager>
#include <bb/system/InvokeRequest>
#include <bb/system/InvokeTargetReply>
#include <bb/cascades/Button>
#include <bb/cascades/Label>

using namespace bb::cascades;
using namespace bb::system;

ApplicationUI::ApplicationUI(bb::cascades::Application *app) :
		QObject(app) {
	// prepare the localization
	m_pTranslator = new QTranslator(this);
	m_pLocaleHandler = new LocaleHandler(this);
	if (!QObject::connect(m_pLocaleHandler, SIGNAL(systemLanguageChanged()),
			this, SLOT(onSystemLanguageChanged()))) {
		// This is an abnormal situation! Something went wrong!
		// Add own code to recover here
		qWarning() << "Recovering from a failed connect()";
	}
	// initial load
	onSystemLanguageChanged();

	// Create scene document from main.qml asset, the parent is set
	// to ensure the document gets destroyed properly at shut down.
	QmlDocument *qml = QmlDocument::create("asset:///main.qml").parent(this);

	qml->setContextProperty("_myApp", this);

	// Create root object for the UI
	root = qml->createRootObject<AbstractPane>();

	// Set created root object as the application scene
	app->setScene(root);
}

void ApplicationUI::invokeNFC(const QString &path) {

	InvokeRequest dataInvoke;

	dataInvoke.setAction("bb.action.SHARE");
	dataInvoke.setUri(path);
	dataInvoke.setTarget("sys.NFCViewer");

	InvokeTargetReply *reply = myInvocation->invoke(dataInvoke);

	if(reply){
		connect(reply, SIGNAL(finished()), this, SLOT(onInvokeComplete()));
	}
}

void ApplicationUI::onInvokeComplete(){
	Label *myLabel = root->findChild<Label*>("labelNFC");
	Button *myButton = root->findChild<Button*>("btnInvokeNFC");
	myLabel->resetText();
	myButton->setEnabled(false);
}

void ApplicationUI::onSystemLanguageChanged() {
	QCoreApplication::instance()->removeTranslator(m_pTranslator);
	// Initiate, load and install the application translation files.
	QString locale_string = QLocale().name();
	QString file_name = QString("NFC_%1").arg(locale_string);
	if (m_pTranslator->load(file_name, "app/native/qm")) {
		QCoreApplication::instance()->installTranslator(m_pTranslator);
	}
}
