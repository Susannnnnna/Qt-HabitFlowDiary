#include "WellbeingsModel.h"

WellbeingsModel::WellbeingsModel(QObject *parent) : QAbstractListModel(parent) {
    m_repository = std::make_unique<WellbeingsRepository>(this);
    fetchData();
}

int WellbeingsModel::rowCount(const QModelIndex &parent) const {
    Q_UNUSED(parent);
    return m_wellbeings.size();
}

QVariant WellbeingsModel::data(const QModelIndex &index, int role) const {
    if (!index.isValid() || index.row() >= m_wellbeings.size())
        return QVariant();

    const Wellbeing &wellbeing = m_wellbeings.at(index.row());
    switch (role) {
        case IdRole: return wellbeing.id;
        case UserIdRole: return wellbeing.user_id;
        case DateRole: return wellbeing.wellbeing_date;
        case SleepTimeRole: return wellbeing.sleep_time;
        case PeriodRole: return wellbeing.period;
        case WellbeingRole: return wellbeing.wellbeing;
        case SkinConditionRole: return wellbeing.skin_condition;
        case DistractionRole: return wellbeing.distraction;
        case WellbeingLevelRole: return wellbeing.wellbeing_level;
        case WellbeingLevelDescriptionRole: return wellbeing.wellbeing_level_description;
        case WellbeingLevelColorRole: return wellbeing.wellbeing_level_color;
        default: return QVariant();
    }
}

QHash<int, QByteArray> WellbeingsModel::roleNames() const {
    return {
        {IdRole, "id"},
        {UserIdRole, "user_id"},
        {DateRole, "wellbeing_date"},
        {SleepTimeRole, "sleep_time"},
        {PeriodRole, "period"},
        {WellbeingRole, "wellbeing"},
        {SkinConditionRole, "skin_condition"},
        {DistractionRole, "distraction"},
        {WellbeingLevelRole, "wellbeing_level"},
        {WellbeingLevelDescriptionRole, "wellbeing_level_description"},
        {WellbeingLevelColorRole, "wellbeing_level_color"},
    };
}

void WellbeingsModel::addWellbeing(const QString &userId, const QString &wellbeingDate, const QString &sleepTime, const QString &period, const QString &wellbeing, const QString &skinCondition, const QString &distraction) {
    if (m_repository->addWellbeing(userId, wellbeingDate, sleepTime, period, wellbeing, skinCondition, distraction)) { fetchData(); }
}

void WellbeingsModel::updateWellbeing(int id, const QString &wellbeingDate, const QString &sleepTime, const QString &period, const QString &wellbeing, const QString &skinCondition, const QString &distraction) {
    if (m_repository->updateWellbeing(id, wellbeingDate, sleepTime, period, wellbeing, skinCondition, distraction)) { fetchData(); }
}

void WellbeingsModel::removeWellbeing(int id) {
    if (m_repository->removeWellbeing(id)) { fetchData(); }
}

void WellbeingsModel::fetchData() {
    beginResetModel();
    m_wellbeings = m_repository->fetchWellbeings();

    for (Wellbeing &wb : m_wellbeings) {
        int level = wb.wellbeing_level;
        wb.wellbeing_level_description = WellbeingCalculator::levelToDescription(level);
        //qDebug() << "Print wellbeing_level_description output: " << wb.wellbeing_level_description;
        wb.wellbeing_level_color = WellbeingCalculator::levelToColor(level);
    }
    endResetModel();
}






























