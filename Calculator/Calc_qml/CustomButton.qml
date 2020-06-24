import QtQuick 2.0
import Calculator 1.0

Rectangle {
    id: button
    signal clicked(QtObject display)
    signal equal(QtObject window, QtObject display)
    property alias text: text.text
    property real textHeight: height - 2
    property real fontHeight: 0.3
    property bool pressed: mouse.pressed
    property bool check: false
    property real implicitMargin: (width - text.implicitWidth) / 2

    Text {
        id: text
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        height: parent.textHeight
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: height * fontHeight
        color: "#1b1c1d"
        font.family: "Open Sans Regular"
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        onClicked:
            if(button.objectName == "equal"){
                button.equal(window, resultText)
                operationText.text = ""
            }
            else {
                if(button.objectName == "plus" || button.objectName == "minus" || button.objectName == "mult" || button.objectName == "divide")
                    operationText.text = button.text
                button.clicked(resultText)
            }
    }
}
