import QtQuick 2.0

Text {
    id: clickableText
    color: "black"
    font.pixelSize: 16
    signal clicked()
    MouseArea {
        anchors.fill: parent
        cursorShape: "PointingHandCursor"
        onClicked: {
            clickableText.clicked()
        }
    }
}
