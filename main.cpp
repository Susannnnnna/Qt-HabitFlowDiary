#include <QDateTime>
#include <QMetaType>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "./Database/DatabaseManager.h"
#include "./Database/DatabaseInitializer.h"
#include "./Exercises/ExercisesModel.h"
#include "./UserDetails/UserDetailsModel.h"
#include "./Meals/MealsModel.h"
#include "./AdditionalEvents/AdditionalEventsModel.h"
#include "./WellBeing/WellbeingsModel.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    DatabaseManager::instance();
    DatabaseInitializer::setupDatabase();

    ExercisesModel exercisesModel;
    engine.rootContext()->setContextProperty("exercisesModel", &exercisesModel);
    UserDetailsModel userDetailsModel;
    engine.rootContext()->setContextProperty("userDetailsModel", &userDetailsModel);
    MealsModel mealsModel;
    engine.rootContext()->setContextProperty("mealsModel", &mealsModel);
    AdditionalEventsModel additionalEventsModel;
    engine.rootContext()->setContextProperty("additionalEventsModel", &additionalEventsModel);
    WellbeingsModel wellbeingsModel;
    engine.rootContext()->setContextProperty("wellbeingsModel", &wellbeingsModel);

    engine.load(QUrl(QStringLiteral("qrc:/Main.qml")));

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("HabitFlowDiary", "Main");

    return app.exec();
}
