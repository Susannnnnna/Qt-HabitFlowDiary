import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import "../AppSettings"
import "../SharedComponents"

Row {
    id: rowItem
    padding: 2
    height: 40
    anchors.left: parent.left
    anchors.right: parent.right

    property var labelInput: ["Yes", "No"] // ["Woman", "Man"] ["1", "2", "3", "4", "5", "6"]
    property int selectedIndex: -1

    spacing: (rowItem.width * 3/4) / (labelInput.length)

    Repeater {
        model: labelInput.length
        CheckBox {
            id: checkboxItem
            width: 20
            height: 20

            Label {
                padding: 2
                anchors.top: checkboxItem.bottom
                text: labelInput[index]
                font.pixelSize: 12
            }

            indicator: Rectangle {
                width: 20
                height: 20
                radius: 5
                color: checked ? "#FFD700" : "transparent"
                border.color: AppSettings.theme.generalBorderColor
                border.width: 2
            }

            onCheckedChanged: {
                if (checked) {
                    selectedIndex = index
                    for (var i = 0; i < labelInput.length; i++) {
                        if (i !== selectedIndex) {
                            rowItem.children[i].checked = false
                        }
                    }
                }
            }
        }
    }
}



