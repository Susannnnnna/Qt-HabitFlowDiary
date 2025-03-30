import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import "../AppSettings"
import "../SharedComponents"

Item {
    height: 40
    anchors.left: parent.left
    anchors.right: parent.right

    property var labelInput //: ["Yes", "No"] ["Woman", "Man"] ["1", "2", "3", "4", "5", "6"]
    property int selectedIndex: -1
    property string selectedValue: ""
    property bool checkState

    Row {
        spacing: (parent.width / labelInput.length) / labelInput.length

        Repeater {
            model: labelInput.length

            RadioButton {
                id: radioButton
                checked: (selectedIndex === index)

                Text {
                    padding: 2
                    anchors.left: rectangleIndicator.right
                    text: labelInput[index]
                    font.pixelSize: AppSettings.theme.fontSize
                    color: AppSettings.theme.buttonBorderColor
                }

                onClicked: {
                    selectedIndex = index
                    selectedValue = labelInput[index]
                    checkState = radioButton.checked
                    //console.log("Index: ", selectedIndex, ", Value: ", selectedValue, ", Checked state: ", checkState)
                }

                indicator: Rectangle {
                    id: rectangleIndicator
                    width: 20
                    height: 20
                    radius: 5
                    color: checked ? AppSettings.theme.radioButtonCheckedColor : AppSettings.theme.backgroundColor
                    border.color: AppSettings.theme.generalBorderColor
                    border.width: 1
                }
            }
        }
    }
}



