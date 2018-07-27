#ifndef ApplicationUI_HPP_
#define ApplicationUI_HPP_

#include <QObject>
#include <bb/cascades/QListDataModel>
#include <bb/cascades/Invocation>


namespace bb
{
    namespace cascades
    {
        class Application;
        class LocaleHandler;
    }
}

typedef bb::cascades::QListDataModel<QString> MyStringListModel;


class QTranslator;

/*!
 * @brief Application object
 *
 *
 */

class ApplicationUI : public QObject
{
    Q_OBJECT
    MyStringListModel tareas;
    MyStringListModel *listmodel;   // SE DECLARA LA LISTA CON EL TIPO DE TYPEDEF
    bb::cascades::Application* app;
public:
    ApplicationUI(bb::cascades::Application *app);
    virtual ~ApplicationUI() { delete listmodel;}

    //LAS ACCIONES DE INVOCACION
       Q_INVOKABLE void addData(QString data);
       Q_INVOKABLE void saveData();
       Q_INVOKABLE void loadData();
       Q_INVOKABLE void editData(int indice, QString texto);
       Q_INVOKABLE void deleteData(int indice);

       Q_INVOKABLE void addNewEvent(QString Subject,QDateTime Finish,QDateTime reminder);
       Q_INVOKABLE void loadEvents();


       Q_INVOKABLE void share(QString thedata);
           bb::cascades::Invocation *m_pInvocation;

           public Q_SLOTS:
           	void onArmed();

private slots:
    void onSystemLanguageChanged();
private:
    QTranslator* m_pTranslator;
    bb::cascades::LocaleHandler* m_pLocaleHandler;
};

#endif /* ApplicationUI_HPP_ */
