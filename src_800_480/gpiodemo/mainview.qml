import QtQuick 2.0
import "../components"
import com.reachtech.systemplugin 1.0

Rectangle {
    id: root
    objectName: "root"
    width: 800
    height: 480
    color: "#666666"

    signal message(string msg)

    Text {
        id: txtTitle
        x: 0
        y: 44
        width: 800
        height: 29
        text: qsTr("GPIO Plugin Demo")
        horizontalAlignment: Text.AlignHCenter
        font.bold: false
        font.pixelSize: 24
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Switch{
        id: switch_pin0
        x: 246
        y: 304
        width: 130
        height: 37
        textOffBold: true
        textOnBold: true
        textOff: "Pin 4 Low"
        textOn: "Pin 4 High"
        imageOff: "../images/internal_button_up.bmp"
        imageOn: "../images/internal_button_dn.bmp"
        on: false;

        onOnChanged: {
            if (on)
                pin0.writeToPin(1);
            else
                pin0.writeToPin(0);
        }
    }

    Switch {
        id: switch_pin1
        x: 251
        y: 243
        width: 130
        height: 37
        textOff: "Pin 3 Low"
        textOn: "Pin 3 High"
        imageOn: "../images/internal_button_dn.bmp"
        imageOff: "../images/internal_button_up.bmp"
        textOffBold: true
        textOnBold: true;
        on: false

        onOnChanged: {
            if (on)
                pin1.writeToPin(1);
            else
                pin1.writeToPin(0);
        }
    }

    Switch{
        id: switch_pin2
        x: 246
        y: 175
        width: 130
        height: 37
        textOffBold: true
        textOnBold: true
        textOff: "Pin 2 LOW"
        textOn: "Pin 2 High"
        imageOff: "../images/internal_button_up.bmp"
        imageOn: "../images/internal_button_dn.bmp"
        on: false;

        onOnChanged: {
            if (on)
                pin2.writeToPin(1);
            else
                pin2.writeToPin(0);
        }
    }

    Switch{
        id: switch_pin3
        x: 246
        y: 110
        width: 130
        height: 37
        textOffBold: true
        textOnBold: true
        textOff: "Pin 1 LOW"
        textOn: "Pin 1 High"
        imageOff: "../images/internal_button_up.bmp"
        imageOn: "../images/internal_button_dn.bmp"
        on: false;

        onOnChanged: {
            if (on)
                pin3.writeToPin(1);
            else
                pin3.writeToPin(0);
        }
    }

    ImageButton {
        id: quitButton
        x: 246
        y: 379
        width: 48
        height: 48
        text: ""
        imageDown: "../images/quit_down.png"
        imageUp: "../images/quit_up.png"
        onButtonClick: root.message("../src/mainmenu.qml");
    }

    GPIOPinOutput{
        id: pin0
        pin: 0
    }

    GPIOPinOutput{
        id: pin1
        pin: 1
    }

    GPIOPinOutput{
        id: pin2
        pin: 2
    }

    GPIOPinOutput{
        id: pin3
        pin: 3
    }

    GPIOPinInput{
        id: pin4
        pollPin: true
        pin: 4
        onStateChanged:{
            if (state == 1)
                txtGPIO4.text = "Pin 5 High";
            else
                txtGPIO4.text = "Pin 5 Low";
        }
    }

    GPIOPinInput{
        id: pin5
        pollPin: true
        pin: 5
        onStateChanged:{
            if (state == 1)
                txtGPIO5.text = "Pin 6 High";
            else
                txtGPIO5.text = "Pin 6 Low";
        }
    }

    GPIOPinInput{
        id: pin6
        pollPin: true
        pin: 6
        onStateChanged:{
            if (state == 1)
                txtGPIO6.text = "Pin 7 High";
            else
                txtGPIO6.text = "Pin 7 Low";
        }
    }

    GPIOPinInput{
        id: pin7
        pollPin: true
        pin: 7
        onStateChanged:{
            if (state == 1)
                txtGPIO7.text = "Pin 8 High";
            else
                txtGPIO7.text = "Pin 8 Low";
        }
    }

    Text {
        id: txtGPIO4
        x: 424
        y: 116
        width: 96
        height: 25
        text: qsTr("Pin 5 LOW")
        font.pixelSize: 18
    }

    Text {
        id: txtGPIO5
        x: 424
        y: 181
        width: 96
        height: 25
        text: qsTr("Pin 6 LOW")
        font.pixelSize: 18
    }

    Text {
        id: txtGPIO6
        x: 424
        y: 249
        width: 96
        height: 25
        text: qsTr("Pin 7 LOW")
        font.pixelSize: 18
    }

    Text {
        id: txtGPIO7
        x: 424
        y: 310
        width: 96
        height: 25
        text: qsTr("Pin 8 LOW")
        font.pixelSize: 18
    }



    Component.onCompleted: {
		switch_pin0.on = false;            
        switch_pin1.on = false;            
        switch_pin2.on = false;            
        switch_pin3.on = false;   
    }
}
