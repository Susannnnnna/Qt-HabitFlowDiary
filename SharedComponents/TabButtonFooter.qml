import QtQuick 2.15
import QtQuick.Controls.Material
import "../AppSettings"

TabButton {
    id: componentTab

    property string stackViewPath
    property string iconPath
    property string footerElementText

    Item {
        id: footerItem
        anchors.fill: parent

        Image {
            id: image
            anchors.centerIn: parent
            source: iconPath
            width: AppSettings.icons.iconWidth
            height: AppSettings.icons.iconHeight
        }

        Label {
            anchors.top: image.bottom
            anchors.horizontalCenter: image.horizontalCenter
            text: footerElementText
            font.pixelSize: 12
        }
    }

    Rectangle {
        anchors.top: componentTab.top
        width: componentTab.width
        height: 3
        color: AppSettings.theme.generalBorderColor
    }

    onClicked: { stackView.push(stackViewPath) }
}
