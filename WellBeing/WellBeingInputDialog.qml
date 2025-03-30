import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material
import "../AppSettings"
import "../SharedComponents"

Dialog {
    id: inputData
    height: 525
    width: 340
    x: (parent.width - width) / 2
    y: (parent.height - height) / 2

    modal: true
    visible: false

    property var onConfirmAction
    property int idRecordToEdit: 0
    property var checkboxThirdLabelInput
    property var checkboxMultiLabelsInput

    property string firstFieldLabel
    property string firstFieldInnerText
    property string secondFieldLabel
    property real secondFieldInnerText
    property string thirdFieldLabel
    property int thirdFieldInnerText
    property string fourthFieldLabel
    property int fourthFieldInnerText
    property string fifthFieldLabel
    property int fifthFieldInnerText
    property string sixthFieldLabel
    property int sixthFieldInnerText

    background: DialogBackgroundField { }

    Item {
        id: item
        width: parent.width
        height: parent.height
        anchors.centerIn: parent

        Column {
            spacing: 5
            anchors.left: parent.left
            anchors.right: parent.right

            CustomLabel {
                id: firstLabel
                width: parent.width
                labelText: firstFieldLabel
                textBold: true
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
                textBold: true
            }
            CustomSpinBox {
                id: secondField
                width: parent.width
                inputValue: secondFieldInnerText
                toValue: 24
            }

            CustomLabel {
                id: thirdLabel
                width: parent.width
                labelText: thirdFieldLabel
                textBold: true
            }
            CustomRadioButton {
                id: thirdField
                labelInput: checkboxThirdLabelInput
                selectedIndex: thirdFieldInnerText
            }

            CustomLabel {
                id: fourthLabel
                width: parent.width
                labelText: fourthFieldLabel
                textBold: true
            }
            CustomRadioButton {
                id: fourthField
                labelInput: checkboxMultiLabelsInput
                selectedIndex: fourthFieldInnerText
            }

            CustomLabel {
                id: fifthLabel
                width: parent.width
                labelText: fifthFieldLabel
                textBold: true
            }
            CustomRadioButton {
                id: fifthField
                labelInput: checkboxMultiLabelsInput
                selectedIndex: fifthFieldInnerText
            }

            CustomLabel {
                id: sixthLabel
                width: parent.width
                labelText: sixthFieldLabel
                textBold: true
            }
            CustomRadioButton {
                id: sixthField
                labelInput: checkboxMultiLabelsInput
                selectedIndex: sixthFieldInnerText
            }

            ButtonWithText {
                anchors.right: parent.right
                onClicked: {
                    console.log("TODO Repair validation")
                    //console.log("Sleep: ", secondField.value, "Period: ", thirdField.selectedValue, ", Wellbeing: ", fourthField.selectedValue, ", Skin condition: ", fifthField.selectedValue, ", Distraction: ", sixthField.selectedValue);
                    console.log("Sleep: ", secondField.value, "Period: ", thirdField.selectedIndex, ", Wellbeing: ", fourthField.selectedIndex, ", Skin condition: ", fifthField.selectedIndex, ", Distraction: ", sixthField.selectedIndex);

                    firstLabel.color = AppSettings.theme.fontColor;
                    secondLabel.color = AppSettings.theme.fontColor;
                    thirdLabel.color = AppSettings.theme.fontColor;
                    fourthLabel.color = AppSettings.theme.fontColor;
                    fifthLabel.color = AppSettings.theme.fontColor;
                    sixthLabel.color = AppSettings.theme.fontColor;

                    if (firstField.text !== "" && secondField.value !== "" && (thirdField.checkState) && (fourthField.checkState) && (fifthField.checkState)  && (sixthField.checkState)) {
                        if (onConfirmAction) {
                            if (idRecordToEdit > 0) {
                                onConfirmAction(idRecordToEdit, firstField.text, secondField.value, thirdField.selectedIndex, fourthField.selectedIndex, fifthField.selectedIndex, sixthField.selectedIndex);
                            } else {
                                thirdField.selectedIndex = AppSettings.uiSettings.clearRadiobuttonIndex;
                                fourthField.selectedIndex = AppSettings.uiSettings.clearRadiobuttonIndex;
                                fifthField.selectedIndex = AppSettings.uiSettings.clearRadiobuttonIndex;
                                sixthField.selectedIndex = AppSettings.uiSettings.clearRadiobuttonIndex;
                                onConfirmAction(firstField.text, secondField.value, thirdField.selectedIndex, fourthField.selectedIndex, fifthField.selectedIndex, sixthField.selectedIndex);
                            }
                            inputData.visible = false;
                        }
                    } else if (firstField.text === "") {
                        firstLabel.color = AppSettings.theme.fontColorWarning;
                    } else if (secondField.value === "") {
                        secondLabel.color = AppSettings.theme.fontColorWarning;
                    } else if (thirdField.checkState) {
                        thirdLabel.color = AppSettings.theme.fontColorWarning;
                    } else if (fourthField.checkState) {
                        fourthLabel.color = AppSettings.theme.fontColorWarning;
                    } else if (fifthField.checkState) {
                        fifthLabel.color = AppSettings.theme.fontColorWarning;
                    } else if (sixthField.checkState) {
                        sixthLabel.color = AppSettings.theme.fontColorWarning;
                    }
                }
            }
        }
    }
}
