#include "AdditionalEventsRepository.h"

AdditionalEventsRepository::AdditionalEventsRepository(QObject *parent) {}

bool AdditionalEventsRepository::addAdditionalEvent(const QString &userId, const QString &additionalEventDate, const QString &additionalEvent) {
    QSqlDatabase db = DatabaseManager::instance().database();
    QSqlQuery query(db);
    query.prepare("INSERT INTO additional_events (user_id, additional_event_date, additional_event) VALUES (?, ?, ?)");
    query.addBindValue(userId);
    query.addBindValue(additionalEventDate);
    query.addBindValue(additionalEvent);
    return query.exec();
}

bool AdditionalEventsRepository::updateAdditionalEvent(int id, const QString &additionalEventDate, const QString &additionalEvent) {
    QSqlDatabase db = DatabaseManager::instance().database();
    QSqlQuery query(db);
    query.prepare("UPDATE additional_events SET additional_event_date = ?, additional_event = ? WHERE id = ?");
    query.addBindValue(additionalEventDate);
    query.addBindValue(additionalEvent);
    query.addBindValue(id);
    return query.exec();
}

bool AdditionalEventsRepository::removeAdditionalEvent(int id) {
    QSqlDatabase db = DatabaseManager::instance().database();
    QSqlQuery query(db);
    query.prepare("DELETE FROM additional_events WHERE id = ?");
    query.addBindValue(id);
    return query.exec();
}

QList<AdditionalEvent> AdditionalEventsRepository::fetchAdditionalEvents() {
    QList<AdditionalEvent> additionalEvents;
    QSqlDatabase db = DatabaseManager::instance().database();
    QSqlQuery query(db);
    query.prepare("SELECT id, user_id, additional_event_date, additional_event FROM additional_events");

    if (query.exec()) {
        while (query.next()) {
            AdditionalEvent ae;
            ae.id = query.value(0).toInt();
            ae.user_id = query.value(1).toString();
            ae.additional_event_date = query.value(2).toString();
            ae.additional_event = query.value(3).toString();
            additionalEvents.append(ae);
        }
    }
    return additionalEvents;
}
