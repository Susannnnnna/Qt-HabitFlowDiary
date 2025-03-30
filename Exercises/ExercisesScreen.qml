import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../AppSettings"
import "../SharedComponents"

Page {
    id: pageItem
    anchors.fill: parent

    property string exerciseDateTitle: "Exercise date *"
    property string exerciseDurationTitle: "Duration [min] *"
    property string exerciseTitle: "Exercise description *"
    // property string thisFileName: "[" + (this ? this : "Unknown file") + "] "

    background: Rectangle {
        color: AppSettings.theme.backgroundColor
    }

    ListView {
        anchors.fill: parent
        model: exercisesModel
            delegate: SwipeDelegate {
                width: pageItem.width
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
                        text: model.exercise_date ? (model.exercise_date + ", duration: " + model.duration + " min.") : "N/A"
                        color: AppSettings.theme.fontColor
                        font.pixelSize: AppSettings.theme.fontSize * (3/4)
                    }

                    Text {
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 5
                        text: model.exercise ? model.exercise : "N/A"
                        color: AppSettings.theme.fontColor
                        font.pixelSize: AppSettings.theme.fontSize
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            editExercisesData.idRecordToEdit = model.id
                            editExercisesData.firstFieldInnerText = model.exercise_date
                            editExercisesData.secondFieldInnerText = model.duration
                            editExercisesData.thirdFieldInnerText = model.exercise
                            editExercisesData.open()
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
                            exercisesModel.removeExercise(model.id)
                        }
                    }
                }

            BottomLineSeparator { widthMultiplier: 0.98 }
        }
    }

    ButtonWithIcon {
        openDialog: addExercisesData
    }

    ExercisesInputDialog {
        id: addExercisesData
        firstFieldLabel: exerciseDateTitle
        firstFieldInnerText: Qt.formatDate(new Date(), "yyyy-MM-dd") + " " + Qt.formatTime(new Date(), "HH:mm")
        secondFieldLabel: exerciseDurationTitle
        secondFieldInnerText: 60
        thirdFieldLabel: exerciseTitle
        onConfirmAction: function (exercise_date, duration, exercise) {
            exercisesModel.addExercise("userIdTest", exercise_date, duration, exercise);
            addExercisesData.close();
        }
    }

    ExercisesInputDialog {
        id: editExercisesData
        firstFieldLabel: exerciseDateTitle
        secondFieldLabel: exerciseDurationTitle
        thirdFieldLabel: exerciseTitle
        onConfirmAction: function (id, exercise_date, duration, exercise) {
            exercisesModel.updateExercise(id, exercise_date, duration, exercise);
            editExercisesData.close();
        }
    }
}
