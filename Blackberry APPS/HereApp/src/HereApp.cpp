// Default empty project template
#include "HereApp.hpp"

#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/NavigationPane>
#include <bb/cascades/AbstractPane>
#include <bb/cascades/GroupDataModel>
#include <bb/cascades/Container>
#include <bb/cascades/TextField>
#include <bb/cascades/TextArea>
#include <bb/cascades/DropDown>
#include <bb/cascades/StandardListItem>
#include <bb/cascades/DateTimePicker>
#include <bb/cascades/Label>
#include <bb/data/SqlConnection>
#include <bb/data/SqlDataAccess>
#include <bb/cascades/Sheet>

#include <QDebug>

using namespace bb::cascades;

HereApp::HereApp(bb::cascades::Application *app) :
		QObject(app) {


/////// se crea la UI con el navigation pane ...
	QmlDocument *qml = QmlDocument::create("asset:///main.qml").parent(this);
	qml->setContextProperty("_HereApp", this);
	root = qml->createRootObject<NavigationPane>();
	app->setScene(root);
/////////////


	//COPIAR BASE DE DATOS?......
	if (copiarBd()) { //manda a llamar a copiar base de datos... y si es correcto se ejecuta lo siguiente..
		miRutaBd = "./data/here";     // LA RUTA PARA GUARDAR LA BASE DE DATOS EN UN QSTRING

		SqlDataAccess miAccesoDatosSQL(miRutaBd);      //RUTA DE ACCESO EN SQL CON LA RUTA ESPECIFICADA EN MIRUTABD

		if (miAccesoDatosSQL.hasError()) {  // SI HUBO ALGUN ERROR AL ESCRIBIR LA RUTA DE LA BASE DE DATOS....
			DataAccessError err = miAccesoDatosSQL.error();
			qWarning() << "SQL error: type=" << err.errorType() << ": "
					<< err.errorMessage();

		}
		//PROSIGUE CON EL PROCESO DE COPIAR LA BASE DE DATOS:....

		//miBd = QSLDATABASE::: LO ESTA IGUALANDO A ALGUN TIPO DE BASE DE DATOS???

		miBd = QSqlDatabase::addDatabase("QSQLITE",
				"database_helper_connection");
		//Se le asigno la ruta de la base de datos anteriormente escrita
		miBd.setDatabaseName(miRutaBd);

		//si la ruta o algo de lo anterior no es valido......
		if (!miBd.isValid()) {
			qWarning()
					<< "Could not set database name, probably due to an invalid driver.";

		}
		//se crea un bolean de qe todo salio bien
		bool success = miBd.open();

		//si no salio bien... pues...
		if (!success) {
			qWarning() << "Could not open database.";
		}




		//manda a llamar a vistasGrupos
		vistaGruposSQL();

		//parsea la listview de la vista aciva? ....
		listaGrupos = root->findChild<ListView*>("listaGrupos");


	}
}

bool HereApp::copiarBd() {

	//se copia la base de datos......

	QString dataFolder = QDir::homePath();
	QString archivoBdNuevo = dataFolder + "/here";
	QFile archivoNuevo(archivoBdNuevo);

	if (!archivoNuevo.exists()) {
		QString appFolder(QDir::homePath());
		appFolder.chop(4);
		QString archivoBdOriginal = appFolder + "app/native/assets/sql/here";
		QFile archivoOriginal(archivoBdOriginal);

		if (archivoOriginal.exists()) {
			return archivoOriginal.copy(archivoBdNuevo);
		} else {
			qDebug()
					<< "Imposible copiar la base de datos, la base de datos no existe.";
			return false;
		}
	}

	return true;
}

void HereApp::abreFormularioQML(const QString &sheetform)
{
	qmlFormularioActual = QmlDocument::create(
			"asset:///forms/" + sheetform + ".qml").parent(this);
	qmlFormularioActual->setContextProperty("_HereApp", this);
	sheetFormulario = qmlFormularioActual->createRootObject<Sheet>();
	sheetFormulario->open();
}

void HereApp::abreVistaAlumnosQML(const QString &pageView, const QString &miTitulo)
{
	qmlVistaAlumnos =
			QmlDocument::create("asset:///views/" + pageView + ".qml").parent(
					this);
	qmlVistaAlumnos->setContextProperty("_HereApp", this);
	pageVistaAlumnos = qmlVistaAlumnos->createRootObject<Page>();
	pageVistaAlumnos->setProperty("miTituloVista", miTitulo);
	root->push(pageVistaAlumnos);
}

void HereApp::abreVistaAlumnoQML(const QString &pageView, const QString &miTitulo)
{
	qmlVistaAlumno =
			QmlDocument::create("asset:///views/" + pageView + ".qml").parent(
					this);
	qmlVistaAlumno->setContextProperty("_HereApp", this);
	pageVistaAlumno = qmlVistaAlumno->createRootObject<Page>();
	pageVistaAlumno->setProperty("miTituloVista", miTitulo);
	root->push(pageVistaAlumno);
}

void HereApp::abreVistaAsistenciasQML(const QString &pageView, const QString &miTitulo){
	qmlVistaAsistencias =
			QmlDocument::create("asset:///views/" + pageView + ".qml").parent(
					this);
	qmlVistaAsistencias->setContextProperty("_HereApp", this);
	pageVistaAsistencias = qmlVistaAsistencias->createRootObject<Page>();
	pageVistaAsistencias->setProperty("miTituloVista", miTitulo);
	root->push(pageVistaAsistencias);
}

void HereApp::vistaGruposSQL() {

	//ACCEDE A LA INFORMACION DE LA BASE DE DATOS PIDIENDO LOS GRUPOS????

	QVariantList sqlListaGrupos;
	SqlDataAccess miAccesoDatosSQL(miRutaBd);

	sqlListaGrupos =
			miAccesoDatosSQL.execute(
					"SELECT instituciones.*, grupos.* FROM instituciones LEFT JOIN grupos ON(instituciones.idinstitucion=grupos.idinstitucion) WHERE grupos.grupo!=''").value<
					QVariantList>();

	if (miAccesoDatosSQL.hasError()) {
		DataAccessError err = miAccesoDatosSQL.error();
		qWarning() << "SQL error: type=" << err.errorType() << ": "
				<< err.errorMessage();
	}

	if (!sqlListaGrupos.isEmpty()) {
		gruposDM = root->findChild<GroupDataModel*>("gruposDM");
		gruposDM->insertList(sqlListaGrupos);
	}
}


void HereApp::vistaAlumnosSQL(const QString &idInstitucion, const QString &idGrupo) {

	//const int miIdInstitucion = idInstitucion.toInt();
	//const int miIdGrupo = idGrupo.toInt();


	//PIDE LOS DATOS DE LOS ALUMNOS

    miIdInstitucionSelec = idInstitucion;
    miIdGrupoSelec = idGrupo;

	QVariantList sqlListaAlumnos;
	SqlDataAccess miAccesoDatosSQL(miRutaBd);

	sqlListaAlumnos =
			miAccesoDatosSQL.execute("SELECT alumnos.*, grupos.* FROM alumnos LEFT JOIN grupos ON(alumnos.idgrupo=grupos.idgrupo) WHERE alumnos.idinstitucion='"+miIdInstitucionSelec+"' AND alumnos.idgrupo='"+miIdGrupoSelec+"'").value<
					QVariantList>();

	if (miAccesoDatosSQL.hasError()) {
		DataAccessError err = miAccesoDatosSQL.error();
		qWarning() << "SQL error: type=" << err.errorType() << ": "
				<< err.errorMessage();
	}

	if (!sqlListaAlumnos.isEmpty()) {
		alumnosDM = pageVistaAlumnos->findChild<GroupDataModel*>("alumnosDM");
		alumnosDM->insertList(sqlListaAlumnos);
	}

}

void HereApp::filtraGruposSQL(const QString &txtBuscar) {



	QVariantList sqlListaGrupos;
	SqlDataAccess miAccesoDatosSQL(miRutaBd);

	sqlListaGrupos =
			miAccesoDatosSQL.execute(
					"SELECT instituciones.*, grupos.* FROM instituciones LEFT JOIN grupos ON(instituciones.idinstitucion=grupos.idinstitucion) WHERE grupos.grupo LIKE '%"
							+ txtBuscar + "%'").value<QVariantList>();

	if (miAccesoDatosSQL.hasError()) {
		DataAccessError err = miAccesoDatosSQL.error();
		qWarning() << "SQL error: type=" << err.errorType() << ": "
				<< err.errorMessage();
	}

	if (!sqlListaGrupos.isEmpty()) {
		gruposDM->clear();
		gruposDM = root->findChild<GroupDataModel*>("gruposDM");
		gruposDM->insertList(sqlListaGrupos);
	}

}

void HereApp::filtraAlumnosSQL(const QString &txtBuscar) {

	QVariantList sqlListaAlumnos;
	SqlDataAccess miAccesoDatosSQL(miRutaBd);

	sqlListaAlumnos =
			miAccesoDatosSQL.execute(
					"SELECT alumnos.*, grupos.* FROM alumnos LEFT JOIN grupos ON(alumnos.idgrupo=grupos.idgrupo) WHERE alumnos.idinstitucion='"
							+ miIdInstitucionSelec + "' AND alumnos.idgrupo='"
							+ miIdGrupoSelec + "' AND alumnos.nombre LIKE '%"
							+ txtBuscar + "%' ").value<QVariantList>();

	if (miAccesoDatosSQL.hasError()) {
		DataAccessError err = miAccesoDatosSQL.error();
		qWarning() << "SQL error: type=" << err.errorType() << ": "
				<< err.errorMessage();
	}

	if (!sqlListaAlumnos.isEmpty()) {
		alumnosDM->clear();
		alumnosDM = pageVistaAlumnos->findChild<GroupDataModel*>("alumnosDM");
		alumnosDM->insertList(sqlListaAlumnos);
	}

}

void HereApp::guardarInstitucionSQL(const QString &txtNombre,
		const QString &txtTelefono, const QString &txtSitioWeb,
		const QString &txtUbicacion) {

	QSqlQuery sqlQuery(miBd);

	sqlQuery.prepare(
			"INSERT INTO instituciones (institucion, telefono, sitioweb, ubicacion) VALUES (:nombre,:telefono,:sitioweb,:ubicacion)");

	sqlQuery.bindValue(":nombre", txtNombre);
	sqlQuery.bindValue(":telefono", txtTelefono);
	sqlQuery.bindValue(":sitioweb", txtSitioWeb);
	sqlQuery.bindValue(":ubicacion", txtUbicacion);

	if (sqlQuery.exec()) {
		sheetFormulario->close();
		gruposDM->clear();
		vistaGruposSQL();
	} else {
		QSqlError err = sqlQuery.lastError();
		qWarning() << "SQL reported an error : " << err.text();
	}

}

void HereApp::guardarGrupoSQL(const QString &idInstitucion,
		const QString &txtNombre, const QString &txtNumAlumnos) {

	const int miIdInstitucion = idInstitucion.toInt();

	QSqlQuery sqlQuery(miBd);
	sqlQuery.prepare(
			"INSERT INTO grupos"
					"    (idinstitucion, grupo, noalumnos) VALUES (:idinstitucion, :grupo, :noalumnos)");

	sqlQuery.bindValue(":idinstitucion", miIdInstitucion);
	sqlQuery.bindValue(":grupo", txtNombre);
	sqlQuery.bindValue(":noalumnos", txtNumAlumnos);

	if (sqlQuery.exec()) {
		sheetFormulario->close();
		gruposDM->clear();
		vistaGruposSQL();
	} else {
		QSqlError err = sqlQuery.lastError();
		qWarning() << "SQL reported an error : " << err.text();
	}

}

void HereApp::guardarAlumnoSQL(const QString &txtMatricula,
		const QString &txtNombre, const QString &txtApellidos,
		const QString &txtTelefono, const QString &txtEmail) {

	const int miIdInstitucion = miIdInstitucionSelec.toInt();
	const int miIdGrupo = miIdGrupoSelec.toInt();

	QSqlQuery sqlQuery(miBd);

	sqlQuery.prepare(
			"INSERT INTO alumnos"
					"    (idinstitucion, idgrupo, matricula, nombre, apellidos, telefono, email) VALUES (:idinstitucion, :idgrupo, :matricula, :nombre, :apellidos, :telefono, :email)");

	sqlQuery.bindValue(":idinstitucion", miIdInstitucion);
	sqlQuery.bindValue(":idgrupo", miIdGrupo);
	sqlQuery.bindValue(":matricula", txtMatricula);
	sqlQuery.bindValue(":nombre", txtNombre);
	sqlQuery.bindValue(":apellidos", txtApellidos);
	sqlQuery.bindValue(":telefono", txtTelefono);
	sqlQuery.bindValue(":email", txtEmail);

	if (sqlQuery.exec()) {
		sheetFormulario->close();
		alumnosDM->clear();
		vistaAlumnosSQL(miIdInstitucionSelec, miIdGrupoSelec);
	} else {
		QSqlError err = sqlQuery.lastError();
		qWarning() << "SQL reported an error : " << err.text();
	}

}

void HereApp::modificarInstitucionSQL(const QString &idInstitucion,
		const QString &txtNombre, const QString &txtTelefono,
		const QString &txtSitioWeb, const QString &txtUbicacion) {

	const int miIdInstitucion = idInstitucion.toInt();

	QSqlQuery sqlQuery(miBd);
	sqlQuery.prepare(
			"UPDATE instituciones SET institucion=:institucion, telefono=:telefono, sitioweb=:sitioweb, ubicacion=:ubicacion WHERE idinstitucion=:idinstitucion");

	sqlQuery.bindValue(":idinstitucion", miIdInstitucion);
	sqlQuery.bindValue(":institucion", txtNombre);
	sqlQuery.bindValue(":telefono", txtTelefono);
	sqlQuery.bindValue(":sitioweb", txtSitioWeb);
	sqlQuery.bindValue(":ubicacion", txtUbicacion);

	if (sqlQuery.exec()) {
		sheetFormulario->close();
		gruposDM->clear();
		vistaGruposSQL();
	} else {
		QSqlError err = sqlQuery.lastError();
		qWarning() << "SQL reported an error : " << err.text();
	}
}

void HereApp::modificarGrupoSQL(const QString &idGrupo, const QString &idInstitucion,
		const QString &txtNombre, const QString &txtNumAlumnos) {

	const int miIdGrupo = idGrupo.toInt();
	const int miIdInstitucion = idInstitucion.toInt();

	QSqlQuery sqlQuery(miBd);
	sqlQuery.prepare(
			"UPDATE grupos SET idinstitucion=:idinstitucion, grupo=:grupo, noalumnos=:noalumnos WHERE idgrupo=:idgrupo");

	sqlQuery.bindValue(":idgrupo", miIdGrupo);
	sqlQuery.bindValue(":idinstitucion", miIdInstitucion);
	sqlQuery.bindValue(":grupo", txtNombre);
	sqlQuery.bindValue(":noalumnos", txtNumAlumnos);

	if (sqlQuery.exec()) {
		sheetFormulario->close();
		gruposDM->clear();
		vistaGruposSQL();
	} else {
		QSqlError err = sqlQuery.lastError();
		qWarning() << "SQL reported an error : " << err.text();
	}

}

void HereApp::modificarAlumnoSQL(const QString &idAlumno, const QString &txtMatricula,
		const QString &txtNombre, const QString &txtApellidos,
		const QString &txtTelefono, const QString &txtEmail) {

	const int miIdAlumno = idAlumno.toInt();

	QSqlQuery sqlQuery(miBd);
	sqlQuery.prepare(
			"UPDATE alumnos SET matricula=:matricula, nombre=:nombre, apellidos=:apellidos, telefono=:telefono, email=:email WHERE idalumno=:idalumno");

	sqlQuery.bindValue(":idalumno", miIdAlumno);
	sqlQuery.bindValue(":matricula", txtMatricula);
	sqlQuery.bindValue(":nombre", txtNombre);
	sqlQuery.bindValue(":apellidos", txtApellidos);
	sqlQuery.bindValue(":telefono", txtTelefono);
	sqlQuery.bindValue(":email", txtEmail);

	if (sqlQuery.exec()) {
		sheetFormulario->close();
		alumnosDM->clear();
		vistaAlumnosSQL(miIdInstitucionSelec, miIdGrupoSelec);
	} else {
		QSqlError err = sqlQuery.lastError();
		qWarning() << "SQL reported an error : " << err.text();
	}

}

void HereApp::eliminarGrupoSQL(const QString &idGrupo){

	const int miIdGrupo = idGrupo.toInt();

	QSqlQuery sqlQuery(miBd);
	sqlQuery.prepare("DELETE FROM grupos WHERE idgrupo=:idgrupo");
	sqlQuery.bindValue(":idgrupo", miIdGrupo);

	QSqlQuery sqlQuery2(miBd);
	sqlQuery2.prepare("DELETE FROM alumnos WHERE idgrupo=:idgrupo");
	sqlQuery2.bindValue(":idgrupo", miIdGrupo);

	if (sqlQuery.exec()) {
		sqlQuery2.exec();
		gruposDM->clear();
		vistaGruposSQL();
	} else {
		QSqlError err = sqlQuery.lastError();
		qWarning() << "SQL reported an error : " << err.text();
	}
}

void HereApp::eliminarAlumnoSQL(const QString &idAlumno){

	const int miIdAlumno = idAlumno.toInt();

	QSqlQuery sqlQuery(miBd);
	sqlQuery.prepare("DELETE FROM alumnos WHERE idalumno=:idalumno");
	sqlQuery.bindValue(":idalumno", miIdAlumno);

	if (sqlQuery.exec()) {
		alumnosDM->clear();
		vistaAlumnosSQL(miIdInstitucionSelec, miIdGrupoSelec);
	} else {
		QSqlError err = sqlQuery.lastError();
		qWarning() << "SQL reported an error : " << err.text();
	}
}

void HereApp::datosActualizaInstitucion(const QString &idInstitucion){
	miIdInstitucionSelec = idInstitucion;

	QVariantList sqlDatosInstitucion;
	SqlDataAccess miAccesoDatosSQL(miRutaBd);

	sqlDatosInstitucion = miAccesoDatosSQL.execute(
			"SELECT * FROM instituciones WHERE idinstitucion='"
					+ miIdInstitucionSelec + "'").value<QVariantList>();

	if (miAccesoDatosSQL.hasError()) {
		DataAccessError err = miAccesoDatosSQL.error();
		qWarning() << "SQL error: type=" << err.errorType() << ": "
				<< err.errorMessage();
	}

	contFormulario = sheetFormulario->findChild<Container*>("contFormInstitucion");
	TextField *txtNombre = contFormulario->findChild<TextField*>("txtNombre");
	TextField *txtTelefono = contFormulario->findChild<TextField*>("txtTelefono");
	TextField *txtSitioWeb = contFormulario->findChild<TextField*>("txtSitioWeb");
	TextArea *txtUbicacion = contFormulario->findChild<TextArea*>("txtUbicacion");

	QVariant data  = sqlDatosInstitucion.at(0);
	QMap<QString, QVariant> map = data.toMap();

	txtNombre->setText(map["institucion"].toString());
	txtTelefono->setText(map["telefono"].toString());
	txtSitioWeb->setText(map["sitioweb"].toString());
	txtUbicacion->setText(map["ubicacion"].toString());

	sheetFormulario->setProperty("idInstitucion", miIdInstitucionSelec);

}

void HereApp::datosActualizaGrupo(const QString &idGrupo){

	miIdGrupoSelec = idGrupo;

	QVariantList sqlDatosGrupo;
	SqlDataAccess miAccesoDatosSQL(miRutaBd);

	sqlDatosGrupo =
			miAccesoDatosSQL.execute(
					"SELECT instituciones.*, grupos.* FROM instituciones LEFT JOIN grupos ON(instituciones.idinstitucion=grupos.idinstitucion) WHERE grupos.idgrupo='"
							+ miIdGrupoSelec + "'").value<QVariantList>();

	if (miAccesoDatosSQL.hasError()) {
		DataAccessError err = miAccesoDatosSQL.error();
		qWarning() << "SQL error: type=" << err.errorType() << ": "
				<< err.errorMessage();
	}

	contFormulario = sheetFormulario->findChild<Container*>("contFormGrupo");
	TextField *txtNombre = contFormulario->findChild<TextField*>("txtNombre");
	TextField *txtNumAlumnos = contFormulario->findChild<TextField*>("txtNumAlumnos");
	DropDown *listaInstituciones = contFormulario->findChild<DropDown*>("listaInstituciones");

	QVariant data  = sqlDatosGrupo.at(0);
	QMap<QString, QVariant> map = data.toMap();

	txtNombre->setText(map["grupo"].toString());
	txtNumAlumnos->setText(map["noalumnos"].toString());
	listaInstituciones->setSelectedIndex(map["idinstitucion"].toInt()-1);

	sheetFormulario->setProperty("idGrupo", miIdGrupoSelec);
}

void HereApp::datosActualizaAlumno(const QString &idAlumno, const QString &tipoContenedor){

	QVariantList sqlDatosAlumno;
	SqlDataAccess miAccesoDatosSQL(miRutaBd);

	sqlDatosAlumno =
			miAccesoDatosSQL.execute(
					"SELECT * FROM alumnos WHERE idalumno='"+idAlumno+"'").value<QVariantList>();

	if (miAccesoDatosSQL.hasError()) {
		DataAccessError err = miAccesoDatosSQL.error();
		qWarning() << "SQL error: type=" << err.errorType() << ": "
				<< err.errorMessage();
	}


	QVariant data  = sqlDatosAlumno.at(0);
	QMap<QString, QVariant> map = data.toMap();

	if (tipoContenedor == "form") {
		contFormulario = sheetFormulario->findChild<Container*>("contFormAlumno");
		TextField *txtMatricula = contFormulario->findChild<TextField*>(
				"txtMatricula");
		TextField *txtNombre = contFormulario->findChild<TextField*>(
				"txtNombre");
		TextField *txtApellidos = contFormulario->findChild<TextField*>(
				"txtApellidos");
		TextField *txtTelefono = contFormulario->findChild<TextField*>(
				"txtTelefono");
		TextField *txtEmail = contFormulario->findChild<TextField*>("txtEmail");

		txtMatricula->setText(map["matricula"].toString());
		txtNombre->setText(map["nombre"].toString());
		txtApellidos->setText(map["apellidos"].toString());
		txtTelefono->setText(map["telefono"].toString());
		txtEmail->setText(map["email"].toString());

		sheetFormulario->setProperty("idAlumno", map["idalumno"].toString());

	} else {
		contFormulario = pageVistaAlumno->findChild<Container*>("contVistaAlumno");
		Label *txtMatricula = contFormulario->findChild<Label*>("txtMatricula");
		Label *txtNombre = contFormulario->findChild<Label*>("txtNombre");
		StandardListItem *txtTelefono = contFormulario->findChild<StandardListItem*>("txtTelefono");
		StandardListItem *txtEmail = contFormulario->findChild<StandardListItem*>("txtEmail");

		txtMatricula->setText(map["matricula"].toString());
		txtNombre->setText(map["nombre"].toString()+" "+map["apellidos"].toString());
		txtTelefono->setTitle(map["telefono"].toString());
		txtTelefono->setDescription("Llamar a Movil");
		txtEmail->setTitle(map["email"].toString());
		txtEmail->setDescription("Enviar Correo");

		pageVistaAlumno->setProperty("idAlumno", map["idalumno"].toString());
	}

}


void HereApp::listaInstitucionesSQL(){

	QVariantList sqlListaInstituciones;
	SqlDataAccess miAccesoDatosSQL(miRutaBd);

	sqlListaInstituciones =
				miAccesoDatosSQL.execute("SELECT * FROM instituciones").value<QVariantList>();

	if (miAccesoDatosSQL.hasError()) {
		DataAccessError err = miAccesoDatosSQL.error();
		qWarning() << "SQL error: type=" << err.errorType() << ": "
				<< err.errorMessage();
	}


	contFormulario = sheetFormulario->findChild<Container*>("contFormGrupo");
	DropDown *listaInstituciones = contFormulario->findChild<DropDown*>("listaInstituciones");

	for(int i=0; i < sqlListaInstituciones.size(); i++)
	{

		Option *OpcInstituciones = new Option();

		QVariant data  = sqlListaInstituciones.at(i);
		QMap<QString, QVariant> map = data.toMap();
		QString institucion = map["institucion"].toString();
		QString idinstitucion = map["idinstitucion"].toString();

		OpcInstituciones->setText(institucion);
		OpcInstituciones->setValue(idinstitucion);
		listaInstituciones->add(OpcInstituciones);
	}

}


void HereApp::listaFechasAsistenciasSQL(){

	QVariantList sqlListaFechasAsist;
	SqlDataAccess miAccesoDatosSQL(miRutaBd);

	sqlListaFechasAsist = miAccesoDatosSQL.execute(
			"SELECT DISTINCT fecha FROM asistencias").value<QVariantList>();

	if (miAccesoDatosSQL.hasError()) {
		DataAccessError err = miAccesoDatosSQL.error();
		qWarning() << "SQL error: type=" << err.errorType() << ": "
				<< err.errorMessage();
	}

	contFormulario = pageVistaAsistencias->findChild<Container*>("contListaAsistencias");
	DateTimePicker *historialFechas = contFormulario->findChild<DateTimePicker*>("historialFechas");

	historialFechas->setValue(QDateTime(QDate(2013,03,02)));
}
