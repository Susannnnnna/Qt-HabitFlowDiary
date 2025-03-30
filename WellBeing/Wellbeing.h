#ifndef WELLBEING_H
#define WELLBEING_H

#include <QString>

struct Wellbeing {
    int id;
    QString user_id;
    QString wellbeing_date;
    int sleep_time;
    bool period;
    int wellbeing;
    int skin_condition;
    int distraction;
    int wellbeing_level;
    //QString synch;
    //QString create_stamp;
    //QString modify_stamp;

    QString wellbeing_level_description;
    QString wellbeing_level_color;
};

#endif // WELLBEING_H
