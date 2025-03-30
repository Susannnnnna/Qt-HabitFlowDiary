#ifndef WELLBEINGCALCULATOR_H
#define WELLBEINGCALCULATOR_H

#include <QString>
#include <QDebug>
#include "Wellbeing.h"

class WellbeingCalculator {
public:
    static int calculatorLevel(const Wellbeing &input);
    static QString levelToDescription(int level);
    static QString levelToColor(int level);
};

#endif // WELLBEINGCALCULATOR_H
