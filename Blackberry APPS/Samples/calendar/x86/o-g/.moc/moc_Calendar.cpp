/****************************************************************************
** Meta object code from reading C++ file 'Calendar.hpp'
**
** Created by: The Qt Meta Object Compiler version 63 (Qt 4.8.5)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../src/Calendar.hpp"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'Calendar.hpp' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.5. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_Calendar[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       7,   14, // methods
       4,   49, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: signature, parameters, type, tag, flags
      10,    9,    9,    9, 0x05,

 // slots: signature, parameters, type, tag, flags
      36,   26,    9,    9, 0x0a,
      66,    9,    9,    9, 0x0a,
      80,    9,    9,    9, 0x0a,
      92,    9,    9,    9, 0x0a,
     104,    9,    9,    9, 0x0a,
     118,    9,    9,    9, 0x08,

 // properties: name, type, flags
     163,  133, 0x00095409,
     177,  169, 0x0a495103,
     197,  184, 0x00095409,
     222,  209, 0x00095409,

 // properties: notify_signal_id
       0,
       0,
       0,
       0,

       0        // eod
};

static const char qt_meta_stringdata_Calendar[] = {
    "Calendar\0\0filterChanged()\0indexPath\0"
    "setCurrentEvent(QVariantList)\0"
    "createEvent()\0editEvent()\0viewEvent()\0"
    "deleteEvent()\0filterEvents()\0"
    "bb::cascades::GroupDataModel*\0model\0"
    "QString\0filter\0EventViewer*\0eventViewer\0"
    "EventEditor*\0eventEditor\0"
};

void Calendar::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        Calendar *_t = static_cast<Calendar *>(_o);
        switch (_id) {
        case 0: _t->filterChanged(); break;
        case 1: _t->setCurrentEvent((*reinterpret_cast< const QVariantList(*)>(_a[1]))); break;
        case 2: _t->createEvent(); break;
        case 3: _t->editEvent(); break;
        case 4: _t->viewEvent(); break;
        case 5: _t->deleteEvent(); break;
        case 6: _t->filterEvents(); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData Calendar::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject Calendar::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_Calendar,
      qt_meta_data_Calendar, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &Calendar::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *Calendar::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *Calendar::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_Calendar))
        return static_cast<void*>(const_cast< Calendar*>(this));
    return QObject::qt_metacast(_clname);
}

int Calendar::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 7)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 7;
    }
#ifndef QT_NO_PROPERTIES
      else if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< bb::cascades::GroupDataModel**>(_v) = model(); break;
        case 1: *reinterpret_cast< QString*>(_v) = filter(); break;
        case 2: *reinterpret_cast< EventViewer**>(_v) = eventViewer(); break;
        case 3: *reinterpret_cast< EventEditor**>(_v) = eventEditor(); break;
        }
        _id -= 4;
    } else if (_c == QMetaObject::WriteProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 1: setFilter(*reinterpret_cast< QString*>(_v)); break;
        }
        _id -= 4;
    } else if (_c == QMetaObject::ResetProperty) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 4;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void Calendar::filterChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, 0);
}
QT_END_MOC_NAMESPACE
