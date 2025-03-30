import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "./AppSettings"
import "./SharedComponents"

Page {
    id: pageItem
    padding: 50

    property int rowWidth: 150
    property int rowHeight: 80
    property string buttonInnerText: "Log in"
    property string loginScreenPath: AppSettings.uiSettings.rootPath + "OAuth/LoginScreen.qml"

    background: Rectangle {
        color: AppSettings.theme.backgroundColor
    }

    Item {
        width: parent.width
        height: parent.height - 10

        CustomLabel {
            labelText: "Welcome in Health Diary Flow!"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            textBold: true
            textSize: 20
        }

        Column {
            x: (parent.width - width) / 2
            y: (parent.height - height) / 2

            Row {
                height: rowHeight
                width: rowWidth
                ImageIcons {
                    id: sleepIcon
                    iconPath: AppSettings.icons.sleepIcon
                }
                CustomLabel {
                    anchors.bottom: sleepIcon.bottom
                    labelText: " Sleep"
                    textSize: 20
                }
            }

            Row {
                height: rowHeight
                width: rowWidth
                ImageIcons {
                    id: exerciseIcon
                    iconPath: AppSettings.icons.exerciseIcon
                }
                CustomLabel {
                    anchors.bottom: exerciseIcon.bottom
                    labelText: " Do exercises"
                    textSize: 20
                }
            }

            Row {
                height: rowHeight
                width: rowWidth
                ImageIcons {
                    id: foodIcon
                    iconPath: AppSettings.icons.foodIcon
                }
                CustomLabel {
                    anchors.bottom: foodIcon.bottom
                    labelText: " Eat"
                    textSize: 20
                }
            }

            Row {
                height: rowHeight
                width: rowWidth
                ImageIcons {
                    id: repeatIcon
                    iconPath: AppSettings.icons.cycleIcon
                }
                CustomLabel {
                    anchors.bottom: repeatIcon.bottom
                    labelText: " and REPEAT!"
                    textSize: 20
                }
            }
        }

        ButtonWithText {
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            innerColor: "transparent"
            buttonText: buttonInnerText

            onClicked: { stackView.push(Qt.resolvedUrl(loginScreenPath)) }
        }
    }
}
