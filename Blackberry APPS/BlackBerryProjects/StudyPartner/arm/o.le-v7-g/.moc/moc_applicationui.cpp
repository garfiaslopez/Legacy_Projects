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
      10,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: signature, parameters, type, tag, flags
      15,   14,   14,   14, 0x0a,
      25,   14,   14,   14, 0x08,

 // methods: signature, parameters, type, tag, flags
      56,   51,   14,   14, 0x02,
      73,   14,   14,   14, 0x02,
      84,   14,   14,   14, 0x02,
     108,   95,   14,   14, 0x02,
     137,  130,   14,   14, 0x02,
     177,  153,   14,   14, 0x02,
     218,   14,   14,   14, 0x02,
     239,  231,   14,   14, 0x02,

       0        // eod
};

static const char qt_meta_stringdata_ApplicationUI[] = {
    "ApplicationUI\0\0onArmed()\0"
    "onSystemLanguageChanged()\0data\0"
    "addData(QString)\0saveData()\0loadData()\0"
    "indice,texto\0editData(int,QString)\0"
    "indice\0deleteData(int)\0Subject,Finish,reminder\0"
    "addNewEvent(QString,QDateTime,QDateTime)\0"
    "loadEvents()\0thedata\0share(QString)\0"
};

void ApplicationUI::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        ApplicationUI *_t = static_cast<ApplicationUI *>(_o);
        switch (_id) {
        case 0: _t->onArmed(); break;
        case 1: _t->onSystemLanguageChanged(); break;
        case 2: _t->addData((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 3: _t->saveData(); break;
        case 4: _t->loadData(); break;
        case 5: _t->editData((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2]))); break;
        case 6: _t->deleteData((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 7: _t->addNewEvent((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QDateTime(*)>(_a[2])),(*reinterpret_cast< QDateTime(*)>(_a[3]))); break;
        case 8: _t->loadEvents(); break;
        case 9: _t->share((*reinterpret_cast< QString(*)>(_a[1]))); break;
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
        if (_id < 10)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 10;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
