pragma Singleton
import QtQuick

QtObject {
    property string rootPath: Qt.resolvedUrl("../")
    property real listHeight: 50
    property int clearRadiobuttonIndex: -1
}
