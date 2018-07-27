// Default empty project template
#ifndef QMLHelloWorld_HPP_
#define QMLHelloWorld_HPP_

#include <QObject>
#include <bb/cascades/QListDataModel>

namespace bb { namespace cascades { class Application; }}

/*!
 * @brief Application pane object
 *
 *Use this object to create and init app UI, to create context objects, to register the new meta types etc.
 */
typedef bb::cascades::QListDataModel<QString> MyStringListModel;

class QMLHelloWorld : public QObject
{
    Q_OBJECT
    MyStringListModel* listmodel;
    bb::cascades::Application* app;
public:
    QMLHelloWorld(bb::cascades::Application *app);
    virtual ~QMLHelloWorld() { delete listmodel;}


    Q_INVOKABLE void addData(QString data);
    Q_INVOKABLE void saveData();

    Q_INVOKABLE void loadData();

public slots:
	void receiveSignalFromQML();

signals:
    void dataReady();
};


#endif /* QMLHelloWorld_HPP_ */
