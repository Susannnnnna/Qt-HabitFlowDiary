import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material
import "../AppSettings"
import "../SharedComponents"

Dialog {
    id: inputData
    height: 330
    width: 340
    x: (parent.width - width) / 2
    y: (parent.height - height) / 2

    modal: true
    visible: false

    property var onConfirmAction // Callback - calls function from the outside
    property int idRecordToEdit: 0

    property string firstFieldLabel
    property string firstFieldInnerText
    property string secondFieldLabel
    property real secondFieldInnerText
    property string thirdFieldLabel
    property string thirdFieldInnerText

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

            CustomLabel {
                id: firstLabel
                width: parent.width
                labelText: firstFieldLabel
            }
            CustomTextField {
                id: firstField
                width: parent.width
                innerText: firstFieldInnerText
            }

            CustomLabel {
                id: secondLabel
                width: parent.width
                labelText: secondFieldLabel
            }
            CustomSpinBox {
                id: secondField
                width: parent.width
                inputValue: secondFieldInnerText
                toValue: 180
            }

            CustomLabel {
                id: thirdLabel
                labelText: thirdFieldLabel
            }

            CustomTextArea {
                id: thirdField
                innerText: thirdFieldInnerText
            }

            ButtonWithText {
                anchors.right: parent.right
                onClicked: {
                    firstLabel.color = AppSettings.theme.fontColor;
                    secondLabel.color = AppSettings.theme.fontColor;
                    thirdLabel.color = AppSettings.theme.fontColor;
                    if (firstField.text !== "" && thirdField.text !== "") {
                        if (onConfirmAction) {
                            if (idRecordToEdit > 0) {
                                onConfirmAction(idRecordToEdit, firstField.text, secondField.value, thirdField.text);
                            } else {
                                onConfirmAction(firstField.text, secondField.value, thirdField.text);
                                firstField.text = "";
                                thirdField.text = "";
                            }
                            inputData.visible = false;
                        }
                    } else if (firstField.text === "") {
                        firstLabel.color = AppSettings.theme.fontColorWarning;
                    } else if (secondField.value === 0.0) {
                        secondLabel.color = AppSettings.theme.fontColorWarning;
                    } else if (thirdField.text === "") {
                        thirdLabel.color = AppSettings.theme.fontColorWarning;
                    }
                }
            }
        }
    }
}
