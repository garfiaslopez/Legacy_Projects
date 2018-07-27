/****************************************************************************
** Meta object code from reading C++ file 'SqlDataQuery.hpp'
**
** Created by: The Qt Meta Object Compiler version 63 (Qt 4.8.5)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../src/default/SqlDataQuery.hpp"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'SqlDataQuery.hpp' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.5. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_SqlDataQuery[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       9,   14, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // properties: name, type, flags
      18,   13, 0x11095103,
      33,   25, 0x0a095103,
      39,   25, 0x0a095103,
      53,   25, 0x0a095103,
      69,   25, 0x0a095103,
      79,   25, 0x0a095103,
      94,   25, 0x0a095103,
     105,   25, 0x0a095103,
     131,  119, 0x08095003,

       0        // eod
};

static const char qt_meta_stringdata_SqlDataQuery[] = {
    "SqlDataQuery\0QUrl\0source\0QString\0query\0"
    "scrollUpQuery\0scrollDownQuery\0keyColumn\0"
    "revisionColumn\0countQuery\0revisionQuery\0"
    "QVariantMap\0bindValues\0"
};

void SqlDataQuery::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData SqlDataQuery::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject SqlDataQuery::staticMetaObject = {
    { &bb::cascades::datamanager::DataQuery::staticMetaObject, qt_meta_stringdata_SqlDataQuery,
      qt_meta_data_SqlDataQuery, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &SqlDataQuery::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *SqlDataQuery::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *SqlDataQuery::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_SqlDataQuery))
        return static_cast<void*>(const_cast< SqlDataQuery*>(this));
    typedef bb::cascades::datamanager::DataQuery QMocSuperClass;
    return QMocSuperClass::qt_metacast(_clname);
}

int SqlDataQuery::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    typedef bb::cascades::datamanager::DataQuery QMocSuperClass;
    _id = QMocSuperClass::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    
#ifndef QT_NO_PROPERTIES
     if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QUrl*>(_v) = source(); break;
        case 1: *reinterpret_cast< QString*>(_v) = query(); break;
        case 2: *reinterpret_cast< QString*>(_v) = scrollUpQuery(); break;
        case 3: *reinterpret_cast< QString*>(_v) = scrollDownQuery(); break;
        case 4: *reinterpret_cast< QString*>(_v) = keyColumn(); break;
        case 5: *reinterpret_cast< QString*>(_v) = revisionColumn(); break;
        case 6: *reinterpret_cast< QString*>(_v) = countQuery(); break;
        case 7: *reinterpret_cast< QString*>(_v) = revisionQuery(); break;
        case 8: *reinterpret_cast< QVariantMap*>(_v) = valuesToBind(); break;
        }
        _id -= 9;
    } else if (_c == QMetaObject::WriteProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: setSource(*reinterpret_cast< QUrl*>(_v)); break;
        case 1: setQuery(*reinterpret_cast< QString*>(_v)); break;
        case 2: setScrollUpQuery(*reinterpret_cast< QString*>(_v)); break;
        case 3: setScrollDownQuery(*reinterpret_cast< QString*>(_v)); break;
        case 4: setKeyColumn(*reinterpret_cast< QString*>(_v)); break;
        case 5: setRevisionColumn(*reinterpret_cast< QString*>(_v)); break;
        case 6: setCountQuery(*reinterpret_cast< QString*>(_v)); break;
        case 7: setRevisionQuery(*reinterpret_cast< QString*>(_v)); break;
        case 8: setValuesToBind(*reinterpret_cast< QVariantMap*>(_v)); break;
        }
        _id -= 9;
    } else if (_c == QMetaObject::ResetProperty) {
        _id -= 9;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 9;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 9;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 9;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 9;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 9;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}
QT_END_MOC_NAMESPACE
