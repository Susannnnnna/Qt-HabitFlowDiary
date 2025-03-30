#include "ExercisesRepository.h"

ExercisesRepository::ExercisesRepository(QObject *parent) : QObject(parent) {}

bool ExercisesRepository::addExercise(const QString &userId, const QString &exerciseDate, const QString &duration, const QString &exercise) {
    QSqlDatabase db = DatabaseManager::instance().database();
    QSqlQuery query(db);
    query.prepare("INSERT INTO exercises (user_id, exercise_date, duration, exercise) VALUES (?, ?, ?, ?)");
    query.addBindValue(userId);
    query.addBindValue(exerciseDate);
    query.addBindValue(duration);
    query.addBindValue(exercise);
    return query.exec();
}

bool ExercisesRepository::updateExercise(int id, const QString &exerciseDate, const QString &duration, const QString &exercise) {
    QSqlDatabase db = DatabaseManager::instance().database();
    QSqlQuery query(db);
    query.prepare("UPDATE exercises SET exercise_date = ?, duration = ?, exercise = ? WHERE id = ?");
    query.addBindValue(exerciseDate);
    query.addBindValue(duration);
    query.addBindValue(exercise);
    query.addBindValue(id);
    return query.exec();
}

bool ExercisesRepository::removeExercise(int id) {
    QSqlDatabase db = DatabaseManager::instance().database();
    QSqlQuery query(db);
    query.prepare("DELETE FROM exercises WHERE id = ?");
    query.addBindValue(id);
    return query.exec();
}

QList<Exercise> ExercisesRepository::fetchExercises() {
    QList<Exercise> exercises;
    QSqlDatabase db = DatabaseManager::instance().database();
    QSqlQuery query(db);
    query.prepare("SELECT id, user_id, exercise_date, duration, exercise FROM exercises");

    if (query.exec()) {
        while (query.next()) {
            Exercise ex;
            ex.id = query.value(0).toInt();
            ex.user_id = query.value(1).toString();
            ex.exercise_date = query.value(2).toString();
            ex.duration = query.value(3).toString();
            ex.exercise = query.value(4).toString();
            exercises.append(ex);
        }
    }
    return exercises;
}
