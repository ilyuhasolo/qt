import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.12

Item {
    id: signInPage
    anchors.fill: parent
    visible: true

    Text {
        id: titleText1
        text: "SIGN IN"
        color: "black"
        font.pixelSize: 26
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
    }

    TextField {
        id: signInLogin
        width: 250
        font.pixelSize: 16
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: titleText1.bottom
        anchors.topMargin: 10
        placeholderText: "Login"
    }

    TextField {
        id: passwordField
        width: 250
        font.pixelSize: 16
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: signInLogin.bottom
        anchors.topMargin: 20
        placeholderText: "Password"
        echoMode: "Password"
    }

    Button {
            id: loginButton
            width: 100
            height: 40
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: passwordField.bottom
            anchors.topMargin: 30
            text: "Sign in"
            enabled: passwordField.length > 5 && loginField.length > 5
            onClicked: {
                loadingIndicator1.running = true
            }
        }

    BusyIndicator {
        id: loadingIndicator2
        anchors.top: loginButton.bottom
        anchors.topMargin: 40
        anchors.horizontalCenter: parent.horizontalCenter
        running: false
    }
}
