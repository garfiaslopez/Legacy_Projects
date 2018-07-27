// Default empty project template
#ifndef HereApp_HPP_
#define HereApp_HPP_

#include <bb/cascades/NavigationPane>
#include <bb/cascades/AbstractPane>
#include <bb/cascades/ListView>
#include <bb/cascades/GroupDataModel>
#include <bb/cascades/Sheet>
#include <bb/cascades/QmlDocument>
#include <bb/data/SqlDataAccess>
#include <bb/cascades/Container>
#include <QObject>
#include <QtSql/QtSql>

using namespace bb::cascades;
using namespace bb::data;

namespace bb {
namespace cascades {
	class Application;
	}
}

/*!
 * @brief Application pane object
 *
 *Use this object to create and init app UI, to create context objects, to register the new meta types etc.
 */
class HereApp : public QObject
{
    Q_OBJECT
public:
    HereApp(bb::cascades::Application *app);
    virtual ~HereApp() {}

    bool copiarBd();
    void vistaGruposSQL();

    Q_INVOKABLE
    void abreFormularioQML(const QString &sheetform);

	Q_INVOKABLE
	void abreVistaAlumnosQML(const QString &pageView, const QString &miTitulo);

	Q_INVOKABLE
	void abreVistaAlumnoQML(const QString &pageView, const QString &miTitulo);

	Q_INVOKABLE
	void abreVistaAsistenciasQML(const QString &pageView, const QString &miTitulo);

    Q_INVOKABLE
    void vistaAlumnosSQL(const QString &idInstitucion, const QString &idGrupo);

    Q_INVOKABLE
    void filtraGruposSQL(const QString &txtBuscar);

    Q_INVOKABLE
    void filtraAlumnosSQL(const QString &txtBuscar);

	Q_INVOKABLE
	void guardarInstitucionSQL(const QString &txtNombre,
			const QString &txtTelefono, const QString &txtSitioWeb,
			const QString &txtUbicacion);

	Q_INVOKABLE
	void guardarGrupoSQL(const QString &idInstitucion, const QString &txtNombre,
			const QString &txtNumAlumnos);

	Q_INVOKABLE
	void guardarAlumnoSQL(const QString &txtMatricula, const QString &txtNombre,
			const QString &txtApellidos, const QString &txtTelefono,
			const QString &txtEmail);

	Q_INVOKABLE
	void modificarInstitucionSQL(const QString &idInstitucion,
			const QString &txtNombre, const QString &txtTelefono,
			const QString &txtSitioWeb, const QString &txtUbicacion);

	Q_INVOKABLE
	void modificarGrupoSQL(const QString &idGrupo, const QString &idInstitucion,
			const QString &txtNombre, const QString &txtNumAlumnos);

	Q_INVOKABLE
	void modificarAlumnoSQL(const QString &idAlumno,
			const QString &txtMatricula, const QString &txtNombre,
			const QString &txtApellidos, const QString &txtTelefono,
			const QString &txtEmail);

	Q_INVOKABLE
	void eliminarGrupoSQL(const QString &idGrupo);

	Q_INVOKABLE
	void eliminarAlumnoSQL(const QString &idAlumno);

	Q_INVOKABLE
	void datosActualizaInstitucion(const QString &idInstitucion);

	Q_INVOKABLE
	void datosActualizaGrupo(const QString &idGrupo);

	Q_INVOKABLE
	void datosActualizaAlumno(const QString &idAlumno, const QString &tipoContenedor);

	Q_INVOKABLE
	void listaInstitucionesSQL();

	Q_INVOKABLE
	void listaFechasAsistenciasSQL();

private:
    NavigationPane *root;
    ListView *listaGrupos;

    GroupDataModel *gruposDM;
    GroupDataModel *alumnosDM;

    QmlDocument *qmlFormularioActual;
    QmlDocument *qmlVistaAlumnos;
    QmlDocument *qmlVistaAlumno;
    QmlDocument *qmlVistaAsistencias;

    Page *pageVistaAsistencias;
    Page *pageVistaAlumnos;
    Page *pageVistaAlumno;
    Sheet *sheetFormulario;
    Container *contFormulario;

    QSqlDatabase miBd;
    QString miRutaBd;
    QString miIdInstitucionSelec;
    QString miIdGrupoSelec;
};

#endif /* HereApp_HPP_ */
