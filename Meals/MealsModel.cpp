#include "MealsModel.h"

MealsModel::MealsModel(QObject *parent) : QAbstractListModel(parent) {
    m_repository = std::make_unique<MealsRepository>(this);
    fetchData();
}

int MealsModel::rowCount(const QModelIndex &parent) const {
    Q_UNUSED(parent);
    return m_meals.size();
}

QVariant MealsModel::data(const QModelIndex &index, int role) const {
    if (!index.isValid() || index.row() >= m_meals.size())
        return QVariant();

    const Meal &meal = m_meals.at(index.row());
    switch (role) {
        case IdRole: return meal.id;
        case UserIdRole: return meal.user_id;
        case DateRole: return meal.meal_date;
        case MealCalRole: return meal.meal_cal;
        case MealRole: return meal.meal;
        default: return QVariant();
    }
}

QHash<int, QByteArray> MealsModel::roleNames() const {
    return {
        {IdRole, "id"},
        {UserIdRole, "user_id"},
        {DateRole, "meal_date"},
        {MealCalRole, "meal_cal"},
        {MealRole, "meal"},
    };
}

void MealsModel::addMeal(const QString &userId, const QString &mealDate, const QString &meal, const QString &mealCal) {
    if (m_repository->addMeal(userId, mealDate, mealCal, meal)) { fetchData(); }
}

void MealsModel::updateMeal(int id, const QString &mealDate, const QString &meal, const QString &mealCal) {
    if (m_repository->updateMeal(id, mealDate, mealCal, meal)) { fetchData(); }
}

void MealsModel::removeMeal(int id) {
    if (m_repository->removeMeal(id)) { fetchData(); }
}

void MealsModel::fetchData() {
    beginResetModel();
    m_meals = m_repository->fetchMeals();
    endResetModel();
}
