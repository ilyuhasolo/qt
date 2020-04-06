import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.12

Window {
    visible: true
    width: 280
    height: 500
    title: qsTr("Authorization")
    flags: "Dialog"
    property int check : 0

    Loader{
        id: sign
        anchors.fill: parent
        source: (check == 0) ? "login.qml"
                             : "signup.qml"
    }



    Row {
        spacing: 10
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.margins: 10

        ClickableText {
            id: signIn
            text: "Sign In"
            font.underline : check == 0
            onClicked: {
                check = 0
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
            font.underline: check == 1
            onClicked: {
                check = 1
            }
        }
    }
}