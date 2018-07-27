#ifndef ApplicationUI_HPP_
#define ApplicationUI_HPP_

#include <QObject>

#include <bb/system/InvokeManager>
#include <bb/cascades/AbstractPane>

using namespace bb::system;
using namespace bb::cascades;

namespace bb
{
    namespace cascades
    {
        class Application;
        class LocaleHandler;
    }
}

class QTranslator;

/*!
 * @brief Application object
 *
 *
 */

class ApplicationUI : public QObject
{
    Q_OBJECT
public:
    ApplicationUI(bb::cascades::Application *app);
    virtual ~ApplicationUI() { }

    Q_INVOKABLE
    void invokeNFC(const QString &path);

private slots:
    void onSystemLanguageChanged();
    void onInvokeComplete();

private:
    QTranslator* m_pTranslator;
    bb::cascades::LocaleHandler* m_pLocaleHandler;

    InvokeManager* myInvocation;
    AbstractPane *root;
};

#endif /* ApplicationUI_HPP_ */
