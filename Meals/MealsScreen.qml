import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../AppSettings"
import "../SharedComponents"

Page {
    //anchors.fill: parent

    property string mealDateTitle: "Meal date *"
    property string mealTitle: "Meal description *"
    property string mealCalTitle: "Calories"

    background: Rectangle { color: AppSettings.theme.backgroundColor }

    ListView {
        anchors.fill: parent
        model: mealsModel
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
                        text: model.meal_date ? (model.meal_date + ", Calories: " + model.meal_cal) : "N/A"
                        color: AppSettings.theme.fontColor
                        font.pixelSize: AppSettings.theme.fontSize * (3/4)
                    }

                    Text {
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 5
                        text: model.meal ? model.meal : "N/A"
                        color: AppSettings.theme.fontColor
                        font.pixelSize: AppSettings.theme.fontSize
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            editMealsData.idRecordToEdit = model.id
                            editMealsData.firstFieldInnerText = model.meal_date
                            editMealsData.secondFieldInnerText = model.meal_cal
                            editMealsData.thirdFieldInnerText = model.meal
                            editMealsData.open()
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
                            mealsModel.removeMeal(model.id)
                        }
                    }
                }

            BottomLineSeparator { widthMultiplier: 0.98 }
        }
    }

    ButtonWithIcon {
        openDialog: addMealsData
    }

    MealsInputDialog {
        id: addMealsData
        firstFieldLabel: mealDateTitle
        firstFieldInnerText: Qt.formatDate(new Date(), "yyyy-MM-dd") + " " + Qt.formatTime(new Date(), "HH:mm")
        secondFieldLabel: mealCalTitle
        secondFieldInnerText: 500
        thirdFieldLabel: mealTitle
        onConfirmAction: function (meal_date, meal_cal, meal) {
            mealsModel.addMeal("userIdTest", meal_date, meal_cal, meal);
            addMealsData.close();
        }
    }

    MealsInputDialog {
        id: editMealsData
        firstFieldLabel: mealDateTitle
        secondFieldLabel: mealCalTitle
        thirdFieldLabel: mealTitle
        onConfirmAction: function (id, meal_date, meal_cal, meal) {
            mealsModel.updateMeal(id, meal_date, meal_cal, meal);
            editMealsData.close();
        }
    }
}
