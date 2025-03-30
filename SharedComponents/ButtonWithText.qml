import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material
import "../AppSettings"

Button {
    width: 120

    property string buttonText: "Confirm"
    property color innerColor: AppSettings.theme.buttonInnerColor
    property color borderColor: AppSettings.theme.buttonBorderColor

    background: Rectangle {
        width: parent.width
        height: 40
        radius: 21
        color: innerColor
        border.color: borderColor
        border.width: 1
    }

    text: buttonText
    hoverEnabled: false
    font.pixelSize: AppSettings.theme.fontSize
}
