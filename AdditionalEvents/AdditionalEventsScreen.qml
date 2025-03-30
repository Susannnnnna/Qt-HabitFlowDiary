import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../AppSettings"
import "../SharedComponents"

Page {
    anchors.fill: parent

    property string additionalEventDateTitle: "Additional event date *"
    property string descriptionTitle: "Description *"

    background: Rectangle { color: AppSettings.theme.backgroundColor }

    ListView {
        anchors.fill: parent
        model: additionalEventsModel
            delegate: SwipeDelegate {
                width: parent.width
                height: AppSettings.uiSettings.listHeight

                Rectangle {
                    width: parent.width
                    height: parent.height
                    color: AppSettings.theme.backgroundColor

                    Text {
                        anchors.top: parent.top
                        anchors.topMargin: 5
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        text: model.additional_event_date ? (model.additional_event_date) : "N/A"
                        color: AppSettings.theme.fontColor
                        font.pixelSize: AppSettings.theme.fontSize * (3/4)
                    }

                    Text {
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 5
                        text: model.additional_event ? model.additional_event : "N/A"
                        color: AppSettings.theme.fontColor
                        font.pixelSize: AppSettings.theme.fontSize
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            editAdditionalEventsData.idRecordToEdit = model.id
                            editAdditionalEventsData.firstFieldInnerText = model.additional_event_date
                            editAdditionalEventsData.secondFieldInnerText = model.additional_event
                            editAdditionalEventsData.open()
                        }
                    }
                }

                Rectangle {
                    width: AppSettings.icons.iconWidth * 2
                    height: parent.height
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    color: AppSettings.theme.backgroundColor

                    ImageIcons {
                        anchors.centerIn: parent
                        iconPath: AppSettings.icons.deleteIcon
                        widthMultiplier: (1/3)
                        heightMultiplier: (1/3)
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            additionalEventsModel.removeAdditionalEvent(model.id)
                        }
                    }
                }

            BottomLineSeparator { widthMultiplier: 0.98 }
        }
    }

    ButtonWithIcon {
        openDialog: addAdditionalEventsData
    }

    AdditionalEventsInputDialog {
        id: addAdditionalEventsData
        firstFieldLabel: additionalEventDateTitle
        firstFieldInnerText: Qt.formatDate(new Date(), "yyyy-MM-dd")
        secondFieldLabel: descriptionTitle
        onConfirmAction: function (additional_event_date, additional_event) {
            additionalEventsModel.addAdditionalEvent("userIdTest", additional_event_date, additional_event);
            addAdditionalEventsData.close();
        }
    }

    AdditionalEventsInputDialog {
        id: editAdditionalEventsData
        firstFieldLabel: additionalEventDateTitle
        secondFieldLabel: descriptionTitle
        onConfirmAction: function (id, additional_event_date, additional_event) {
            additionalEventsModel.updateAdditionalEvent(id, additional_event_date, additional_event);
            editAdditionalEventsData.close();
        }
    }
}
