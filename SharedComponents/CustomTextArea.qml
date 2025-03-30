import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material
import "../AppSettings"

TextArea {
    id: textAreaItem
    width: parent.width
    height: 100
    topPadding: 5 // tekst starts in text area
    horizontalAlignment: Text.AlignLeft
    verticalAlignment: Text.AlignLeft

    property string innerText
    property color backgroundColor: AppSettings.theme.backgroundColor
    property color borderColor: AppSettings.theme.generalBorderColor

    background: Rectangle {
        width: textAreaItem.width
        height: textAreaItem.height
        radius: 21
        color: backgroundColor
        border.color: borderColor
        border.width: 1
    }

    text: innerText
    font.pixelSize: AppSettings.theme.fontSize
    wrapMode: Text.Wrap
}
