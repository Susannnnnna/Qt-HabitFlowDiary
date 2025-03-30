#ifndef WELLBEINGSMODEL_H
#define WELLBEINGSMODEL_H

#include <QAbstractListModel>
#include <QDebug>
#include <memory>
#include "WellbeingsRepository.h"
#include "WellbeingCalculator.h"

class WellbeingsModel : public QAbstractListModel {
    Q_OBJECT
public:
    explicit WellbeingsModel(QObject *parent = nullptr);

    enum MealRoles {
        IdRole = Qt::UserRole + 1,
        UserIdRole,
        DateRole,
        SleepTimeRole,
        PeriodRole,
        WellbeingRole,
        SkinConditionRole,
        DistractionRole,
        WellbeingLevelRole,
        WellbeingLevelDescriptionRole,
        WellbeingLevelColorRole,
    };

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;

    Q_INVOKABLE void addWellbeing(const QString &userId, const QString &wellbeingDate, const QString &sleepTime, const QString &period, const QString &wellbeing, const QString &skinCondition, const QString &distraction);
    Q_INVOKABLE void updateWellbeing(int id, const QString &wellbeingDate, const QString &sleepTime, const QString &period, const QString &wellbeing, const QString &skinCondition, const QString &distraction);
    Q_INVOKABLE void removeWellbeing(int id);
    void fetchData();

private:
    QList<Wellbeing> m_wellbeings;
    std::unique_ptr<WellbeingsRepository> m_repository; // Obiekt dostępu do bazy, użycie inteligentnego wskaźnika, żeby pamięć została automatycznie zwolniona
};

#endif // WELLBEINGSMODEL_H
