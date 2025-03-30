#ifndef WELLBEINGSREPOSITORY_H
#define WELLBEINGSREPOSITORY_H

#include <QObject>
#include <QSqlQuery>
#include <QSqlError>
#include <QList>
#include "../Database/DatabaseManager.h"
#include "Wellbeing.h"
#include "WellbeingCalculator.h"

class WellbeingsRepository : public QObject {
    Q_OBJECT
public:
    explicit WellbeingsRepository(QObject *parent = nullptr);

    bool addWellbeing(const QString &userId, const QString &wellbeingDate, const QString &sleepTime, const QString &period, const QString &wellbeing, const QString &skinCondition, const QString &distraction);
    bool updateWellbeing(int id, const QString &wellbeingDate, const QString &sleepTime, const QString &period, const QString &wellbeing, const QString &skinCondition, const QString &distraction);
    bool removeWellbeing(int id);
    QList<Wellbeing> fetchWellbeings();
};

#endif // WELLBEINGSREPOSITORY_H
