import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material
import "./AppSettings"
import "./SharedComponents"
import "./Meals"
import "./Exercises"
import "./OAuth"

ApplicationWindow {
    visible: true
    width: 360
    height: 640    


    property string homeScreenPath:             AppSettings.uiSettings.rootPath + "HomeScreen.qml"
    property string additionaEventsScreenPath:  AppSettings.uiSettings.rootPath + "AdditionalEvents/AdditionalEventsScreen.qml"
    property string wellBeingScreenPath:        AppSettings.uiSettings.rootPath + "WellBeing/WellBeingScreen.qml"
    property string loginScreenPath:            AppSettings.uiSettings.rootPath + "OAuth/LoginScreen.qml"
    property string logoutScreenPath:           AppSettings.uiSettings.rootPath + "OAuth/LogoutScreen.qml"
    property string mealsScreenPath:            AppSettings.uiSettings.rootPath + "Meals/MealsScreen.qml"
    property string exercisesScreenPath:        AppSettings.uiSettings.rootPath + "Exercises/ExercisesScreen.qml"
    property string settingsScreenPath:         AppSettings.uiSettings.rootPath + "UserDetails/UserDetailsScreen.qml"

    property string mainTitle:                  "Healthy Diary"
    property string exercisesTitle:             "Exercises"
    property string mealsTitle:                 "Meals"
    property string wellBeingTitle:             "Wellbeing"
    property string additionalEventsTitle:      "Additional Events"
    property string settingsTitle:              "Settings"
    property string logoutTitle:                "Log Out"

    Material.accent: "transparent"
    background: Rectangle {
        color: AppSettings.theme.backgroundColor
    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: homeScreenPath
        //onCurrentItemChanged: tabBar.visible = !(stackView.currentItem instanceof Qt.resolvedUrl(homeScreenPath))
    }

    header: ToolBar {
        contentHeight: 60
        background: Rectangle {
            color: "white"
        }

        Row {
            width: parent.width
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 5

            // Left side header
            ToolButton {
                anchors.verticalCenter: parent.verticalCenter
                ImageIcons {
                    heightMultiplier: 0.85
                    widthMultiplier: 0.85
                    iconPath: AppSettings.icons.sideMenuIcon
                }

                onClicked: {
                    if (drawer.visible) {
                        drawer.close()
                    } else {
                        drawer.open()
                    }
                }
            }

            // Transparent space to center
            Rectangle {
                width: parent.width * 0.25
                height: 1
                color: "transparent"
            }

            // Middle side header
            Row {
                anchors.centerIn: parent
                spacing: 5
                ImageIcons {
                    id: dynamicHeaderIcon
                    iconVisible: false
                }

                Label {
                    id: headerLabel
                    anchors.verticalCenter: parent.verticalCenter
                    text: mainTitle
                    color: AppSettings.theme.fontColor
                    font.pointSize: AppSettings.theme.fontSize
                }
            }

            // Transparent space to center
            Rectangle {
                width: parent.width * 0.25
                height: 1
                color: "transparent"
            }

            // Right side header
            ToolButton {
                id: homeButton
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                visible: false

                ImageIcons {
                    heightMultiplier: 0.6
                    widthMultiplier: 0.6
                    iconPath: AppSettings.icons.homeIcon
                }

                onClicked: {
                    dynamicHeaderIcon.visible = false
                    headerLabel.text = mainTitle
                    homeButton.visible = false
                    stackView.push(Qt.resolvedUrl(homeScreenPath))
                    footer.visible = true
                }
            }
        }

        BottomLineSeparator {
            heightMultiplier: 3
        }
    }

    Drawer {
        id: drawer
        width: (parent.width * 0.5)
        height: parent.height
        edge: Qt.LeftEdge

        background: Rectangle {
            color: AppSettings.theme.backgroundColor
        }

        ListView {
            width: parent.width
            height: parent.height
            model: [
                settingsTitle,
                exercisesTitle,
                mealsTitle,
                wellBeingTitle,
                additionalEventsTitle,
                logoutTitle ]

            delegate: ItemDelegate {
                width: parent.width
                height: 50
                text: modelData
                font.pointSize: AppSettings.theme.fontSize * (3/4)
                Rectangle {
                    width: parent.width * 0.99
                    height: 1
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    color: AppSettings.theme.generalBorderColor
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        drawer.close()
                        if (modelData === settingsTitle) {
                            dynamicHeaderIcon.visible = true
                            dynamicHeaderIcon.source = AppSettings.icons.settingsIcon
                            homeButton.visible = true
                            headerLabel.text = settingsTitle
                            homeButton.visible = true
                            stackView.push(Qt.resolvedUrl(settingsScreenPath))
                            footer.visible = false
                        } else if (modelData === exercisesTitle) {
                            dynamicHeaderIcon.visible = true
                            dynamicHeaderIcon.source = AppSettings.icons.exerciseIcon
                            homeButton.visible = true
                            headerLabel.text = exercisesTitle
                            stackView.push(Qt.resolvedUrl(exercisesScreenPath))
                            footer.visible = false
                        } else if (modelData === mealsTitle) {
                            dynamicHeaderIcon.visible = true
                            dynamicHeaderIcon.source = AppSettings.icons.foodIcon
                            homeButton.visible = true
                            headerLabel.text = mealsTitle
                            stackView.push(Qt.resolvedUrl(mealsScreenPath))
                            footer.visible = false
                        } else if (modelData === wellBeingTitle) {
                            dynamicHeaderIcon.visible = true
                            dynamicHeaderIcon.source = AppSettings.icons.wellbeingIcon
                            homeButton.visible = true
                            headerLabel.text = wellBeingTitle
                            homeButton.visible = true
                            stackView.push(Qt.resolvedUrl(wellBeingScreenPath))
                            footer.visible = false
                        } else if (modelData === additionalEventsTitle) {
                            dynamicHeaderIcon.visible = true
                            dynamicHeaderIcon.source = AppSettings.icons.additionalEventsIcon
                            homeButton.visible = true
                            headerLabel.text = additionalEventsTitle
                            homeButton.visible = true
                            stackView.push(Qt.resolvedUrl(additionaEventsScreenPath))
                            footer.visible = false
                        } else if (modelData === logoutTitle) {
                            dynamicHeaderIcon.visible = true
                            dynamicHeaderIcon.source = AppSettings.icons.logoutIcon
                            homeButton.visible = true
                            headerLabel.text = logoutTitle
                            homeButton.visible = true
                            stackView.push(Qt.resolvedUrl(logoutScreenPath))
                            footer.visible = false
                        } else {
                            stackView.push(Qt.resolvedUrl(homeScreenPath), { category: modelData })
                        }
                    }
                }
            }
        }
    }

    footer: TabBar {
        id: footer
        height: 65

        background: Rectangle {
            color: AppSettings.theme.footerColor
        }

        TabButtonFooter {
            id: tabMeals
            anchors.left: parent.left
            stackViewPath: Qt.resolvedUrl(mealsScreenPath)
            iconPath: Qt.resolvedUrl(AppSettings.icons.foodIcon)
            footerElementText: mealsTitle
        }

        TabButtonFooter {
            id: tabExercises
            anchors.left: tabMeals.right
            stackViewPath: Qt.resolvedUrl(exercisesScreenPath)
            iconPath: Qt.resolvedUrl(AppSettings.icons.exerciseIcon)
            footerElementText: exercisesTitle
        }

        TabButtonFooter {
            anchors.left: tabExercises.right
            stackViewPath: Qt.resolvedUrl(wellBeingScreenPath)
            iconPath: Qt.resolvedUrl(AppSettings.icons.wellbeingIcon)
            footerElementText: wellBeingTitle
        }
    }
}
