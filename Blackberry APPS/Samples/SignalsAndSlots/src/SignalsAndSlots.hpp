// Default empty project template
#ifndef SignalsAndSlots_HPP_
#define SignalsAndSlots_HPP_

#include <QObject>

namespace bb { namespace cascades { class Application; }}

/*!
 * @brief Application pane object
 *
 *Use this object to create and init app UI, to create context objects, to register the new meta types etc.
 */
class SignalsAndSlots : public QObject
{
    Q_OBJECT
public:
    SignalsAndSlots(bb::cascades::Application *app);
    virtual ~SignalsAndSlots() {}
};


#endif /* SignalsAndSlots_HPP_ */
