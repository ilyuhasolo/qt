import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Dialogs 1.2
import QtQuick.Controls 2.2
import Calculator 1.0

Window {
    id: window
    objectName: "window"
    visible: true
    width: 640
    height: 480
    title: qsTr("Calculator")
    color: "#1F1D1E"

    Rectangle{
        id: converter
        anchors.left: resultArea.right
        anchors.right: parent.right
        anchors.leftMargin: 10
        anchors.bottom: parent.bottom
        anchors.top: parent.top
        color: "#1F1D1E"
        ComboBox{
            id: type
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.right: parent.right
            model: ListModel{
                ListElement{
                    text: "Расстояние"
                }
                ListElement{
                    text: "Время"
                }
                ListElement{
                    text: "Энергия"
                }
                ListElement{
                    text: "Масса"
                }
            }
        }
        Loader{
            id: typeSet
            anchors.top: type.bottom
            anchors.topMargin: 10
            anchors.left: type.left
            anchors.bottom: converter.bottom
            width: parent.width
            source: if(type.currentText == "Расстояние") "Distance.qml"
            else if(type.currentText == "Время") "Time.qml"
            else if(type.currentText == "Масса") "Mass.qml"
            else if(type.currentText == "Энергия") "Energy.qml"
        }
    }

    Rectangle{
        id: resultArea
        anchors.left: parent.left
        anchors.top: parent.top
        width: 320
        height: parent.height * 3 / 8 - 10
        border.width: 1
        color: "gray"
        Text {
            id: resultText
            objectName: "display"
            anchors.leftMargin: buttons.implicitMargin
            anchors.rightMargin: 10
            anchors.fill: parent
            horizontalAlignment: Text.AlignRight
            verticalAlignment: Text.AlignVCenter
            text: "0"
            color: "white"
            font.pixelSize: window.height * 3 / 32
            font.family: "Open Sans Regular"
            fontSizeMode: Text.Fit
        }
        Text{
            id: operationText
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 3
            width: parent.width/5
            height: parent.height/5
            color: "white"
            font.pixelSize: window.height * 3 / 32
            font.family: "Open Sans Regular"
            fontSizeMode: Text.Fit
        }
    }
        
    Item {
        id: buttons
        objectName: "item"
        anchors.top: resultArea.bottom
        anchors.left: parent.left
        anchors.leftMargin: 20
        width: resultArea.width
        anchors.bottom: parent.bottom
        Column {
            id: box; spacing: 8
            objectName: "column1"
            anchors { fill: parent; topMargin: 6; bottomMargin: 6; leftMargin: 6; rightMargin: 6 }

            Column {
                id: column; spacing: 6
                objectName: "column2"
                property real h: 50

                Row {
                    spacing: 6
                    CustomButton { text: "AC"; objectName: "ac"; width: 106; height: column.h; color: pressed ? "#b30600" : "#f10800" }
                }

                Grid {
                    id: grid; rows: 5; columns: 5; spacing: 6
                    objectName: "grid"
                    property real w: 50

                    CustomButton {id:button7; text: "7"; objectName: "button_7"; width: grid.w; height: column.h; color: pressed ? "#d6d6d6" : "#eeeeee" }
                    CustomButton {text: "8"; objectName: "button_8"; width: grid.w; height: column.h; color: pressed ? "#d6d6d6" : "#eeeeee" }
                    CustomButton {text: "9"; objectName: "button_9"; width: grid.w; height: column.h; color: pressed ? "#d6d6d6" : "#eeeeee" }
                    CustomButton {text: "÷"; objectName: "divide";width: grid.w; height: column.h; color: pressed ? "#333333" : "gray"}
                    CustomButton {text: "√"; objectName: "sqrt"; width: grid.w; height: column.h; color: pressed ? "#333333" : "gray"}
                    CustomButton {text: "4"; objectName: "button_4"; width: grid.w; height: column.h; color: pressed ? "#d6d6d6" : "#eeeeee" }
                    CustomButton {text: "5"; objectName: "button_5"; width: grid.w; height: column.h; color: pressed ? "#d6d6d6" : "#eeeeee" }
                    CustomButton {text: "6"; objectName: "button_6"; width: grid.w; height: column.h; color: pressed ? "#d6d6d6" : "#eeeeee" }
                    CustomButton {text: "*"; objectName: "mult"; width: grid.w; height: column.h; color: pressed ? "#333333" : "gray"}
                    CustomButton {text: "x^2"; objectName: "sqr"; width: grid.w; height: column.h; color: pressed ? "#333333" : "gray"}
                    CustomButton {text: "1"; objectName: "button_1"; width: grid.w; height: column.h; color: pressed ? "#d6d6d6" : "#eeeeee" }
                    CustomButton {text: "2"; objectName: "button_2"; width: grid.w; height: column.h; color: pressed ? "#d6d6d6" : "#eeeeee" }
                    CustomButton {text: "3"; objectName: "button_3"; width: grid.w; height: column.h; color: pressed ? "#d6d6d6" : "#eeeeee" }
                    CustomButton {text: "-"; objectName: "minus";width: grid.w; height: column.h; color: pressed ? "#333333" : "gray"}
                    CustomButton {text: "1/x"; objectName: "1/x";width: grid.w; height: column.h; color: pressed ? "#333333" : "gray"}
                    CustomButton {text: "0"; objectName: "button_0"; width: grid.w; height: column.h; color: pressed ? "#d6d6d6" : "#eeeeee" }
                    CustomButton {text: "."; objectName: "dot";width: grid.w; height: column.h; color: pressed ? "#d6d6d6" : "#eeeeee"}
                    CustomButton {text: "+/-"; objectName: "plusminus"; width: grid.w; height: column.h; color: pressed ? "#333333" : "gray"}
                    CustomButton {text: "+"; objectName: "plus";width: grid.w; height: column.h; color: pressed ? "#333333" : "gray"}
                    CustomButton {text: "="; objectName: "equal";width: grid.w; height: column.h; color: pressed ? "#333333" : "gray" }
                }
            }
        }
    }
}
