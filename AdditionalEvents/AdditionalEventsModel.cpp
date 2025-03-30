#include "AdditionalEventsModel.h"

AdditionalEventsModel::AdditionalEventsModel(QObject *parent) {
    m_repository = std::make_unique<AdditionalEventsRepository>(this);
    fetchData();
}

int AdditionalEventsModel::rowCount(const QModelIndex &parent) const {
    Q_UNUSED(parent);
    return m_additionalEvents.size();
}

QVariant AdditionalEventsModel::data(const QModelIndex &index, int role) const {
    if (!index.isValid() || index.row() >= m_additionalEvents.size())
        return QVariant();

    const AdditionalEvent &additionalEvent = m_additionalEvents.at(index.row());
    switch (role) {
        case IdRole: return additionalEvent.id;
        case UserIdRole: return additionalEvent.user_id;
        case DateRole: return additionalEvent.additional_event_date;
        case AdditionalEventRole: return additionalEvent.additional_event;
        default: return QVariant();
    }
}

QHash<int, QByteArray> AdditionalEventsModel::roleNames() const {
    return {
        {IdRole, "id"},
        {UserIdRole, "user_id"},
        {DateRole, "additional_event_date"},
        {AdditionalEventRole, "additional_event"},
    };
}

void AdditionalEventsModel::addAdditionalEvent(const QString &userId, const QString &additionalEventDate, const QString &additionalEvent) {
    if (m_repository->addAdditionalEvent(userId, additionalEventDate, additionalEvent)) { fetchData(); }
}

void AdditionalEventsModel::updateAdditionalEvent(int id, const QString &additionalEventDate, const QString &additionalEvent) {
    if (m_repository->updateAdditionalEvent(id, additionalEventDate, additionalEvent)) { fetchData(); }
}

void AdditionalEventsModel::removeAdditionalEvent(int id) {
    if (m_repository->removeAdditionalEvent(id)) { fetchData(); }
}

void AdditionalEventsModel::fetchData()  {
    beginResetModel();
    m_additionalEvents = m_repository->fetchAdditionalEvents();
    endResetModel();
}
