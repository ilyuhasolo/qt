import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.12

Item {
    id: signUpPage
    anchors.fill: parent
    visible: true

    Text {
        id: titleText2
        text: "SIGN UP"
        color: "black"
        font.pixelSize: 26
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
    }

    TextField {
        id: signUpLogin
        width: 250
        font.pixelSize: 16
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: titleText2.bottom
        anchors.topMargin: 10
        placeholderText: "Login"
    }

    TextField {
        id: signUpPassword
        width: 250
        font.pixelSize: 16
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: signUpLogin.bottom
        anchors.topMargin: 10
        placeholderText: "Password"
        echoMode: "Password"
    }

    TextField {
        id: signUpPasswordRepeat
        width: 250
        font.pixelSize: 16
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: signUpPassword.bottom
        anchors.topMargin: 10
        placeholderText: "Repeat password"
        echoMode: "Password"
    }

    TextField {
        id: signUpNickname
        width: 250
        font.pixelSize: 16
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: signUpPasswordRepeat.bottom
        anchors.topMargin: 10
        placeholderText: "Nickname"
    }

    Button {
        id: signUpButton
        width: 100
        height: 40
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: signUpNickname.bottom
        anchors.topMargin: 10
        text: "Sign up"
        enabled: signUpLogin.length > 5 && signUpNickname.length > 5
                 && signUpPassword.length > 5
        onClicked: {
            if (signUpPassword.text != signUpPasswordRepeat.text){
                passwordWarning.visible = true
                loadingIndicator.running = false
            }
            else {
                passwordWarning.visible = false
                loadingIndicator.running = true
            }
        }

    }

    Text {
        id: passwordWarning
        text: "Password values aren't same!"
        font.pixelSize: 16
        visible: false
        anchors.top: signUpButton.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        color: "red"
    }

    BusyIndicator {
        id: loadingIndicator2
        anchors.top: signUpButton.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        running: false
    }
}

