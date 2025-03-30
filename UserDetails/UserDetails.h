#ifndef USERDETAILS_H
#define USERDETAILS_H

#include <QString>

struct UserDetails {
    int id;
    QString user_id;
    QString nickname;
    QString birth_year;
    QString height;
    QString weight;
    QString gender;
    //QString synch;
    //QString create_stamp;
    //QString modify_stamp;
};

#endif // USERDETAILS_H
