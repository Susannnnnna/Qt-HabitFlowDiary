#ifndef ADDITIONALEVENTSREPOSITORY_H
#define ADDITIONALEVENTSREPOSITORY_H

#include <QObject>
#include <QSqlQuery>
#include <QSqlError>
#include <QList>
#include "../Database/DatabaseManager.h"
#include "AdditionalEvent.h"

class AdditionalEventsRepository : public QObject {
    Q_OBJECT
public:
    explicit AdditionalEventsRepository(QObject *parent = nullptr);

    bool addAdditionalEvent(const QString &userId, const QString &additionalEventDate, const QString &additionalEvent);
    bool updateAdditionalEvent(int id, const QString &additionalEventDate, const QString &additionalEvent);
    bool removeAdditionalEvent(int id);
    QList<AdditionalEvent> fetchAdditionalEvents();
};

#endif // ADDITIONALEVENTSREPOSITORY_H
