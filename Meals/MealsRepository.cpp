#include "MealsRepository.h"

MealsRepository::MealsRepository(QObject *parent) : QObject(parent) {}

bool MealsRepository::addMeal(const QString &userId, const QString &mealDate, const QString &meal, const QString &mealCal) {
    QSqlDatabase db = DatabaseManager::instance().database();
    QSqlQuery query(db);
    query.prepare("INSERT INTO meals (user_id, meal_date, meal_cal, meal) VALUES (?, ?, ?, ?)");
    query.addBindValue(userId);
    query.addBindValue(mealDate);
    query.addBindValue(mealCal);
    query.addBindValue(meal);
    return query.exec();
}

bool MealsRepository::updateMeal(int id, const QString &mealDate, const QString &meal, const QString &mealCal) {
    QSqlDatabase db = DatabaseManager::instance().database();
    QSqlQuery query(db);
    query.prepare("UPDATE meals SET meal_date = ?, meal_cal = ?, meal = ? WHERE id = ?");
    query.addBindValue(mealDate);
    query.addBindValue(mealCal);
    query.addBindValue(meal);
    query.addBindValue(id);
    return query.exec();
}

bool MealsRepository::removeMeal(int id) {
    QSqlDatabase db = DatabaseManager::instance().database();
    QSqlQuery query(db);
    query.prepare("DELETE FROM meals WHERE id = ?");
    query.addBindValue(id);
    return query.exec();
}

QList<Meal> MealsRepository::fetchMeals() {
    QList<Meal> meals;
    QSqlDatabase db = DatabaseManager::instance().database();
    QSqlQuery query(db);
    query.prepare("SELECT id, user_id, meal_date, meal_cal, meal FROM meals");

    if (query.exec()) {
        while (query.next()) {
            Meal ml;
            ml.id = query.value(0).toInt();
            ml.user_id = query.value(1).toString();
            ml.meal_date = query.value(2).toString();
            ml.meal_cal = query.value(3).toString();
            ml.meal = query.value(4).toString();
            meals.append(ml);
        }
    }
    return meals;
}
