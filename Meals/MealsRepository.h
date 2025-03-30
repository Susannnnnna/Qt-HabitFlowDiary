#ifndef MEALSREPOSITORY_H
#define MEALSREPOSITORY_H

#include <QObject>
#include <QSqlQuery>
#include <QSqlError>
#include <QList>
#include "../Database/DatabaseManager.h"
#include "Meal.h"

class MealsRepository : public QObject {
    Q_OBJECT
public:
    explicit MealsRepository(QObject *parent = nullptr);

    bool addMeal(const QString &userId, const QString &mealDate, const QString &meal, const QString &mealCal);
    bool updateMeal(int id, const QString &mealDate, const QString &meal, const QString &mealCal);
    bool removeMeal(int id);
    QList<Meal> fetchMeals();
};

#endif // MEALSREPOSITORY_H
