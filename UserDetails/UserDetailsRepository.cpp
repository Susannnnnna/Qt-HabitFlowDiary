#include "UserDetailsRepository.h"

UserDetailsRepository::UserDetailsRepository(QObject *parent) : QObject(parent) {}

bool UserDetailsRepository::addUserDetails(const QString &userId, const QString &nickname, const QString &birthYear, const QString &height, const QString &weight, const QString &gender) {
    QSqlDatabase db = DatabaseManager::instance().database();
    QSqlQuery query(db);
    query.prepare("INSERT INTO user_details (user_id, nickname, birth_year, height, weight, gender) VALUES (?, ?, ?, ?, ?, ?)");
    query.addBindValue(userId);
    query.addBindValue(nickname);
    query.addBindValue(birthYear);
    query.addBindValue(height);
    query.addBindValue(weight);
    query.addBindValue(gender);
    return query.exec();
}

bool UserDetailsRepository::updateUserDetails(int id, const QString &nickname, const QString &birthYear, const QString &height, const QString &weight, const QString &gender) {
    QSqlDatabase db = DatabaseManager::instance().database();
    QSqlQuery query(db);
    query.prepare("UPDATE user_details SET nickname = ?, birth_year = ?, height = ?, weight = ?, gender = ? WHERE id = ?");
    query.addBindValue(nickname);
    query.addBindValue(birthYear);
    query.addBindValue(height);
    query.addBindValue(weight);
    query.addBindValue(gender);
    query.addBindValue(id);
    return query.exec();
}

QList<UserDetails> UserDetailsRepository::fetchUserDetails() {
    QList<UserDetails> userDetails;
    QSqlDatabase db = DatabaseManager::instance().database();
    QSqlQuery query(db);
    query.prepare("SELECT id, user_id, nickname, birth_year, height, weight, gender FROM user_details LIMIT 1");

    if (query.exec()) {
        while (query.next()) {
            UserDetails ud;
            ud.id = query.value(0).toInt();
            ud.user_id = query.value(1).toString();
            ud.nickname = query.value(2).toString();
            ud.birth_year = query.value(3).toString();
            ud.height = query.value(4).toString();
            ud.weight = query.value(5).toString();
            ud.gender = query.value(6).toString();
            userDetails.append(ud);
        }
    }
    return userDetails;
}
