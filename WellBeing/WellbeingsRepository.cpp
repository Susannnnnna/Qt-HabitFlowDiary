#include "WellbeingsRepository.h"

WellbeingsRepository::WellbeingsRepository(QObject *parent) : QObject(parent) {}

bool WellbeingsRepository::addWellbeing(const QString &userId, const QString &wellbeingDate, const QString &sleepTime, const QString &period, const QString &wellbeing, const QString &skinCondition, const QString &distraction) {
    QSqlDatabase db = DatabaseManager::instance().database();
    QSqlQuery query(db);

    Wellbeing wb;

    wb.sleep_time = sleepTime.toInt();
    wb.period = period.toInt();
    wb.wellbeing = wellbeing.toInt();
    wb.skin_condition = skinCondition.toInt();
    wb.distraction = distraction.toInt();

    int wellbeing_level = WellbeingCalculator::calculatorLevel(wb);

    query.prepare("INSERT INTO wellbeing (user_id, wellbeing_date, sleep_time, period, wellbeing, skin_condition, distraction, wellbeing_level) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
    query.addBindValue(userId);
    query.addBindValue(wellbeingDate);
    query.addBindValue(sleepTime);
    query.addBindValue(period);
    query.addBindValue(wellbeing);
    query.addBindValue(skinCondition);
    query.addBindValue(distraction);
    query.addBindValue(wellbeing_level);
    return query.exec();
}

bool WellbeingsRepository::updateWellbeing(int id, const QString &wellbeingDate, const QString &sleepTime, const QString &period, const QString &wellbeing, const QString &skinCondition, const QString &distraction) {
    QSqlDatabase db = DatabaseManager::instance().database();
    QSqlQuery query(db);

    Wellbeing wb;

    wb.sleep_time = sleepTime.toInt();
    wb.period = period.toInt();
    wb.wellbeing = wellbeing.toInt();
    wb.skin_condition = skinCondition.toInt();
    wb.distraction = distraction.toInt();

    int wellbeing_level = WellbeingCalculator::calculatorLevel(wb);

    query.prepare("UPDATE wellbeing SET wellbeing_date = ?, sleep_time = ?, period = ?, wellbeing = ?, skin_condition = ?, distraction = ?, wellbeing_level = ? WHERE id = ?");
    query.addBindValue(wellbeingDate);
    query.addBindValue(sleepTime);
    query.addBindValue(period);
    query.addBindValue(wellbeing);
    query.addBindValue(skinCondition);
    query.addBindValue(distraction);
    query.addBindValue(wellbeing_level);
    query.addBindValue(id);
    return query.exec();
}

bool WellbeingsRepository::removeWellbeing(int id) {
    QSqlDatabase db = DatabaseManager::instance().database();
    QSqlQuery query(db);
    query.prepare("DELETE FROM wellbeing WHERE id = ?");
    query.addBindValue(id);
    return query.exec();
}

QList<Wellbeing> WellbeingsRepository::fetchWellbeings() {
    QList<Wellbeing> wellbeings;
    QSqlDatabase db = DatabaseManager::instance().database();
    QSqlQuery query(db);
    query.prepare("SELECT id, user_id, wellbeing_date, sleep_time, period, wellbeing, skin_condition, distraction, wellbeing_level FROM wellbeing");

    if (query.exec()) {
        while (query.next()) {
            Wellbeing wb;
            wb.id = query.value(0).toInt();
            wb.user_id = query.value(1).toString();
            wb.wellbeing_date = query.value(2).toString();
            wb.sleep_time = query.value(3).toInt();
            wb.period = query.value(4).toInt();
            wb.wellbeing = query.value(5).toInt();
            wb.skin_condition = query.value(6).toInt();
            wb.distraction = query.value(7).toInt();
            wb.wellbeing_level = query.value(8).toInt();
            wellbeings.append(wb);
        }
    }
    return wellbeings;
}
