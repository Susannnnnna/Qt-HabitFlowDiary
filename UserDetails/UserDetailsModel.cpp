#include "UserDetailsModel.h"

UserDetailsModel::UserDetailsModel(QObject *parent) : QAbstractListModel(parent) {
    m_repository = std::make_unique<UserDetailsRepository>(this);
    fetchData();
}

int UserDetailsModel::rowCount(const QModelIndex &parent) const {
    Q_UNUSED(parent);
    return m_userDetails.size();
}

QVariant UserDetailsModel::data(const QModelIndex &index, int role) const {
    if (!index.isValid() || index.row() >= m_userDetails.size())
        return QVariant();

    const UserDetails &user_details = m_userDetails.at(index.row());
    switch (role) {
    case IdRole: return user_details.id;
    case UserIdRole: return user_details.user_id;
    case NicknameRole: return user_details.nickname;
    case BirthYearRole: return user_details.birth_year;
    case HeightRole: return user_details.height;
    case WeightRole: return user_details.weight;
    case GenderRole: return user_details.gender;
    default: return QVariant();
    }
}

QHash<int, QByteArray> UserDetailsModel::roleNames() const {
    return {
        {IdRole, "id"},
        {UserIdRole, "user_id"},
        {NicknameRole, "nickname"},
        {BirthYearRole, "birth_year"},
        {HeightRole, "height"},
        {WeightRole, "weight"},
        {GenderRole, "gender"}
    };
}

void UserDetailsModel::addUserDetails(const QString &userId, const QString &nickname, const QString &birthYear, const QString &height, const QString &weight, const QString &gender) {
    if (m_repository->addUserDetails(userId, nickname, birthYear, height, weight, gender)) { fetchData(); }
}

void UserDetailsModel::updateUserDetails(int id, const QString &nickname, const QString &birthYear, const QString &height, const QString &weight, const QString &gender) {
    if (m_repository->updateUserDetails(id, nickname, birthYear, height, weight, gender)) { fetchData(); }
}

QVariantMap UserDetailsModel::getUserDetails() {
    QVariantMap map;

    QList<UserDetails> list = m_repository->fetchUserDetails();

    if (list.isEmpty())
        return map;

    const UserDetails &user = list.first();

    map["id"] = user.id;
    map["user_id"] = user.user_id;
    map["nickname"] = user.nickname;
    map["birth_year"] = user.birth_year;
    map["height"] = user.height;
    map["weight"] = user.weight;
    map["gender"] = user.gender;

    return map;
}

void UserDetailsModel::fetchData() {
    beginResetModel();
    m_userDetails = m_repository->fetchUserDetails();
    endResetModel();
}
