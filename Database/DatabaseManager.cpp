#include "DatabaseManager.h"

DatabaseManager::DatabaseManager(QObject *parent) : QObject{parent} {
    QString path = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation);
    QDir dir(path);
    dir.mkpath(path);
    //typeid(*this).name() << "::" << __FUNCTION__

    m_db = QSqlDatabase::addDatabase("QSQLITE");
    m_db.setDatabaseName(path + "/habit_flow_diary.db");

    if (!m_db.isOpen()) {
        if (!m_db.open()) { qWarning() << "Database failed to open!" << dir.mkpath(path); }
    }
}

DatabaseManager& DatabaseManager::instance() {
    static DatabaseManager instance;
    return instance;
}

QSqlDatabase DatabaseManager::database() {
    return m_db;
}
