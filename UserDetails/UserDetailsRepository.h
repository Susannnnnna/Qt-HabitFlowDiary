#ifndef USERDETAILSREPOSITORY_H
#define USERDETAILSREPOSITORY_H

#include <QObject>
#include <QSqlQuery>
#include <QSqlError>
#include <QList>
#include "../Database/DatabaseManager.h"
#include "UserDetails.h"

class UserDetailsRepository : public QObject {
    Q_OBJECT
public:
    explicit UserDetailsRepository(QObject *parent = nullptr);

    bool addUserDetails(const QString &userId, const QString &nickname, const QString &birthYear, const QString &height, const QString &weight, const QString &gender);
    bool updateUserDetails(int id, const QString &nickname, const QString &birthYear, const QString &height, const QString &weight, const QString &gender);
    QList<UserDetails> fetchUserDetails();

};

#endif // USERDETAILSREPOSITORY_H
