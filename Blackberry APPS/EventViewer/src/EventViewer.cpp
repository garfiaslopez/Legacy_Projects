// Tabbed pane project template
#include "EventViewer.hpp"

#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>

#include <bb/pim/calendar/CalendarService>
#include <bb/pim/calendar/CalendarEvent>
#include <bb/pim/calendar/EventSearchParameters>

#include <QtCore/QDateTime>
#include <QPair>

using namespace bb::cascades;

EventViewer::EventViewer(bb::cascades::Application *app)
: QObject(app)
{
    // create scene document from main.qml asset
    // set parent to created document to ensure it exists for the whole application lifetime
    QmlDocument *qml = QmlDocument::create("asset:///main.qml").parent(this);

    // create root object for the UI

    qml->setContextProperty("model_nextevents",&next_events);
    qml->setContextProperty("model_prevevents",&prev_events);

    bb::pim::calendar::CalendarService calService;
    bb::pim::calendar::Result::Type result_type;

    bb::pim::calendar::EventSearchParameters next,prev;
    QDateTime now = QDateTime::currentDateTime();
    next.setStart(now);
    next.setEnd(now.addDays(30));

    prev.setStart(now.addDays(-30));
    prev.setEnd(now);

    QList<bb::pim::calendar::CalendarEvent> eventList =
    		calService.events(next,&result_type);
    if(result_type != -1)
    {
    	foreach(const bb::pim::calendar::CalendarEvent& event, eventList)
		{
    		next_events.append(event.startTime().toString("h:mm dd.MM.yy ")
    				+ event.subject());
		}
    }

    eventList = calService.events(prev,&result_type);
	if(result_type != -1)
	{
		foreach(const bb::pim::calendar::CalendarEvent& event, eventList)
		{
			prev_events.append(event.startTime().toString("h:mm dd.MM.yy ")
					+ event.subject());
		}
	}


    qml->setContextProperty("appObj",this);

    AbstractPane *root = qml->createRootObject<AbstractPane>();
    // set created root object as a scene
    app->setScene(root);
}

void EventViewer::addEvent(QString subject, QDateTime datetime)
{
	bb::pim::calendar::CalendarService calService;
	bb::pim::calendar::Result::Type result;
	bb::pim::calendar::CalendarEvent event;
	QPair<int,int> defaultFolder = calService.defaultCalendarFolder(&result);
	if(result == -1)
		return;
	event.setAccountId(defaultFolder.first);
	event.setFolderId(defaultFolder.second);
	event.setStartTime(datetime);
	event.setEndTime(datetime);
	event.setSubject(subject);
	if(calService.createEvent(event)!=-1)
	{
		next_events.append(event.startTime().toString("h:mm dd.MM.yy ")
		    				+ event.subject());
	}
	else
	{
		//Failed to create event
	}
}

