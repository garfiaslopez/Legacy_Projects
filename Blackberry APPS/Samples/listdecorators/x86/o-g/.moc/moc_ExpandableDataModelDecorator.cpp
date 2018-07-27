/****************************************************************************
** Meta object code from reading C++ file 'ExpandableDataModelDecorator.hpp'
**
** Created by: The Qt Meta Object Compiler version 63 (Qt 4.8.5)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../src/ExpandableDataModelDecorator.hpp"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'ExpandableDataModelDecorator.hpp' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.5. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_ExpandableDataModelDecorator[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       2,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: signature, parameters, type, tag, flags
      47,   30,   29,   29, 0x0a,

 // methods: signature, parameters, type, tag, flags
      98,   88,   79,   29, 0x02,

       0        // eod
};

static const char qt_meta_stringdata_ExpandableDataModelDecorator[] = {
    "ExpandableDataModelDecorator\0\0"
    "indexPath,expand\0expandHeader(QVariantList,bool)\0"
    "QVariant\0indexPath\0data(QVariantList)\0"
};

void ExpandableDataModelDecorator::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        ExpandableDataModelDecorator *_t = static_cast<ExpandableDataModelDecorator *>(_o);
        switch (_id) {
        case 0: _t->expandHeader((*reinterpret_cast< const QVariantList(*)>(_a[1])),(*reinterpret_cast< bool(*)>(_a[2]))); break;
        case 1: { QVariant _r = _t->data((*reinterpret_cast< const QVariantList(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QVariant*>(_a[0]) = _r; }  break;
        default: ;
        }
    }
}

const QMetaObjectExtraData ExpandableDataModelDecorator::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject ExpandableDataModelDecorator::staticMetaObject = {
    { &bb::cascades::datamanager::DataModelDecorator::staticMetaObject, qt_meta_stringdata_ExpandableDataModelDecorator,
      qt_meta_data_ExpandableDataModelDecorator, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &ExpandableDataModelDecorator::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *ExpandableDataModelDecorator::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *ExpandableDataModelDecorator::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_ExpandableDataModelDecorator))
        return static_cast<void*>(const_cast< ExpandableDataModelDecorator*>(this));
    typedef bb::cascades::datamanager::DataModelDecorator QMocSuperClass;
    return QMocSuperClass::qt_metacast(_clname);
}

int ExpandableDataModelDecorator::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    typedef bb::cascades::datamanager::DataModelDecorator QMocSuperClass;
    _id = QMocSuperClass::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 2)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 2;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
