import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material
import "../AppSettings"
import "../SharedComponents"

Dialog {
    id: inputData
    height: 450
    width: 340
    x: (parent.width - width) / 2
    y: (parent.height - height) / 2

    modal: true
    visible: false

    property var onConfirmAction // Callback - calls function from the outside
    property int idRecordToEdit: 0
    property var checkboxThirdLabelInput
    property var checkboxMultiLabelsInput

    property string firstFieldLabel
    property string firstFieldInnerText
    property string firstFieldDefaultText
    property string secondFieldLabel
    property var secondFieldCheckboxList
    property int secondFieldInnerText
    property string thirdFieldLabel
    property int thirdFieldInnerText
    property int thirdFieldDefaulText
    property string fourthFieldLabel
    property int fourthFieldInnerText
    property int fourthFieldDefaulText
    property string fifthFieldLabel
    property int fifthFieldInnerText
    property int fifthFieldDefaulText

    background: DialogBackgroundField { }

    Item {
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
                innerText: firstFieldInnerText ? firstFieldInnerText : firstFieldDefaultText
            }

            CustomLabel {
                id: secondLabel
                width: parent.width
                labelText: secondFieldLabel
                textBold: true
            }
            CustomRadioButton {
                id: secondField
                labelInput: secondFieldCheckboxList
                selectedIndex: secondFieldInnerText
            }


            CustomLabel {
                id: thirdLabel
                width: parent.width
                labelText: thirdFieldLabel
                textBold: true
            }
            CustomSpinBox {
                id: thirdField
                width: parent.width
                inputValue: thirdFieldInnerText ? thirdFieldInnerText : thirdFieldDefaulText
            }


            CustomLabel {
                id: fourthLabel
                width: parent.width
                labelText: fourthFieldLabel
                textBold: true
            }
            CustomSpinBox {
                id: fourthField
                width: parent.width
                inputValue: fourthFieldInnerText ? fourthFieldInnerText : fourthFieldDefaulText
            }


            CustomLabel {
                id: fifthLabel
                width: parent.width
                labelText: fifthFieldLabel
                textBold: true
            }
            CustomSpinBox {
                id: fifthField
                width: parent.width
                inputValue: fifthFieldInnerText ? fifthFieldInnerText : fifthFieldDefaulText
            }


            ButtonWithText {
                anchors.right: parent.right
                onClicked: {
                    if (onConfirmAction) {
                        onConfirmAction(firstField.text, secondField.selectedIndex, thirdField.value, fourthField.value, fifthField.value);
                        inputData.visible = false;
                    }
                }
            }
        }
    }
}
