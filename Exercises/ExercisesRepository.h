#ifndef EXERCISESREPOSITORY_H
#define EXERCISESREPOSITORY_H

#include <QObject>
#include <QSqlQuery>
#include <QSqlError>
#include <QList>
#include "../Database/DatabaseManager.h"
#include "Exercise.h"

class ExercisesRepository : public QObject {
    Q_OBJECT
public:
    explicit ExercisesRepository(QObject *parent = nullptr);

    bool addExercise(const QString &userId, const QString &exerciseDate, const QString &duration, const QString &exercise);
    bool updateExercise(int id, const QString &exerciseDate, const QString &duration, const QString &exercise);
    bool removeExercise(int id);
    QList<Exercise> fetchExercises();
};

#endif // EXERCISESREPOSITORY_H
