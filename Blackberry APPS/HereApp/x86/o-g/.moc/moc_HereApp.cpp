/****************************************************************************
** Meta object code from reading C++ file 'HereApp.hpp'
**
** Created by: The Qt Meta Object Compiler version 63 (Qt 4.8.5)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../src/HereApp.hpp"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'HereApp.hpp' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.5. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_HereApp[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
      20,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: signature, parameters, type, tag, flags
      19,    9,    8,    8, 0x02,
      64,   46,    8,    8, 0x02,
     101,   46,    8,    8, 0x02,
     137,   46,    8,    8, 0x02,
     200,  178,    8,    8, 0x02,
     243,  233,    8,    8, 0x02,
     268,  233,    8,    8, 0x02,
     341,  294,    8,    8, 0x02,
     434,  396,    8,    8, 0x02,
     532,  475,    8,    8, 0x02,
     651,  590,    8,    8, 0x02,
     762,  716,    8,    8, 0x02,
     879,  813,    8,    8, 0x02,
     955,  947,    8,    8, 0x02,
     990,  981,    8,    8, 0x02,
    1031, 1017,    8,    8, 0x02,
    1066,  947,    8,    8, 0x02,
    1119, 1095,    8,    8, 0x02,
    1157,    8,    8,    8, 0x02,
    1181,    8,    8,    8, 0x02,

       0        // eod
};

static const char qt_meta_stringdata_HereApp[] = {
    "HereApp\0\0sheetform\0abreFormularioQML(QString)\0"
    "pageView,miTitulo\0"
    "abreVistaAlumnosQML(QString,QString)\0"
    "abreVistaAlumnoQML(QString,QString)\0"
    "abreVistaAsistenciasQML(QString,QString)\0"
    "idInstitucion,idGrupo\0"
    "vistaAlumnosSQL(QString,QString)\0"
    "txtBuscar\0filtraGruposSQL(QString)\0"
    "filtraAlumnosSQL(QString)\0"
    "txtNombre,txtTelefono,txtSitioWeb,txtUbicacion\0"
    "guardarInstitucionSQL(QString,QString,QString,QString)\0"
    "idInstitucion,txtNombre,txtNumAlumnos\0"
    "guardarGrupoSQL(QString,QString,QString)\0"
    "txtMatricula,txtNombre,txtApellidos,txtTelefono,txtEmail\0"
    "guardarAlumnoSQL(QString,QString,QString,QString,QString)\0"
    "idInstitucion,txtNombre,txtTelefono,txtSitioWeb,txtUbicacion\0"
    "modificarInstitucionSQL(QString,QString,QString,QString,QString)\0"
    "idGrupo,idInstitucion,txtNombre,txtNumAlumnos\0"
    "modificarGrupoSQL(QString,QString,QString,QString)\0"
    "idAlumno,txtMatricula,txtNombre,txtApellidos,txtTelefono,txtEmail\0"
    "modificarAlumnoSQL(QString,QString,QString,QString,QString,QString)\0"
    "idGrupo\0eliminarGrupoSQL(QString)\0"
    "idAlumno\0eliminarAlumnoSQL(QString)\0"
    "idInstitucion\0datosActualizaInstitucion(QString)\0"
    "datosActualizaGrupo(QString)\0"
    "idAlumno,tipoContenedor\0"
    "datosActualizaAlumno(QString,QString)\0"
    "listaInstitucionesSQL()\0"
    "listaFechasAsistenciasSQL()\0"
};

void HereApp::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        HereApp *_t = static_cast<HereApp *>(_o);
        switch (_id) {
        case 0: _t->abreFormularioQML((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 1: _t->abreVistaAlumnosQML((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2]))); break;
        case 2: _t->abreVistaAlumnoQML((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2]))); break;
        case 3: _t->abreVistaAsistenciasQML((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2]))); break;
        case 4: _t->vistaAlumnosSQL((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2]))); break;
        case 5: _t->filtraGruposSQL((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 6: _t->filtraAlumnosSQL((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 7: _t->guardarInstitucionSQL((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2])),(*reinterpret_cast< const QString(*)>(_a[3])),(*reinterpret_cast< const QString(*)>(_a[4]))); break;
        case 8: _t->guardarGrupoSQL((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2])),(*reinterpret_cast< const QString(*)>(_a[3]))); break;
        case 9: _t->guardarAlumnoSQL((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2])),(*reinterpret_cast< const QString(*)>(_a[3])),(*reinterpret_cast< const QString(*)>(_a[4])),(*reinterpret_cast< const QString(*)>(_a[5]))); break;
        case 10: _t->modificarInstitucionSQL((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2])),(*reinterpret_cast< const QString(*)>(_a[3])),(*reinterpret_cast< const QString(*)>(_a[4])),(*reinterpret_cast< const QString(*)>(_a[5]))); break;
        case 11: _t->modificarGrupoSQL((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2])),(*reinterpret_cast< const QString(*)>(_a[3])),(*reinterpret_cast< const QString(*)>(_a[4]))); break;
        case 12: _t->modificarAlumnoSQL((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2])),(*reinterpret_cast< const QString(*)>(_a[3])),(*reinterpret_cast< const QString(*)>(_a[4])),(*reinterpret_cast< const QString(*)>(_a[5])),(*reinterpret_cast< const QString(*)>(_a[6]))); break;
        case 13: _t->eliminarGrupoSQL((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 14: _t->eliminarAlumnoSQL((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 15: _t->datosActualizaInstitucion((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 16: _t->datosActualizaGrupo((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 17: _t->datosActualizaAlumno((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2]))); break;
        case 18: _t->listaInstitucionesSQL(); break;
        case 19: _t->listaFechasAsistenciasSQL(); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData HereApp::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject HereApp::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_HereApp,
      qt_meta_data_HereApp, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &HereApp::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *HereApp::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *HereApp::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_HereApp))
        return static_cast<void*>(const_cast< HereApp*>(this));
    return QObject::qt_metacast(_clname);
}

int HereApp::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 20)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 20;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
