#ifndef ADDITIONALEVENTSMODEL_H
#define ADDITIONALEVENTSMODEL_H

#include <QAbstractListModel>
#include <QDebug>
#include <memory>
#include "AdditionalEventsRepository.h"

class AdditionalEventsModel : public QAbstractListModel {
    Q_OBJECT
public:
    explicit AdditionalEventsModel(QObject *parent = nullptr);

    enum AdditionalEventRoles {
        IdRole = Qt::UserRole + 1,
        UserIdRole,
        DateRole,
        AdditionalEventRole,
    };

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;

    Q_INVOKABLE void addAdditionalEvent(const QString &userId, const QString &additionalEventDate, const QString &additionalEvent);
    Q_INVOKABLE void updateAdditionalEvent(int id, const QString &additionalEventDate, const QString &additionalEvent);
    Q_INVOKABLE void removeAdditionalEvent(int id);
    void fetchData();

private:
    QList<AdditionalEvent> m_additionalEvents;
    std::unique_ptr<AdditionalEventsRepository> m_repository; // Obiekt dostępu do bazy, użycie inteligentnego wskaźnika, żeby pamięć została automatycznie zwolniona
};

#endif // ADDITIONALEVENTSMODEL_H
