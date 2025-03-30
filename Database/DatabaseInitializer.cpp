#include "DatabaseInitializer.h"

void DatabaseInitializer::setupDatabase() {

    QSqlDatabase db = DatabaseManager::instance().database();

    if(!db.isOpen()) {
        qWarning() << "Database is not open in DatabaseInitializer";
        return;
    }

    QSqlQuery query(db);

    qDebug() << "Creating TABLE_USER_DETAILS...";
    if (!query.exec(TABLE_SCHEMAS::TABLE_USER_DETAILS)) {
        qWarning() << "Error while creating TABLE_USER_DETAILS: " << query.lastError().text();
    } else {
        qDebug() << "TABLE_USER_DETAILS created successfully!";
    }

    qDebug() << "Creating TABLE_EXERCISES...";
    if (!query.exec(TABLE_SCHEMAS::TABLE_EXERCISES)) {
        qWarning() << "Error while creating TABLE_EXERCISES: " << query.lastError().text();
    } else {
        qDebug() << "TABLE_EXERCISES created successfully!";
    }

    qDebug() << "Creating TABLE_MEALS...";
    if (!query.exec(TABLE_SCHEMAS::TABLE_MEALS)) {
        qWarning() << "Error while creating TABLE_MEALS: " << query.lastError().text();
    } else {
        qDebug() << "TABLE_MEALS created successfully!";
    }

    qDebug() << "Creating TABLE_WELLBEING...";
    if (!query.exec(TABLE_SCHEMAS::TABLE_WELLBEING)) {
        qWarning() << "Error while creating TABLE_WELLBEING: " << query.lastError().text();
    } else {
        qDebug() << "TABLE_WELLBEING created successfully!";
    }

    qDebug() << "Creating TABLE_ADDITIONAL_EVENTS...";
    if (!query.exec(TABLE_SCHEMAS::TABLE_ADDITIONAL_EVENTS)) {
        qWarning() << "Error while creating TABLE_ADDITIONA_EVENTS: " << query.lastError().text();
    } else {
        qDebug() << "TABLE_ADDITIONAL_EVENTS created successfully!";
    }

    qDebug() << "All tables initialized successfully!";
}
