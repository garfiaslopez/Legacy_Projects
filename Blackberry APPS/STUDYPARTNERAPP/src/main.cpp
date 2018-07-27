#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>


#include <QLocale>
#include <QTranslator>
#include "applicationui.hpp"


#include <bb/device/Led>
#include <bb/device/LedColor>



#include <Qt/qdeclarativedebug.h>

using namespace bb::cascades;
using namespace bb::device;


int main(int argc, char **argv)
{

    qmlRegisterType<bb::device::Led>("bb.device", 1, 0, "Led");
    qmlRegisterUncreatableType<bb::device::LedColor>("bb.device", 1, 0, "LedColor", "");

    Application app(argc, argv);

    // Create the Application UI object, this is where the main.qml file
    // is loaded and the application scene is set.
   new ApplicationUI(&app);

   return Application::exec();
}
