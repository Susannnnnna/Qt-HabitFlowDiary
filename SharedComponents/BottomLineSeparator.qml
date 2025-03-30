import QtQuick 2.15
import "../AppSettings"

Rectangle {
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.bottom: parent.bottom

    property real heightMultiplier: 1
    property real widthMultiplier: 1
    property color bottomColor: AppSettings.theme.generalBorderColor

    width: parent.width * widthMultiplier
    height: 1 * heightMultiplier

    color: bottomColor
}
