#ifndef ApplicationUI_HPP_
#define ApplicationUI_HPP_

#include <QObject>
#include <bb/cascades/QListDataModel>
#include <bb/cascades/Invocation>
#include <bb/cascades/GroupDataModel>
#include <bb/cascades/Page>

using namespace bb::cascades;

namespace bb
{
    namespace cascades
    {
        class Application;
        class LocaleHandler;
    }
}

typedef bb::cascades::QListDataModel<QString>MyStringListModel;
typedef bb::cascades::GroupDataModel modelRandom;
typedef bb::cascades::GroupDataModel modeloMain;
typedef bb::cascades::GroupDataModel modeloInd;
typedef bb::cascades::GroupDataModel modelofoto;


class QTranslator;

/*!
 * @brief Application object
 *
 *
 */

class ApplicationUI : public QObject
{
    Q_OBJECT
    modelofoto *modeloFotoNotes;
    modeloInd *modeloIndividual;
    modeloMain *modeloCalifi;
    modelRandom *modeloGrupo;
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

       Q_INVOKABLE void saveNombre(QString Name);
       Q_INVOKABLE QString loadNombre();

       Q_INVOKABLE void saveFoto(QString Foto);
       Q_INVOKABLE QString loadFoto();

       Q_INVOKABLE void saveEscuela(QString Escuela);
       Q_INVOKABLE QString loadEscuela();

       Q_INVOKABLE void saveGrupo(QString Grupo);
       Q_INVOKABLE QString loadGrupo();

       Q_INVOKABLE void saveSemestre(QString Semestre);
       Q_INVOKABLE QString loadSemestre();

       Q_INVOKABLE void saveFechaInicio(QDate FechaInicio);
       Q_INVOKABLE QString loadFechaInicio();

       Q_INVOKABLE void saveFechaFinal(QDateTime FechaFinal);
       Q_INVOKABLE QString loadFechaFinal();

       Q_INVOKABLE float progress();
       Q_INVOKABLE int daysLeft();

       Q_INVOKABLE void saveMateria(QString materia, QString maestro, QTime inicio, QTime final);
       Q_INVOKABLE void loadMateria();
       Q_INVOKABLE void deleteMateria(QString materia, QString elemento);

       Q_INVOKABLE void saveCalificacion(QString materia, QString parcial, QString calificacion);
       Q_INVOKABLE void loadCalificacion();
       Q_INVOKABLE void deleteCalificacion(QString elemento);

       Q_INVOKABLE void loadCalifiMateria(QString materia);

       Q_INVOKABLE double location2double(QString location);

       Q_INVOKABLE void saveFotoNote(QString foto,QString materia, QString titulo);
       Q_INVOKABLE void loadFotoNote();
       Q_INVOKABLE void deleteFotoNote(QString elemento);

       Q_INVOKABLE int primeraVista();
       Q_INVOKABLE void primeraVistaQuitar();


       Q_INVOKABLE void share(QString thedata);
           bb::cascades::Invocation *m_pInvocation;

           public Q_SLOTS:
           	void onArmed();
           	      signals:
           	void PerfilSalvado();

private slots:
    void onSystemLanguageChanged();
private:
    QTranslator* m_pTranslator;
    bb::cascades::LocaleHandler* m_pLocaleHandler;

    Page *root;
    GroupDataModel *fotoNotasQML;

};

#endif /* ApplicationUI_HPP_ */
