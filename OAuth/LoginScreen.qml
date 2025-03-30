import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material
import "../AppSettings"
import "../SharedComponents"

Page {
    property string loginTitle: "Username or Email"
    property string passwordTitle: "Password"
    property string buttonText: "Confirm"

    property string loginValue: ""
    property string passwordValue: ""

    background: Rectangle { color: AppSettings.theme.backgroundColor }

    Item {
        width: 300
        height: 250
        anchors.centerIn: parent

        Column {
            spacing: 10
            width: parent.width

            CustomLabel {
                horizontalAlignment: Text.AlignHCenter
                labelText: loginTitle
            }

            CustomTextField {
                innerText: loginValue
            }

            CustomLabel {
                horizontalAlignment: Text.AlignHCenter
                labelText: passwordTitle
            }

            CustomTextField {
                innerText: passwordValue
                echoMode: TextInput.Password // hide password
            }

            ButtonWithText {
                anchors.horizontalCenter: parent.horizontalCenter
                buttonText: buttonText

                onClicked: { console.log("TODO add log in - OAuth") }
            }
        }
    }

}
