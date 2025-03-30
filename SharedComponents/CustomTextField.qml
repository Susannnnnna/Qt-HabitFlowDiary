import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material
import "../AppSettings"

TextField {
    width: parent.width
    height: 40

    property string innerText
    property string placeholderInnerText
    property int maxTextLength: 40
    property color backgroundColor: AppSettings.theme.backgroundColor
    property color borderColor: AppSettings.theme.generalBorderColor

    background: Rectangle {
        width: parent.width
        height: parent.height
        radius: 21
        color: backgroundColor
        border.color: borderColor
        border.width: 1
    }

    text: innerText
    horizontalAlignment: Text.AlignLeft
    verticalAlignment: Text.AlignLeft
    placeholderText: placeholderInnerText
    font.pixelSize: AppSettings.theme.fontSize
    maximumLength: maxTextLength
}
