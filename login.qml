import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.12
import QtQuick.Dialogs 1.2
import AuthManager 1.0

Item {
    id: signInPage
    anchors.fill: parent
    visible: true

    MessageDialog{
        id: authMes
        title: "WARNING"
        text: "something"
        visible: false
        onAccepted: {
            authMes.close()
        }
    }

    AuthManager{
        id: authManager
        onAuthentificateRequestCompleted: {
            authMes.text = errorText + "\n" + token
            authMes.open()
        }
        onProcessingChanged: {
            console.log(isProcessing_l)
        }
    }

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
        echoMode: TextInput.Password
    }

    Button {
            id: loginButton
            width: 100
            height: 40
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: passwordField.bottom
            anchors.topMargin: 30
            text: "Sign in"
            enabled: passwordField.length > 5 && signInLogin.length > 5
            onClicked: {
                loadingIndicator2.running = true
                authManager.authentificate(signInLogin.text, passwordField.text)
            }
        }

    BusyIndicator {
        id: loadingIndicator2
        anchors.top: loginButton.bottom
        anchors.topMargin: 40
        anchors.horizontalCenter: parent.horizontalCenter
        running: authManager.isProcessing_l
    }
}
