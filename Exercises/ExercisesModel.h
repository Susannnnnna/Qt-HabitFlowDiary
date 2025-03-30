#ifndef EXERCISESMODEL_H
#define EXERCISESMODEL_H

#include <QAbstractListModel>
#include <QDebug>
#include <memory>
#include "ExercisesRepository.h"

class ExercisesModel : public QAbstractListModel {
    Q_OBJECT
public:
    explicit ExercisesModel(QObject *parent = nullptr);

    enum ExerciseRoles {
        IdRole = Qt::UserRole + 1,
        UserIdRole,
        DateRole,
        DurationRole,
        ExerciseRole
    };

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;

    Q_INVOKABLE void addExercise(const QString &userId, const QString &exerciseDate, const QString &duration, const QString &exercise);
    Q_INVOKABLE void updateExercise(int id, const QString &exerciseDate, const QString &duration, const QString &exercise);
    Q_INVOKABLE void removeExercise(int id);
    void fetchData();

private:
    QList<Exercise> m_exercises;
    std::unique_ptr<ExercisesRepository> m_repository; // Obiekt dostępu do bazy, użycie inteligentnego wskaźnika, żeby pamięć została automatycznie zwolniona
};

#endif // EXERCISESMODEL_H
