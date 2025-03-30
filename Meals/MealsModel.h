#ifndef MEALSMODEL_H
#define MEALSMODEL_H

#include <QAbstractListModel>
#include <QDebug>
#include <memory>
#include "MealsRepository.h"

class MealsModel : public QAbstractListModel {
    Q_OBJECT
public:
    explicit MealsModel(QObject *parent = nullptr);

    enum MealRoles {
        IdRole = Qt::UserRole + 1,
        UserIdRole,
        DateRole,
        MealCalRole,
        MealRole,
    };

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;

    Q_INVOKABLE void addMeal(const QString &userId, const QString &mealDate, const QString &meal, const QString &mealCal);
    Q_INVOKABLE void updateMeal(int id, const QString &mealDate, const QString &meal, const QString &mealCal);
    Q_INVOKABLE void removeMeal(int id);
    void fetchData();

private:
    QList<Meal> m_meals;
    std::unique_ptr<MealsRepository> m_repository; // Obiekt dostępu do bazy, użycie inteligentnego wskaźnika, żeby pamięć została automatycznie zwolniona
};

#endif // MEALSMODEL_H
