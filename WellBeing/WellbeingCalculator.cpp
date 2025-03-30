#include "WellbeingCalculator.h"

int WellbeingCalculator::calculatorLevel(const Wellbeing &input) {
    int sleepTimeScore;
    int periodScore;
    int elementsNumber = 5;

    int wellbeing = input.wellbeing; // scale: 0 - 5
    int sleepTime = input.sleep_time; // 7 - 9 OK
    int period = input.period; // 0 - yes, 1 - no
    int skinConditon = input.skin_condition; // scale: 0 - 5
    int distraction = input.distraction; // scale: 0 - 5

    if (sleepTime >= 7 && sleepTime < 9) {
        sleepTimeScore = 5;
    } else if (sleepTime < 7) {
        sleepTimeScore = 0;
    } else if (sleepTime > 9) {
        sleepTimeScore = 4;
    }

    if (period == 1) {
        periodScore = 5;
    } else {
        periodScore = 0;
    }

    int score = ((wellbeing + sleepTimeScore + periodScore + skinConditon - distraction) / elementsNumber);

    qDebug() << "elementsNumber = " << elementsNumber << ", wellbeing = " << wellbeing << ", sleepTimeScore = " << sleepTimeScore << ", periodScore = " << periodScore << ", skinConditon = " << skinConditon << ", distraction = " << distraction << ", FINAL SCORE = " << score;

    return score;
}

QString WellbeingCalculator::levelToDescription(int level) {
    switch (level) {
        case 0: return "Very bad";
        case 1: return "Bad";
        case 2: return "Not bad";
        case 3: return "Good";
        case 4: return "Very good";
        case 5: return "Excellent";
        default: return "Error: out of scale";
    }
}

QString WellbeingCalculator::levelToColor(int level) {
    switch (level) {
        case 0: return "#FF6969";
        case 1: return "#FF6969";
        case 2: return "#73E1F7";
        case 3: return "#6FFA99";
        case 4: return "#21F05F";
        case 5: return "#21F05F";
        default: return "transparent";
    }

    // switch (level) {
    // case 0: return "red";
    // case 1: return "red";
    // case 2: return "#4336F7";
    // case 3: return "green";
    // case 4: return "green";
    // case 5: return "green";
    // default: return "transparent";
    // }
}
