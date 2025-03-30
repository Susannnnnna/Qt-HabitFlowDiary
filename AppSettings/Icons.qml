pragma Singleton
import QtQuick

QtObject {
    // *** ICONS PATHS ***
    property string addIcon:                AppSettings.uiSettings.rootPath + "Assets/icons/add.png"
    property string additionalEventsIcon:   AppSettings.uiSettings.rootPath + "Assets/icons/additional-events.png"
    property string cycleIcon:              AppSettings.uiSettings.rootPath + "Assets/icons/cycle.png"
    property string deleteIcon:             AppSettings.uiSettings.rootPath + "Assets/icons/delete2.png"
    property string exerciseIcon:           AppSettings.uiSettings.rootPath + "Assets/icons/yoga-pose.png"
    property string foodIcon:               AppSettings.uiSettings.rootPath + "Assets/icons/diet.png"
    property string homeIcon:               AppSettings.uiSettings.rootPath + "Assets/icons/home-page.png"
    property string logoutIcon:             AppSettings.uiSettings.rootPath + "Assets/icons/logout.png"
    property string settingsIcon:           AppSettings.uiSettings.rootPath + "Assets/icons/personal-settings.png"
    property string sideMenuIcon:           AppSettings.uiSettings.rootPath + "Assets/icons/menu-bar2.png"
    property string sleepIcon:              AppSettings.uiSettings.rootPath + "Assets/icons/sleep.png"
    property string wellbeingIcon:          AppSettings.uiSettings.rootPath + "Assets/icons/wellbeing.png"

    // *** ICONS SETTINGS ***
    property real iconWidth:    45
    property real iconHeight:   45
}
