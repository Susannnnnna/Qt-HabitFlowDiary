cmake_minimum_required(VERSION 3.16)

project(HabitFlowDiary VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTOMOC ON) #[[ czy potrzebne?]]
set(CMAKE_INCLUDE_CURRENT_DIR ON) #[[ czy potrzebne?]]

find_package(Qt6 REQUIRED COMPONENTS Core Gui Qml Quick Sql)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appHabitFlowDiary
    main.cpp

    Database/TableSchemas.h
    Database/DatabaseInitializer.h
    Database/DatabaseInitializer.cpp
    Database/DatabaseManager.h
    Database/DatabaseManager.cpp

    Exercises/Exercise.h
    Exercises/ExercisesRepository.h
    Exercises/ExercisesRepository.cpp
    Exercises/ExercisesModel.h
    Exercises/ExercisesModel.cpp

    UserDetails/UserDetails.h
    UserDetails/UserDetailsRepository.h
    UserDetails/UserDetailsRepository.cpp
    UserDetails/UserDetailsModel.h
    UserDetails/UserDetailsModel.cpp

    Meals/Meal.h
    Meals/MealsModel.h
    Meals/MealsModel.cpp
    Meals/MealsRepository.h
    Meals/MealsRepository.cpp

    WellBeing/Wellbeing.h
    WellBeing/WellbeingsModel.h
    WellBeing/WellbeingsModel.cpp
    WellBeing/WellbeingsRepository.h
    WellBeing/WellbeingsRepository.cpp
    WellBeing/WellbeingCalculator.h
    WellBeing/WellbeingCalculator.cpp

    AdditionalEvents/AdditionalEvent.h
    AdditionalEvents/AdditionalEventsModel.h
    AdditionalEvents/AdditionalEventsModel.cpp
    AdditionalEvents/AdditionalEventsRepository.h
    AdditionalEvents/AdditionalEventsRepository.cpp
)

set_source_files_properties(
    AppSettings/AppSettings.qml
    AppSettings/Theme.qml
    AppSettings/Icons.qml
    AppSettings/UiSettings.qml

    PROPERTIES QT_QML_SINGLETON_TYPE TRUE
)

qt_policy(SET QTP0004 NEW)
qt_add_qml_module(appHabitFlowDiary
    URI HabitFlowDiary
    VERSION 1.0

    QML_FILES
        Main.qml
        HomeScreen.qml

        AppSettings/AppSettings.qml
        AppSettings/Theme.qml
        AppSettings/Icons.qml
        AppSettings/UiSettings.qml

        UserDetails/UserDetailsScreen.qml
        UserDetails/UserDetailsInputDialog.qml

        Exercises/ExercisesScreen.qml
        Exercises/ExercisesInputDialog.qml

        Meals/MealsScreen.qml
        Meals/MealsInputDialog.qml

        WellBeing/WellBeingInputDialog.qml
        WellBeing/WellBeingScreen.qml

        AdditionalEvents/AdditionalEventsInputDialog.qml
        AdditionalEvents/AdditionalEventsScreen.qml

        OAuth/LoginScreen.qml
        OAuth/LogoutScreen.qml

        SharedComponents/ImageIcons.qml
        SharedComponents/TabButtonFooter.qml
        SharedComponents/DialogBackgroundField.qml
        SharedComponents/BottomLineSeparator.qml
        SharedComponents/ButtonWithIcon.qml
        SharedComponents/ButtonWithText.qml
        SharedComponents/CustomTextField.qml
        SharedComponents/CustomLabel.qml
        SharedComponents/CustomTextArea.qml
        SharedComponents/CustomSpinBox.qml
        SharedComponents/CustomRadioButton.qml

    RESOURCES
        README.md
        Assets/icons/menu-bar2.png
        Assets/icons/home-page.png
        Assets/icons/wellbeing.png
        Assets/icons/diet.png
        Assets/icons/additional-events.png
        Assets/icons/personal-settings.png
        Assets/icons/logout.png
        Assets/icons/yoga-pose.png
        Assets/icons/delete2.png
        Assets/icons/add.png
        Assets/icons/warning.png
        Assets/icons/sleep.png
        Assets/icons/cycle.png
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appHabitFlowDiary PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appHabitFlowDiary
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appHabitFlowDiary
    PRIVATE Qt6::Core Qt6::Gui Qt6::Qml Qt6::Quick Qt6::Sql
)

include(GNUInstallDirs)
install(TARGETS appHabitFlowDiary
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
