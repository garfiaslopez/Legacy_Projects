#include "applicationui.hpp"

#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>
#include <bb/cascades/LocaleHandler>

#include <QtLocationSubset/QGeoPositionInfoSource>
#include <QtLocationSubset/QGeoPositionInfo>
#include <QtLocationSubset/QGeoCoordinate>

#include <bb/cascades/maps/MapView>
#include <bb/cascades/maps/MapData>
#include <bb/platform/geo/GeoLocation>
#include <bb/platform/geo/Marker>

#include <QDebug>

using namespace bb::cascades;
using namespace bb::cascades::maps;
using namespace bb::platform::geo;
using namespace QtMobilitySubset;

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

	// Create root object for the UI
	root = qml->createRootObject<AbstractPane>();

	QGeoPositionInfoSource *src = QGeoPositionInfoSource::createDefaultSource(
			this);

	bool positionUpdatedConnected = connect(src,
			SIGNAL(positionUpdated(const QGeoPositionInfo &)), this,
			SLOT(positionUpdated(const QGeoPositionInfo &)));

	if (positionUpdatedConnected) {
		src->requestUpdate(120000);
	} else {
		qDebug() << "Can«t update the position";
	}

	// Set created root object as the application scene
	app->setScene(root);
}

void ApplicationUI::positionUpdated(const QGeoPositionInfo &pos) {

	MapView *myMapView = root->findChild<MapView*>("mapView");
	myMapView->setAltitude(pos.coordinate().altitude());
	myMapView->setLatitude(pos.coordinate().latitude());
	myMapView->setLongitude(pos.coordinate().longitude());

	GeoLocation* myLocation = new GeoLocation("id-myLocation", "My Location", Point(pos.coordinate().latitude(), pos.coordinate().longitude()));

	Marker myMarker;
	myMarker.setIconUri("/usr/hmi/lbs/purple_pin.png");
	myMarker.setIconSize(QSize(64, 64));
	myMarker.setLocationCoordinate(QPoint(24, 64));
	myMarker.setCaptionTailCoordinate(QPoint(24, 3));

	myLocation->setMarker(myMarker);
	myMapView->mapData()->add(myLocation);
	myMapView->setLocationOnVisible();

}

void ApplicationUI::onSystemLanguageChanged() {
	QCoreApplication::instance()->removeTranslator(m_pTranslator);
	// Initiate, load and install the application translation files.
	QString locale_string = QLocale().name();
	QString file_name = QString("MapView_%1").arg(locale_string);
	if (m_pTranslator->load(file_name, "app/native/qm")) {
		QCoreApplication::instance()->installTranslator(m_pTranslator);
	}
}
