#ifndef MEALSH_H
#define MEALSH_H

#include <QString>

struct Meal {
    int id;
    QString user_id;
    QString meal_date;
    QString meal_cal;
    QString meal;
    //QString synch;
    //QString create_stamp;
    //QString modify_stamp;
};

#endif // MEALSH_H
