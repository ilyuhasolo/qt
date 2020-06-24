import QtQuick 2.0
import QtQuick.Controls 2.2
import Converter 1.0


Rectangle{
    id: time
    anchors.fill: parent
    color: "#1F1D1E"

    Converter{
        id: convert
    }

    TextField {
        id: ms
        objectName: "ms"
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        height: 30
        width: parent.width/2
        onTextEdited: {
            convert.convertTime("ms", time)
        }

        Text{
            text: "Миллисекунда"
            color: "white"
            anchors.right: parent.left
            anchors.rightMargin: 20
            font.pixelSize: 20
            anchors.top: parent.top
        }
    }

    TextField {
        id: s
        objectName: "s"
        anchors.top: ms.bottom
        anchors.topMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        height: 30
        width: parent.width/2
        onTextEdited: {
            convert.convertTime("s", time)
        }

        Text{
            text: "Секунда"
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
        anchors.top: s.bottom
        anchors.topMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        height: 30
        width: parent.width/2
        onTextEdited: {
            convert.convertTime("m", time)
        }

        Text{
            text: "Минута"
            color: "white"
            anchors.right: parent.left
            anchors.rightMargin: 20
            font.pixelSize: 20
            anchors.top: parent.top
        }
    }

    TextField {
        id: h
        objectName: "h"
        anchors.top: m.bottom
        anchors.topMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        height: 30
        width: parent.width/2
        onTextEdited: {
            convert.convertTime("h", time)
        }

        Text{
            text: "Час"
            color: "white"
            anchors.right: parent.left
            anchors.rightMargin: 20
            font.pixelSize: 20
            anchors.top: parent.top
        }
    }

    TextField {
        id: d
        objectName: "d"
        anchors.top: h.bottom
        anchors.topMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        height: 30
        width: parent.width/2
        onTextEdited: {
            convert.convertTime("d", time)
        }

        Text{
            text: "День"
            color: "white"
            anchors.right: parent.left
            anchors.rightMargin: 20
            font.pixelSize: 20
            anchors.top: parent.top
        }
    }

    TextField {
        id: w
        objectName: "w"
        anchors.top: d.bottom
        anchors.topMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        height: 30
        width: parent.width/2
        onTextEdited: {
            convert.convertTime("w", time)
        }

        Text{
            text: "Неделя"
            color: "white"
            anchors.right: parent.left
            anchors.rightMargin: 20
            font.pixelSize: 20
            anchors.top: parent.top
        }
    }

    TextField {
        id: mn
        objectName: "mn"
        anchors.top: w.bottom
        anchors.topMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        height: 30
        width: parent.width/2
        onTextEdited: {
            convert.convertTime("mn", time)
        }

        Text{
            text: "Месяц"
            color: "white"
            anchors.right: parent.left
            anchors.rightMargin: 20
            font.pixelSize: 20
            anchors.top: parent.top
        }
    }

    TextField {
        id: y
        objectName: "y"
        anchors.top: mn.bottom
        anchors.topMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        height: 30
        width: parent.width/2
        onTextEdited: {
            convert.convertTime("y", time)
        }

        Text{
            text: "Год"
            color: "white"
            anchors.right: parent.left
            anchors.rightMargin: 20
            font.pixelSize: 20
            anchors.top: parent.top
        }
    }
}
