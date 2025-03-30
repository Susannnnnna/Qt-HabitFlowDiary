import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "../AppSettings"
import "../SharedComponents"

Page {
    anchors.fill: parent

    property var userData: userDetailsModel.getUserDetails()
    property var genderList: ["Woman", "Man"] // TODO add dictionary in the backend
    property string innerButtonText: "Modify"

    property string nicknameTitle: "Nickname"
    property string genderTitle: "Gender"
    property string birthYearTitle: "Birth year"
    property string heightTitle: "Height [cm]"
    property string weightTitle: "Weight [kg]"

    property string nickname: userData.nickname
    property int userBirthYear: userData.birth_year
    property int userHeight: userData.height
    property real userWeight: userData.weight
    property string gender: userData.gender

    background: Rectangle {
        color: AppSettings.theme.backgroundColor
    }

    Item {
        width: parent.width
        height: parent.height - 10
        anchors.centerIn: parent

        Column {
            spacing: 8
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: 10


            CustomLabel {
                labelText: nicknameTitle
                textBold: true
            }
            CustomTextField {
                id: nicknameItem
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                innerText: nickname
                readOnly: true
            }


            CustomLabel {
                labelText: genderTitle
                textBold: true
            }
            CustomTextField {
                id: genderItem
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                innerText: genderList ? genderList : ""
                readOnly: true
            }


            CustomLabel {
                labelText: birthYearTitle
                textBold: true
            }
            CustomTextField {
                id: birthYearItem
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                innerText: userBirthYear ? userBirthYear : ""
                readOnly: true
            }


            CustomLabel {
                labelText: heightTitle
                textBold: true
            }
            CustomTextField {
                id: heightItem
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                innerText: userHeight ? userHeight : ""
                readOnly: true
            }


            CustomLabel {
                labelText: weightTitle
                textBold: true
            }
            CustomTextField {
                id: weightItem
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                innerText: userWeight ? userWeight : ""
                readOnly: true
            }


            ButtonWithText {
                anchors.right: parent.right
                buttonText: innerButtonText

                onClicked: {
                    addOrEditUserDetailsData.open()
                }
            }
        }
    }

    UserDetailsInputDialog {
        id: addOrEditUserDetailsData
        firstFieldLabel: nicknameTitle
        firstFieldInnerText: nicknameItem.text
        firstFieldDefaultText: ""
        secondFieldLabel: genderTitle
        secondFieldCheckboxList: genderList
        secondFieldInnerText: genderItem = "Women" ? 0 : 1 // TODO repair
        thirdFieldLabel: birthYearTitle
        thirdFieldInnerText: birthYearItem.text
        thirdFieldDefaulText: 1990
        fourthFieldLabel: heightTitle
        fourthFieldInnerText: heightItem.text
        fourthFieldDefaulText: 162
        fifthFieldLabel: weightTitle
        fifthFieldInnerText: weightItem.text
        fifthFieldDefaulText: 52
        onConfirmAction: function (nickname, gender, birthYear, height, weight) {
            console.log("TODO add refreshing page");
            if (userData.id > 0) {
                //console.log("EDIT: ", userData.id, nickname, birthYear, height, weight, gender);
                userDetailsModel.updateUserDetails(userData.id, nickname, birthYear, height, weight, gender);
                addOrEditUserDetailsData.close();
            } else {
                //console.log("ADD: ", "userIdTest", nickname, gender, birthYear, height, weight);
                userDetailsModel.addUserDetails("userIdTest", nickname, birthYear, height, weight, gender);
                addOrEditUserDetailsData.close();
            }
        }
    }
}
