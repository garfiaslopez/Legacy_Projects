/****************************************************************************
** Meta object code from reading C++ file 'QueryExec.hpp'
**
** Created by: The Qt Meta Object Compiler version 63 (Qt 4.8.5)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../src/default/QueryExec.hpp"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'QueryExec.hpp' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.5. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_QueryExec[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
      11,   14, // methods
       5,   69, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       2,       // signalCount

 // signals: signature, parameters, type, tag, flags
      16,   11,   10,   10, 0x05,
      58,   35,   10,   10, 0x05,

 // slots: signature, parameters, type, tag, flags
      84,   77,   10,   10, 0x0a,
     110,  100,   10,   10, 0x0a,
     147,  134,   10,   10, 0x0a,
     182,  176,   10,   10, 0x0a,
     205,  196,   10,   10, 0x0a,
     222,   10,   10,   10, 0x0a,
     232,   10,   10,   10, 0x0a,
     239,   10,   10,   10, 0x08,
     262,  256,   10,   10, 0x08,

 // properties: name, type, flags
      77,  303, 0x11095103,
     320,  308, 0x0b095103,
     340,  328, 0x08095003,
     176,  351, 0x02095103,
     196,  351, 0x02095103,

       0        // eod
};

static const char qt_meta_stringdata_QueryExec[] = {
    "QueryExec\0\0data\0executed(QVariant)\0"
    "errorType,errorMessage\0error(int,QString)\0"
    "source\0setSource(QUrl)\0queryList\0"
    "setQueries(QStringList)\0nameValueMap\0"
    "setValuesToBind(QVariantMap)\0times\0"
    "setTimes(int)\0interval\0setInterval(int)\0"
    "execute()\0stop()\0executeQueries()\0"
    "reply\0processResult(bb::data::DataAccessReply)\0"
    "QUrl\0QStringList\0queries\0QVariantMap\0"
    "bindValues\0int\0"
};

void QueryExec::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        QueryExec *_t = static_cast<QueryExec *>(_o);
        switch (_id) {
        case 0: _t->executed((*reinterpret_cast< const QVariant(*)>(_a[1]))); break;
        case 1: _t->error((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2]))); break;
        case 2: _t->setSource((*reinterpret_cast< const QUrl(*)>(_a[1]))); break;
        case 3: _t->setQueries((*reinterpret_cast< const QStringList(*)>(_a[1]))); break;
        case 4: _t->setValuesToBind((*reinterpret_cast< const QVariantMap(*)>(_a[1]))); break;
        case 5: _t->setTimes((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 6: _t->setInterval((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 7: _t->execute(); break;
        case 8: _t->stop(); break;
        case 9: _t->executeQueries(); break;
        case 10: _t->processResult((*reinterpret_cast< const bb::data::DataAccessReply(*)>(_a[1]))); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData QueryExec::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject QueryExec::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_QueryExec,
      qt_meta_data_QueryExec, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &QueryExec::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *QueryExec::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *QueryExec::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_QueryExec))
        return static_cast<void*>(const_cast< QueryExec*>(this));
    return QObject::qt_metacast(_clname);
}

int QueryExec::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 11)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 11;
    }
#ifndef QT_NO_PROPERTIES
      else if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QUrl*>(_v) = source(); break;
        case 1: *reinterpret_cast< QStringList*>(_v) = queries(); break;
        case 2: *reinterpret_cast< QVariantMap*>(_v) = valuesToBind(); break;
        case 3: *reinterpret_cast< int*>(_v) = times(); break;
        case 4: *reinterpret_cast< int*>(_v) = interval(); break;
        }
        _id -= 5;
    } else if (_c == QMetaObject::WriteProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: setSource(*reinterpret_cast< QUrl*>(_v)); break;
        case 1: setQueries(*reinterpret_cast< QStringList*>(_v)); break;
        case 2: setValuesToBind(*reinterpret_cast< QVariantMap*>(_v)); break;
        case 3: setTimes(*reinterpret_cast< int*>(_v)); break;
        case 4: setInterval(*reinterpret_cast< int*>(_v)); break;
        }
        _id -= 5;
    } else if (_c == QMetaObject::ResetProperty) {
        _id -= 5;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 5;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 5;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 5;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 5;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 5;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void QueryExec::executed(const QVariant & _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void QueryExec::error(int _t1, const QString & _t2)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)), const_cast<void*>(reinterpret_cast<const void*>(&_t2)) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}
QT_END_MOC_NAMESPACE
