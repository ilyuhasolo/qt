import QtQuick 2.0
import QtQuick.Controls 2.2
import Converter 1.0


Rectangle{
    id: distance
    anchors.fill: parent
    color: "#1F1D1E"

    Converter{
        id: convert
    }

    TextField {
        id: mm
        objectName: "mm"
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        height: 30
        width: parent.width/2
        onTextEdited: {
            convert.convertDistance("mm", distance)
        }

        Text{
            text: "Миллиметры"
            color: "white"
            anchors.right: parent.left
            anchors.rightMargin: 20
            font.pixelSize: 20
            anchors.top: parent.top
        }
    }

    TextField {
        id: cm
        objectName: "cm"
        anchors.top: mm.bottom
        anchors.topMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        height: 30
        width: parent.width/2
        onTextEdited: {
            convert.convertDistance("cm", distance)
        }

        Text{
            text: "Сантиметры"
            color: "white"
            anchors.right: parent.left
            anchors.rightMargin: 20
            font.pixelSize: 20
            anchors.top: parent.top
        }
    }

    TextField {
        id: dm
        objectName: "dm"
        anchors.top: cm.bottom
        anchors.topMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        height: 30
        width: parent.width/2
        onTextEdited: {
            convert.convertDistance("dm", distance)
        }

        Text{
            text: "Дециметры"
            color: "white"
            anchors.right: parent.left
            anchors.rightMargin: 20
            font.pixelSize: 20
            anchors.top: parent.top
        }
    }

    TextField {
        id: m
        objectName: "m"
        anchors.top: dm.bottom
        anchors.topMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        height: 30
        width: parent.width/2
        onTextEdited: {
            convert.convertDistance("m", distance)
        }

        Text{
            text: "Метры"
            color: "white"
            anchors.right: parent.left
            anchors.rightMargin: 20
            font.pixelSize: 20
            anchors.top: parent.top
        }
    }

    TextField {
        id: km
        objectName: "km"
        anchors.top: m.bottom
        anchors.topMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        height: 30
        width: parent.width/2
        onTextEdited: {
            convert.convertDistance("km", distance)
        }

        Text{
            text: "Километры"
            color: "white"
            anchors.right: parent.left
            anchors.rightMargin: 20
            font.pixelSize: 20
            anchors.top: parent.top
        }
    }
}
