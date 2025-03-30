import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material
import "../AppSettings"

Label {
    width: parent.width

    property string labelText
    property bool textBold: false
    property real textSize: AppSettings.theme.fontSize
    property color textColor: AppSettings.theme.fontColor

    horizontalAlignment: Text.AlignLeft
    text: labelText
    font.pixelSize: textSize
    font.bold: textBold
    color: textColor
}
