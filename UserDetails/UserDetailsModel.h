#ifndef USERDETAILSMODEL_H
#define USERDETAILSMODEL_H

#include <QAbstractListModel>
#include <QDebug>
#include <memory>
#include "UserDetailsRepository.h"

class UserDetailsModel : public QAbstractListModel {
    Q_OBJECT
public:
    explicit UserDetailsModel(QObject *parent = nullptr);

    enum UserDetailsRoles {
        IdRole = Qt::UserRole + 1,
        UserIdRole,
        NicknameRole,
        BirthYearRole,
        HeightRole,
        WeightRole,
        GenderRole,
    };

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;

    Q_INVOKABLE void addUserDetails(const QString &userId, const QString &nickname, const QString &birthYear, const QString &height, const QString &weight, const QString &gender);
    Q_INVOKABLE void updateUserDetails(int id, const QString &nickname, const QString &birthYear, const QString &height, const QString &weight, const QString &gender);
    Q_INVOKABLE QVariantMap getUserDetails();
    void fetchData();

private:
    QList<UserDetails> m_userDetails;
    std::unique_ptr<UserDetailsRepository> m_repository; // Obiekt dostępu do bazy, użycie inteligentnego wskaźnika, żeby pamięć została automatycznie zwolniona
};

#endif // USERDETAILSMODEL_H
