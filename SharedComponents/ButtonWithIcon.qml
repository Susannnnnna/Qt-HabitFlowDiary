import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material
import "../AppSettings"

Button {
    anchors.right: parent.right
    anchors.bottom: parent.bottom
    anchors.rightMargin: 40
    anchors.bottomMargin: 40

    property var openDialog
    property string iconPath: AppSettings.icons.addIcon

    background: Rectangle {
        color: "transparent"
    }

    Image {
        anchors.centerIn: parent
        source: iconPath
        width: AppSettings.icons.iconWidth
        height: AppSettings.icons.iconHeight
    }

    onClicked: openDialog.open()
}
