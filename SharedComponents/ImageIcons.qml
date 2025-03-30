import QtQuick 2.15
import "../AppSettings"

Image {
    anchors.verticalCenter: parent.verticalCenter

    property string iconPath
    property bool iconVisible: true
    property real widthMultiplier: 1
    property real heightMultiplier: 1

    visible: iconVisible
    source: iconPath
    width: AppSettings.icons.iconWidth * widthMultiplier
    height: AppSettings.icons.iconHeight * heightMultiplier
}
