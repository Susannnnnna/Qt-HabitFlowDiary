import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material
import "../AppSettings"
import "../SharedComponents"

Dialog {
    id: inputData
    height: 280
    width: 340
    x: (parent.width - width) / 2
    y: (parent.height - height) / 2

    modal: true
    visible: false

    property var onConfirmAction
    property int idRecordToEdit: 0

    property string firstFieldLabel
    property string firstFieldInnerText
    property string secondFieldLabel
    property string secondFieldInnerText

    background: DialogBackgroundField { }

    Item {
        id: item
        width: parent.width
        height: parent.height
        anchors.centerIn: parent

        Column {
            spacing: 3
            anchors.left: parent.left
            anchors.right: parent.right

            Row {
                spacing: 1
                anchors.left: parent.left
                anchors.right: parent.right

                CustomLabel {
                    id: firstLabel
                    width: parent.width
                    labelText: firstFieldLabel
                }
            }

            Row {
                spacing: 1
                anchors.left: parent.left
                anchors.right: parent.right

                CustomTextField {
                    id: firstField
                    width: parent.width
                    innerText: firstFieldInnerText
                }
            }

            CustomLabel {
                id: secondLabel
                labelText: secondFieldLabel
            }

            CustomTextArea {
                id: secondField
                innerText: secondFieldInnerText
            }

            ButtonWithText {
                anchors.right: parent.right
                onClicked: {
                    firstLabel.color = AppSettings.theme.fontColor;
                    secondLabel.color = AppSettings.theme.fontColor;
                    if (firstField.text !== "" && secondField.text !== "") {
                        if (onConfirmAction) {
                            if (idRecordToEdit > 0) {
                                onConfirmAction(idRecordToEdit, firstField.text, secondField.text);
                            } else {
                                onConfirmAction(firstField.text, secondField.text);
                                firstField.text = "";
                                secondField.text = "";
                            }
                            inputData.visible = false;
                        }
                    } else if (firstField.text === "") {
                        firstLabel.color = AppSettings.theme.fontColorWarning;
                    } else if (secondField.text === "") {
                        secondLabel.color = AppSettings.theme.fontColorWarning;
                    }
                }
            }
        }
    }
}
