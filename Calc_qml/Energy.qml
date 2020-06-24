import QtQuick 2.0
import QtQuick.Controls 2.2
import Converter 1.0


Rectangle{
    id: energy
    anchors.fill: parent
    color: "#1F1D1E"

    Converter{
        id: convert
    }

    TextField {
        id: j
        objectName: "j"
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        height: 30
        width: parent.width/2
        onTextEdited: {
            convert.convertEnergy("j", energy)
        }

        Text{
            text: "Джоуль"
            color: "white"
            anchors.right: parent.left
            anchors.rightMargin: 20
            font.pixelSize: 20
            anchors.top: parent.top
        }
    }

    TextField {
        id: kj
        objectName: "kj"
        anchors.top: j.bottom
        anchors.topMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        height: 30
        width: parent.width/2
        onTextEdited: {
            convert.convertEnergy("kj", energy)
        }

        Text{
            text: "Килоджоуль"
            color: "white"
            anchors.right: parent.left
            anchors.rightMargin: 20
            font.pixelSize: 20
            anchors.top: parent.top
        }
    }

    TextField {
        id: mj
        objectName: "mj"
        anchors.top: kj.bottom
        anchors.topMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        height: 30
        width: parent.width/2
        onTextEdited: {
            convert.convertEnergy("mj", energy)
        }

        Text{
            text: "Мегаджоуль"
            color: "white"
            anchors.right: parent.left
            anchors.rightMargin: 20
            font.pixelSize: 20
            anchors.top: parent.top
        }
    }

    TextField {
        id: gj
        objectName: "gj"
        anchors.top: mj.bottom
        anchors.topMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        height: 30
        width: parent.width/2
        onTextEdited: {
            convert.convertEnergy("gj", energy)
        }

        Text{
            text: "Гигаджоуль"
            color: "white"
            anchors.right: parent.left
            anchors.rightMargin: 20
            font.pixelSize: 20
            anchors.top: parent.top
        }
    }
}
