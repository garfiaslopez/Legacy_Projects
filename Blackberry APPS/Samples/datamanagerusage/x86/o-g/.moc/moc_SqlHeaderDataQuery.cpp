/****************************************************************************
** Meta object code from reading C++ file 'SqlHeaderDataQuery.hpp'
**
** Created by: The Qt Meta Object Compiler version 63 (Qt 4.8.5)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../src/default/SqlHeaderDataQuery.hpp"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'SqlHeaderDataQuery.hpp' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.5. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_SqlHeaderDataQuery[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
      10,   14, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // properties: name, type, flags
      24,   19, 0x11095103,
      39,   31, 0x0a095103,
      45,   31, 0x0a095103,
      59,   31, 0x0a095103,
      75,   31, 0x0a095103,
      87,   31, 0x0a095103,
      97,   31, 0x0a095103,
     112,   31, 0x0a095103,
     123,   31, 0x0a095103,
     149,  137, 0x08095003,

       0        // eod
};

static const char qt_meta_stringdata_SqlHeaderDataQuery[] = {
    "SqlHeaderDataQuery\0QUrl\0source\0QString\0"
    "query\0scrollUpQuery\0scrollDownQuery\0"
    "headerQuery\0keyColumn\0revisionColumn\0"
    "countQuery\0revisionQuery\0QVariantMap\0"
    "bindValues\0"
};

void SqlHeaderDataQuery::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData SqlHeaderDataQuery::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject SqlHeaderDataQuery::staticMetaObject = {
    { &bb::cascades::datamanager::HeaderDataQuery::staticMetaObject, qt_meta_stringdata_SqlHeaderDataQuery,
      qt_meta_data_SqlHeaderDataQuery, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &SqlHeaderDataQuery::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *SqlHeaderDataQuery::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *SqlHeaderDataQuery::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_SqlHeaderDataQuery))
        return static_cast<void*>(const_cast< SqlHeaderDataQuery*>(this));
    typedef bb::cascades::datamanager::HeaderDataQuery QMocSuperClass;
    return QMocSuperClass::qt_metacast(_clname);
}

int SqlHeaderDataQuery::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    typedef bb::cascades::datamanager::HeaderDataQuery QMocSuperClass;
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
        case 4: *reinterpret_cast< QString*>(_v) = headerQuery(); break;
        case 5: *reinterpret_cast< QString*>(_v) = keyColumn(); break;
        case 6: *reinterpret_cast< QString*>(_v) = revisionColumn(); break;
        case 7: *reinterpret_cast< QString*>(_v) = countQuery(); break;
        case 8: *reinterpret_cast< QString*>(_v) = revisionQuery(); break;
        case 9: *reinterpret_cast< QVariantMap*>(_v) = valuesToBind(); break;
        }
        _id -= 10;
    } else if (_c == QMetaObject::WriteProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: setSource(*reinterpret_cast< QUrl*>(_v)); break;
        case 1: setQuery(*reinterpret_cast< QString*>(_v)); break;
        case 2: setScrollUpQuery(*reinterpret_cast< QString*>(_v)); break;
        case 3: setScrollDownQuery(*reinterpret_cast< QString*>(_v)); break;
        case 4: setHeaderQuery(*reinterpret_cast< QString*>(_v)); break;
        case 5: setKeyColumn(*reinterpret_cast< QString*>(_v)); break;
        case 6: setRevisionColumn(*reinterpret_cast< QString*>(_v)); break;
        case 7: setCountQuery(*reinterpret_cast< QString*>(_v)); break;
        case 8: setRevisionQuery(*reinterpret_cast< QString*>(_v)); break;
        case 9: setValuesToBind(*reinterpret_cast< QVariantMap*>(_v)); break;
        }
        _id -= 10;
    } else if (_c == QMetaObject::ResetProperty) {
        _id -= 10;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 10;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 10;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 10;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 10;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 10;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}
QT_END_MOC_NAMESPACE
