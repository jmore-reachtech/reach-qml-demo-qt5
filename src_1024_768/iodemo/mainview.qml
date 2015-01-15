import QtQuick 2.0
import "../components"

Rectangle {
    id: root
    width: 1024
    height: 768
    color: "#bbe5fb"
    signal message(string msg)

   Text {
        x: 0
        y: 200
        width: 1024
        text: "I/O Example"
        anchors.horizontalCenterOffset: 0
        horizontalAlignment: Text.AlignHCenter
        font.family: "DejaVu Sans"
        font.pixelSize: 30
        anchors.horizontalCenter: parent.horizontalCenter
    }


    ImageButton {
        id: button1
        x: 363
        y: 269
        width: 113
        height: 70
        text: "Button 1"
        imageUp: "../images/internal_button_up.bmp"
        font.pixelSize: 20
        textColor: "#000000"
        imageDown: "../images/internal_button_dn.bmp"
        font.family: "DejaVu Sans"
        onButtonClick: {
            connection.sendMessage("button_click=1")
        }

    }

    ImageButton {
        id: button2
        x: 363
        y: 371
        width: 113
        height: 70
        text: "Button 2"
        imageUp: "../images/internal_button_up.bmp"
        font.pixelSize: 20
        textColor: "#000000"
        imageDown: "../images/internal_button_dn.bmp"
        font.family: "DejaVu Sans"
        onButtonClick: {
            connection.sendMessage("button_click=2")
        }
    }

	ImageButton {
        id: buttonQuit
        x: 363
        y: 475
        width: 113
        height: 70
        text: "Back"
        imageUp: "../images/internal_button_up.bmp"
        font.pixelSize: 20
        textColor: "#000000"
        imageDown: "../images/internal_button_dn.bmp"
        font.family: "DejaVu Sans"
        onButtonClick: {
            root.message("../src/mainmenu.qml");
        }
    }
	
    Text {
        id: text1
        x: 551
        y: 305
        width: 131
        height: 30
        text: qsTr("Temperature")
        font.family: "DejaVu Sans"
        font.pixelSize: 23
    }

    Text {
        id: text2
        x: 569
        y: 341
        width: 96
        height: 23
        text: qsTr("Celsius: ")
        font.family: "DejaVu Sans"
        font.pixelSize: 20
    }

    TextInput {
        objectName: "celsius_input"
        id: celsius_input
        x: 687
        y: 341
        width: 70
        height: 23
        text: qsTr("?")
        font.family: "DejaVu Sans"
        font.pixelSize: 20
    }

    Text {
        id: text3
        x: 569
        y: 380
        width: 96
        height: 27
        text: qsTr("Fahrenheit: ")
        font.family: "DejaVu Sans"
        font.pixelSize: 20
    }

    TextInput {
        objectName: "fahrenheit_input"
        id: fahrenheit_input
        x: 687
        y: 381
        width: 72
        height: 26
        text: qsTr("?")
        font.family: "DejaVu Sans"
        font.pixelSize: 20
    }


}

