#ifndef DATABASEMANAGER_H
#define DATABASEMANAGER_H

#include <QObject>
#include <QSqlDatabase>
#include <QSqlError>
#include <QDebug>
#include <QStandardPaths>
#include <QDir>
//#include "DatabaseInitializer.h"

class DatabaseManager : public QObject {
    Q_OBJECT
public:
    static DatabaseManager& instance(); // implementacja singleton - zapewnia istnienie tylko jedenj instancji klasy i umożliwia globalny dostęp do niej
    QSqlDatabase database();

private:
    explicit DatabaseManager(QObject *parent = nullptr); // konstruktor jest prywatny więc nie można utworzyć nowego obiektu DatabaseManager
    QSqlDatabase m_db;
};

#endif // DATABASEMANAGER_H
