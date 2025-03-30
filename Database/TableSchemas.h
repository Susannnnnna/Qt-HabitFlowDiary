// constexpr - stała C++ którą kompilator traktuje jako normalną zmienną
// #define - polecenie preprocesora które zamienia tekst przed kompilacją zanim kod trafi do kompilatora
// Example: "ALTER TABLE exercises ADD COLUMN new_column1 TEXT"
#ifndef TABLESCHEMAS_H
#define TABLESCHEMAS_H

#include <QString>

namespace TABLE_SCHEMAS {
    constexpr auto TABLE_EXERCISES = R"(
        CREATE TABLE IF NOT EXISTS exercises
            (id INTEGER PRIMARY KEY AUTOINCREMENT,
            user_id TEXT,
            exercise_date DATETIME,
            duration FLOAT,
            exercise TEXT,
            synch BOOLEAN DEFAULT FALSE,
            create_stamp DATETIME DEFAULT CURRENT_TIMESTAMP,
            modify_stamp DATETIME
        )
    )";

    constexpr auto TABLE_USER_DETAILS = R"(
        CREATE TABLE IF NOT EXISTS user_details
            (id INTEGER PRIMARY KEY AUTOINCREMENT,
            user_id TEXT,
            nickname TEXT,
            birth_year INTEGER,
            height INTEGER,
            weight FLOAT,
            gender TEXT,
            synch BOOLEAN DEFAULT FALSE,
            create_stamp DATETIME DEFAULT CURRENT_TIMESTAMP,
            modify_stamp DATETIME
        )
    )";

    constexpr auto TABLE_MEALS = R"(
        CREATE TABLE IF NOT EXISTS meals
            (id INTEGER PRIMARY KEY AUTOINCREMENT,
            user_id TEXT,
            meal_date DATETIME,
            meal TEXT,
            meal_cal FLOAT,
            synch BOOLEAN DEFAULT FALSE,
            create_stamp DATETIME DEFAULT CURRENT_TIMESTAMP,
            modify_stamp DATETIME
        )
    )";

    constexpr auto TABLE_WELLBEING = R"(
        CREATE TABLE IF NOT EXISTS wellbeing
            (id INTEGER PRIMARY KEY AUTOINCREMENT,
            user_id TEXT,
            wellbeing_date DATETIME,
            sleep_time INTEGER,
            period BOOLEAN,
            wellbeing INTEGER,
            skin_condition INTEGER,
            distraction INTEGER,
            wellbeing_level INTEGER,
            synch BOOLEAN DEFAULT FALSE,
            create_stamp DATETIME DEFAULT CURRENT_TIMESTAMP,
            modify_stamp DATETIME
        )
    )";

    constexpr auto TABLE_ADDITIONAL_EVENTS = R"(
        CREATE TABLE IF NOT EXISTS additional_events
            (id INTEGER PRIMARY KEY AUTOINCREMENT,
            user_id TEXT,
            additional_event_date DATETIME,
            additional_event TEXT,
            synch BOOLEAN DEFAULT FALSE,
            create_stamp DATETIME DEFAULT CURRENT_TIMESTAMP,
            modify_stamp DATETIME
        )
    )";
}

#endif // TABLESCHEMAS_H
