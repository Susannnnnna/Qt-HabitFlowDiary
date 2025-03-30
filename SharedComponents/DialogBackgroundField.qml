import QtQuick 2.15
import QtQuick.Controls.Material
import "../AppSettings"

Rectangle {
    width: parent.width
    height: parent.height

    property color backgroundColor: AppSettings.theme.dialogBackgroundColor
    property color borderColor: AppSettings.theme.generalBorderColor

    radius: 21
    color: backgroundColor
    border.color: borderColor
    border.width: 2
}
