/****************************************************************************
** Meta object code from reading C++ file 'applicationui.hpp'
**
** Created by: The Qt Meta Object Compiler version 63 (Qt 4.8.5)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../src/applicationui.hpp"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'applicationui.hpp' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.5. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_ApplicationUI[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
      40,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: signature, parameters, type, tag, flags
      15,   14,   14,   14, 0x05,

 // slots: signature, parameters, type, tag, flags
      31,   14,   14,   14, 0x0a,
      41,   14,   14,   14, 0x08,

 // methods: signature, parameters, type, tag, flags
      72,   67,   14,   14, 0x02,
      89,   14,   14,   14, 0x02,
     100,   14,   14,   14, 0x02,
     124,  111,   14,   14, 0x02,
     153,  146,   14,   14, 0x02,
     193,  169,   14,   14, 0x02,
     234,   14,   14,   14, 0x02,
     252,  247,   14,   14, 0x02,
     280,   14,  272,   14, 0x02,
     298,  293,   14,   14, 0x02,
     316,   14,  272,   14, 0x02,
     335,  327,   14,   14, 0x02,
     356,   14,  272,   14, 0x02,
     376,  370,   14,   14, 0x02,
     395,   14,  272,   14, 0x02,
     416,  407,   14,   14, 0x02,
     438,   14,  272,   14, 0x02,
     465,  453,   14,   14, 0x02,
     488,   14,  272,   14, 0x02,
     517,  506,   14,   14, 0x02,
     543,   14,  272,   14, 0x02,
     566,   14,  560,   14, 0x02,
     581,   14,  577,   14, 0x02,
     621,  592,   14,   14, 0x02,
     662,   14,   14,   14, 0x02,
     693,  676,   14,   14, 0x02,
     753,  724,   14,   14, 0x02,
     795,   14,   14,   14, 0x02,
     823,  814,   14,   14, 0x02,
     859,  851,   14,   14, 0x02,
     902,  893,  886,   14, 0x02,
     947,  927,   14,   14, 0x02,
     985,   14,   14,   14, 0x02,
    1000,  814,   14,   14, 0x02,
    1024,   14,  577,   14, 0x02,
    1039,   14,   14,   14, 0x02,
    1068, 1060,   14,   14, 0x02,

       0        // eod
};

static const char qt_meta_stringdata_ApplicationUI[] = {
    "ApplicationUI\0\0PerfilSalvado()\0onArmed()\0"
    "onSystemLanguageChanged()\0data\0"
    "addData(QString)\0saveData()\0loadData()\0"
    "indice,texto\0editData(int,QString)\0"
    "indice\0deleteData(int)\0Subject,Finish,reminder\0"
    "addNewEvent(QString,QDateTime,QDateTime)\0"
    "loadEvents()\0Name\0saveNombre(QString)\0"
    "QString\0loadNombre()\0Foto\0saveFoto(QString)\0"
    "loadFoto()\0Escuela\0saveEscuela(QString)\0"
    "loadEscuela()\0Grupo\0saveGrupo(QString)\0"
    "loadGrupo()\0Semestre\0saveSemestre(QString)\0"
    "loadSemestre()\0FechaInicio\0"
    "saveFechaInicio(QDate)\0loadFechaInicio()\0"
    "FechaFinal\0saveFechaFinal(QDateTime)\0"
    "loadFechaFinal()\0float\0progress()\0int\0"
    "daysLeft()\0materia,maestro,inicio,final\0"
    "saveMateria(QString,QString,QTime,QTime)\0"
    "loadMateria()\0materia,elemento\0"
    "deleteMateria(QString,QString)\0"
    "materia,parcial,calificacion\0"
    "saveCalificacion(QString,QString,QString)\0"
    "loadCalificacion()\0elemento\0"
    "deleteCalificacion(QString)\0materia\0"
    "loadCalifiMateria(QString)\0double\0"
    "location\0location2double(QString)\0"
    "foto,materia,titulo\0"
    "saveFotoNote(QString,QString,QString)\0"
    "loadFotoNote()\0deleteFotoNote(QString)\0"
    "primeraVista()\0primeraVistaQuitar()\0"
    "thedata\0share(QString)\0"
};

void ApplicationUI::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        ApplicationUI *_t = static_cast<ApplicationUI *>(_o);
        switch (_id) {
        case 0: _t->PerfilSalvado(); break;
        case 1: _t->onArmed(); break;
        case 2: _t->onSystemLanguageChanged(); break;
        case 3: _t->addData((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 4: _t->saveData(); break;
        case 5: _t->loadData(); break;
        case 6: _t->editData((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2]))); break;
        case 7: _t->deleteData((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 8: _t->addNewEvent((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QDateTime(*)>(_a[2])),(*reinterpret_cast< QDateTime(*)>(_a[3]))); break;
        case 9: _t->loadEvents(); break;
        case 10: _t->saveNombre((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 11: { QString _r = _t->loadNombre();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        case 12: _t->saveFoto((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 13: { QString _r = _t->loadFoto();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        case 14: _t->saveEscuela((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 15: { QString _r = _t->loadEscuela();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        case 16: _t->saveGrupo((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 17: { QString _r = _t->loadGrupo();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        case 18: _t->saveSemestre((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 19: { QString _r = _t->loadSemestre();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        case 20: _t->saveFechaInicio((*reinterpret_cast< QDate(*)>(_a[1]))); break;
        case 21: { QString _r = _t->loadFechaInicio();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        case 22: _t->saveFechaFinal((*reinterpret_cast< QDateTime(*)>(_a[1]))); break;
        case 23: { QString _r = _t->loadFechaFinal();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        case 24: { float _r = _t->progress();
            if (_a[0]) *reinterpret_cast< float*>(_a[0]) = _r; }  break;
        case 25: { int _r = _t->daysLeft();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 26: _t->saveMateria((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])),(*reinterpret_cast< QTime(*)>(_a[3])),(*reinterpret_cast< QTime(*)>(_a[4]))); break;
        case 27: _t->loadMateria(); break;
        case 28: _t->deleteMateria((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2]))); break;
        case 29: _t->saveCalificacion((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])),(*reinterpret_cast< QString(*)>(_a[3]))); break;
        case 30: _t->loadCalificacion(); break;
        case 31: _t->deleteCalificacion((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 32: _t->loadCalifiMateria((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 33: { double _r = _t->location2double((*reinterpret_cast< QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< double*>(_a[0]) = _r; }  break;
        case 34: _t->saveFotoNote((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])),(*reinterpret_cast< QString(*)>(_a[3]))); break;
        case 35: _t->loadFotoNote(); break;
        case 36: _t->deleteFotoNote((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 37: { int _r = _t->primeraVista();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 38: _t->primeraVistaQuitar(); break;
        case 39: _t->share((*reinterpret_cast< QString(*)>(_a[1]))); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData ApplicationUI::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject ApplicationUI::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_ApplicationUI,
      qt_meta_data_ApplicationUI, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &ApplicationUI::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *ApplicationUI::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *ApplicationUI::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_ApplicationUI))
        return static_cast<void*>(const_cast< ApplicationUI*>(this));
    return QObject::qt_metacast(_clname);
}

int ApplicationUI::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 40)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 40;
    }
    return _id;
}

// SIGNAL 0
void ApplicationUI::PerfilSalvado()
{
    QMetaObject::activate(this, &staticMetaObject, 0, 0);
}
QT_END_MOC_NAMESPACE
