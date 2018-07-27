// Tabbed pane project template
#ifndef EventViewer_HPP_
#define EventViewer_HPP_

#include <QObject>
#include <bb/cascades/QListDataModel>

namespace bb { namespace cascades { class Application; }}

/*!
 * @brief Application pane object
 *
 *Use this object to create and init app UI, to create context objects, to register the new meta types etc.
 */

typedef bb::cascades::QListDataModel<QString> MyStringListModel;

class EventViewer : public QObject
{
    Q_OBJECT
    MyStringListModel next_events;
    MyStringListModel prev_events;
public:
    EventViewer(bb::cascades::Application *app);
    virtual ~EventViewer() {}

    Q_INVOKABLE void addEvent(QString subject, QDateTime datetime);
};

#endif /* EventViewer_HPP_ */
