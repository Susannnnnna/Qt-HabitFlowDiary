import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material
import "../AppSettings"
import "../SharedComponents"

Page {
    property string logoutTitle: "Are you sure you wanna..."
    property string buttonInnerText: "Log out?"

    background: Rectangle { color: AppSettings.theme.backgroundColor }

    Item {
        width: 300
        height: 100
        anchors.centerIn: parent

        Column {
            spacing: 10
            width: parent.width

            CustomLabel {
                horizontalAlignment: Text.AlignHCenter
                labelText: logoutTitle
                textSize: 10
            }

            ButtonWithText {
                anchors.horizontalCenter: parent.horizontalCenter
                buttonText: buttonInnerText

                onClicked: { console.log("TODO add log out") }
            }
        }
    }
}
