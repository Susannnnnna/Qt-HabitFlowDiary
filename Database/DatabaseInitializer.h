#ifndef DATABASEINITIALIZER_H
#define DATABASEINITIALIZER_H

#include <QObject>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlError>
#include <QDebug>
#include "DatabaseManager.h"
#include "TableSchemas.h"

class DatabaseInitializer : public QObject {
    Q_OBJECT
public:
    static void setupDatabase();
};

#endif // DATABASEINITIALIZER_H
