import QtQuick 2.0
import "../components"
import com.reachtech.systemplugin 1.0

Rectangle {
    id: root
    objectName: "root"
    width: 800
    height: 480

    gradient: Gradient {
        GradientStop {
            position: 0.16
            color: "#ffffff"
        }

        GradientStop {
            position: 1
            color: "#000000"
        }
    }

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
        id: switch_pin2
        x: 209
        y: 146
        width: 130
        height: 37
        textOffBold: true
        textOnBold: true
        textOff: "GP0 Led Off"
        textOn: "GP0 Led On"
        imageOff: "../images/internal_button_up.bmp"
        imageOn: "../images/internal_button_dn.bmp"
        on: false;

        onOnChanged: {
            if (on)
                pin0.writeToPin(0);
            else
                pin0.writeToPin(1);
        }
    }

    Switch {
        id: switch_pin1
        x: 209
        y: 211
        width: 130
        height: 37
        textOff: "GP1 Led Off"
        textOn: "GP1 Led On"
        imageOn: "../images/internal_button_dn.bmp"
        imageOff: "../images/internal_button_up.bmp"
        textOffBold: true
        textOnBold: true;
        on: false

        onOnChanged: {
            if (on)
                pin1.writeToPin(0);
            else
                pin1.writeToPin(1);
        }
    }

    Switch{
        id: switch_pins
        x: 209
        y: 279
        width: 130
        height: 37
        textOffBold: true
        textOnBold: true
        textOff: "GP0 GP1 Led Off"
        textOn: "GP0 GP1 Led On"
        imageOff: "../images/internal_button_up.bmp"
        imageOn: "../images/internal_button_dn.bmp"
        on: false;

        onOnChanged: {
            if (on)
            {
                switch_pin1.on = false;
                switch_pin2.on = false;
                pinsOutput.writeToPins(0x0c);
            }
            else
            {
                pinsOutput.writeToPins(0x0f);
            }
        }
    }

    LEDLight{
        id: led_gp2
        x: 424
        y: 134
        width: 60
        height: 60
        label: "GP2 Switch Pressed"
        font.bold: true
        textColor: "#ffffff"
        imageOff: "../images/switchgroupuprnd.png"
        imageOn: "../images/switchgroupdownrnd.png"
    }

    LEDLight {
        id: led_gp3
        x: 424
        y: 244
        width: 60
        height: 60
        label: "GP3 Switch Pressed"
        font.bold: true
        textColor: "#ffffff"
        imageOff: "../images/switchgroupuprnd.png"
        imageOn: "../images/switchgroupdownrnd.png"
    }

    ImageButton {
        id: quitButton
        x: 577
        y: 282
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

    GPIOPinInput{
            id: pin2
            pin: 2
			pollPin: true

            onStateChanged:{
                if (state == 0)
                    led_gp2.on = true;
                else
                    led_gp2.on = false;
            }
    }

    GPIOPinInput{
            id: pin3
            pin: 3
            pollPin: true
			
            onStateChanged:{
                if (state == 0)
                    led_gp3.on = true;
                else
                    led_gp3.on = false;
            }
    }

    GPIOPinsOutput{
        id: pinsOutput
    }

    ImageButton{
            id:nextButton
            x: 577
            y: 216
            width: 48
            height: 48
            text: ""

            imageDown: "images/next_down.png"
            imageUp: "images/next_up.png"


            onButtonClick: {
                root.message("gpiodemo/inputpins.qml");
            }
    }

    Component.onCompleted: {
        pinsOutput.writeToPins(0x0f);
    }
}
