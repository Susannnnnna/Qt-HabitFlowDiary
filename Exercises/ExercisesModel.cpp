#include "ExercisesModel.h"

ExercisesModel::ExercisesModel(QObject *parent) : QAbstractListModel(parent) {
    m_repository = std::make_unique<ExercisesRepository>(this);
    fetchData();
}

int ExercisesModel::rowCount(const QModelIndex &parent) const {
    Q_UNUSED(parent);
    return m_exercises.size();
}

QVariant ExercisesModel::data(const QModelIndex &index, int role) const {
    if (!index.isValid() || index.row() >= m_exercises.size())
        return QVariant();

    const Exercise &exercise = m_exercises.at(index.row());
    switch (role) {
        case IdRole: return exercise.id;
        case UserIdRole: return exercise.user_id;
        case DateRole: return exercise.exercise_date;
        case DurationRole: return exercise.duration;
        case ExerciseRole: return exercise.exercise;
        default: return QVariant();
    }
}

QHash<int, QByteArray> ExercisesModel::roleNames() const {
    return {
        {IdRole, "id"},
        {UserIdRole, "user_id"},
        {DateRole, "exercise_date"},
        {DurationRole, "duration"},
        {ExerciseRole, "exercise"}
    };
}

void ExercisesModel::addExercise(const QString &userId, const QString &exerciseDate, const QString &duration, const QString &exercise) {
    if (m_repository->addExercise(userId, exerciseDate, duration, exercise)) { fetchData(); }
}

void ExercisesModel::updateExercise(int id, const QString &exerciseDate, const QString &duration, const QString &exercise) {
    if (m_repository->updateExercise(id, exerciseDate, duration, exercise)) { fetchData(); }
}

void ExercisesModel::removeExercise(int id) {
    if (m_repository->removeExercise(id)) { fetchData(); }
}

void ExercisesModel::fetchData() {
    beginResetModel();
    m_exercises = m_repository->fetchExercises();
    endResetModel();
}
