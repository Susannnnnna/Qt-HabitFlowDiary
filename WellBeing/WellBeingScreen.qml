import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../AppSettings"
import "../SharedComponents"

Page {
    id: pageItem
    anchors.fill: parent

    property string wellBeingDateTitle: "Date *"
    property string sleepTimeTitle: "Sleep time [h] *"
    property string periodTitle: "Period *" // TODO add checking sex
    property string wellBeingTitle: "Wellbeing * (0 - very bad, 5 - excellent)"
    property string skinConditionTitle: "Skin condition * (0 - very bad, 5 - excellent)"
    property string distractionTitle: "Distraction * (0 - focused, 5 - distracted)"
    property var yesNoList: ["Yes", "No"]
    property var scaleList: ["0", "1", "2", "3", "4", "5"]

    background: Rectangle { color: AppSettings.theme.backgroundColor }

    ListView {
        anchors.fill: parent
        model: wellbeingsModel
            delegate: SwipeDelegate {
            width: pageItem.width
            height: AppSettings.uiSettings.listHeight

            Rectangle {
                width: parent.width
                height: parent.height
                color: model.wellbeing_level_color //AppSettings.theme.backgroundColor

                Text {
                    anchors.top: parent.top
                    anchors.topMargin: 5
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    text: model.wellbeing_date ? model.wellbeing_date : "N/A"
                    color: AppSettings.theme.fontColor
                    font.pixelSize: AppSettings.theme.fontSize * (3/4)
                }

                Text {
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 5
                    text: model.wellbeing_level_description ? model.wellbeing_level_description : "N/A"
                    color: AppSettings.theme.fontColor
                    font.pixelSize: AppSettings.theme.fontSize
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        editWellBeingData.idRecordToEdit = model.id
                        editWellBeingData.firstFieldInnerText = model.wellbeing_date
                        editWellBeingData.secondFieldInnerText = model.sleep_time
                        editWellBeingData.thirdFieldInnerText = model.period
                        editWellBeingData.fourthFieldInnerText = model.wellbeing
                        editWellBeingData.fifthFieldInnerText = model.skin_condition
                        editWellBeingData.sixthFieldInnerText = model.distraction
                        editWellBeingData.open()
                    }
                }
            }

            Rectangle {
                width: AppSettings.icons.iconWidth * 2
                height: parent.height
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                color: model.wellbeing_level_color //AppSettings.theme.backgroundColor

                ImageIcons {
                    anchors.centerIn: parent
                    iconPath: AppSettings.icons.deleteIcon
                    widthMultiplier: (1/3)
                    heightMultiplier: (1/3)
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        wellbeingsModel.removeWellbeing(model.id)
                    }
                }
            }
            BottomLineSeparator {
                bottomColor: AppSettings.theme.buttonBorderColor
            }
        }
    }

    ButtonWithIcon {
        openDialog: {
            addWellBeingData.firstFieldInnerText = Qt.formatDate(new Date(), "yyyy-MM-dd")
            addWellBeingData.secondFieldInnerText = 8
            addWellBeingData.thirdFieldInnerText = AppSettings.uiSettings.clearRadiobuttonIndex
            addWellBeingData.fourthFieldInnerText = AppSettings.uiSettings.clearRadiobuttonIndex
            addWellBeingData.fifthFieldInnerText = AppSettings.uiSettings.clearRadiobuttonIndex
            addWellBeingData.sixthFieldInnerText = AppSettings.uiSettings.clearRadiobuttonIndex
            addWellBeingData
        }

    }

    WellBeingInputDialog {
        id: addWellBeingData
        checkboxThirdLabelInput: yesNoList
        checkboxMultiLabelsInput: scaleList

        firstFieldLabel: wellBeingDateTitle
        secondFieldLabel: sleepTimeTitle
        thirdFieldLabel: periodTitle
        fourthFieldLabel: wellBeingTitle
        fifthFieldLabel: skinConditionTitle
        sixthFieldLabel: distractionTitle

        onConfirmAction: function (wellbeing_date, sleep_time, period, wellbeing, skin_condition, distraction) {
            //console.log("Wellbeing date: ", wellbeing_date, " Sleep time: ", sleep_time,"Period: ", period, ", Wellbeing: ", wellbeing, ", Skin condition: ", skin_condition, ", Distraction: ", distraction)
            wellbeingsModel.addWellbeing("userIdTest", wellbeing_date, sleep_time, period, wellbeing, skin_condition, distraction);
            addWellBeingData.close();
        }
    }

    WellBeingInputDialog {
        id: editWellBeingData
        checkboxThirdLabelInput: yesNoList
        checkboxMultiLabelsInput: scaleList

        firstFieldLabel: wellBeingDateTitle
        secondFieldLabel: sleepTimeTitle

        thirdFieldLabel: periodTitle
        fourthFieldLabel: wellBeingTitle
        fifthFieldLabel: skinConditionTitle
        sixthFieldLabel: distractionTitle

        onConfirmAction: function (id, wellbeing_date, sleep_time, period, wellbeing, skin_condition, distraction) {
            wellbeingsModel.updateWellbeing(id, wellbeing_date, sleep_time, period, wellbeing, skin_condition, distraction);
            editWellBeingData.close();
        }
    }
}
