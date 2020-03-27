import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.12

Window {
    visible: true
    width: 280
    height: 500
    title: qsTr("Authorization")
    flags: "Dialog"

    Loader{
        id: sign
        anchors.fill: parent
        source: "login.qml"
    }



    Row {
        spacing: 10
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.margins: 10

        ClickableText {
            id: signIn
            text: "Sign In"
            onClicked: {
                sign.source = "login.qml"
            }
        }

        Text {
            id: bottomSlash
            text: "/"
            color: "black"
        }
        ClickableText {
            id: signUp
            text: "Sign Up"
            onClicked: {
                sign.source = "signup.qml"
            }
        }
    }
}
