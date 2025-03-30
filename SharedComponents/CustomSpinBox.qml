import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material
import "../AppSettings"

SpinBox {
    width: parent.width

    property real inputValue
    property int toValue: 3000
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

    value: inputValue
    from: 0
    to: toValue
    editable: true
    font.pixelSize: AppSettings.theme.fontSize
}
