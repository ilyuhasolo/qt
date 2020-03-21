import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.12

Window {
    visible: true
    width: 280
    height: 500
    title: qsTr("Authorization")
    flags: "Dialog"

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
            id: loginField
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
            anchors.top: loginField.bottom
            anchors.topMargin: 10
            placeholderText: "Password"
            echoMode: "Password"
        }

        Button {
            id: loginButton
            width: 100
            height: 40
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: passwordField.bottom
            anchors.topMargin: 10
            text: "Sign in"
            enabled: passwordField.length > 5 && loginField.length > 5
            onClicked: {
                loadingIndicator1.running = true
            }
        }

        BusyIndicator {
            id: loadingIndicator1
            anchors.top: loginButton.bottom
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            running: false
        }
    }

    Item {
        id: signUpPage
        anchors.fill: parent
        visible: !signInPage.visible

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

    Row {
        spacing: 10
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.margins: 10
        Text {
            id: bottomSignIn
            text: "Sign in"
            color: "black"
            font.underline: signInPage.visible
            font.pixelSize: 16

            MouseArea {
                id: signinArea
                anchors.fill: parent
                cursorShape: "PointingHandCursor"

                onClicked: {
                    console.log("Sign in is pressed")
                    if (!signInPage.visible){
                        signInPage.visible = true
                        signUpLogin.focus = false
                        signUpLogin.clear()
                        signUpPassword.focus = false
                        signUpPassword.clear()
                        signUpPasswordRepeat.focus = false
                        signUpPasswordRepeat.clear()
                        signUpNickname.focus = false
                        signUpNickname.clear()
                        passwordWarning.visible = false
                        loadingIndicator2.running = false
                    }
                }
            }
        }
        Text {
            id: bottomSlash
            text: "/"
            color: "black"
        }
        Text {
            id: bottomSignUp
            text: "Sign up"
            color: "black"
            font.underline: signUpPage.visible
            font.pixelSize: 16

            MouseArea {
                id: signupArea
                anchors.fill: parent
                cursorShape: "PointingHandCursor"

                onClicked: {
                    if (signInPage.visible){
                        signInPage.visible = false
                        loginField.focus = false
                        loginField.clear()
                        passwordField.focus = false
                        passwordField.clear()
                        loadingIndicator1.running = false
                    }
                }
            }
        }
    }
}
