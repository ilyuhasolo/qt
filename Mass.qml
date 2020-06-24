import QtQuick 2.0
import QtQuick.Controls 2.2
import Converter 1.0


Rectangle{
    id: mass
    anchors.fill: parent
    color: "#1F1D1E"

    Converter{
        id: convert
    }

    TextField {
        id: mg
        objectName: "mg"
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        height: 30
        width: parent.width/2
        onTextEdited: {
            convert.convertMass("mg", mass)
        }

        Text{
            text: "Миллиграммы"
            color: "white"
            anchors.right: parent.left
            anchors.rightMargin: 20
            font.pixelSize: 20
            anchors.top: parent.top
        }
    }

    TextField {
        id: g
        objectName: "g"
        anchors.top: mg.bottom
        anchors.topMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        height: 30
        width: parent.width/2
        onTextEdited: {
            convert.convertMass("g", mass)
        }

        Text{
            text: "Граммы"
            color: "white"
            anchors.right: parent.left
            anchors.rightMargin: 20
            font.pixelSize: 20
            anchors.top: parent.top
        }
    }

    TextField {
        id: kg
        objectName: "kg"
        anchors.top: g.bottom
        anchors.topMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        height: 30
        width: parent.width/2
        onTextEdited: {
            convert.convertMass("kg", mass)
        }

        Text{
            text: "Килограммы"
            color: "white"
            anchors.right: parent.left
            anchors.rightMargin: 20
            font.pixelSize: 20
            anchors.top: parent.top
        }
    }

    TextField {
        id: t
        objectName: "t"
        anchors.top: kg.bottom
        anchors.topMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        height: 30
        width: parent.width/2
        onTextEdited: {
            convert.convertMass("t", mass)
        }

        Text{
            text: "Тонны"
            color: "white"
            anchors.right: parent.left
            anchors.rightMargin: 20
            font.pixelSize: 20
            anchors.top: parent.top
        }
    }

    TextField {
        id: kt
        objectName: "kt"
        anchors.top: t.bottom
        anchors.topMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        height: 30
        width: parent.width/2
        onTextEdited: {
            convert.convertMass("t", mass)
        }

        Text{
            text: "Килотонны"
            color: "white"
            anchors.right: parent.left
            anchors.rightMargin: 20
            font.pixelSize: 20
            anchors.top: parent.top
        }
    }
}
