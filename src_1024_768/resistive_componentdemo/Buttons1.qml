import QtQuick 2.0
import "../components"

Rectangle {
    id: button1
    objectName: "button1"
    width: 1024
    height: 768
    color: "#666666"
    signal message(string msg)

    SoundEffect{
        id: sound
        source: "../audio/beep.wav"
    }

    Text {
        id: txtTitle
        x: 0
        y: 89
        width: 1024
        horizontalAlignment: Text.AlignHCenter
        text: qsTr("Buttons and Switches")
        font.bold: false
        font.pixelSize: 30
    }

    ImageButton {
        id: image_button1
        x: 509
        y: 261
        width: 102
        height: 102
        text: ""
        imageUp: "images/btn_off2.png"
        font.pixelSize: 18
        textColor: "#000000"
        imageDown: "images/btn_on2.png"
        font.bold: false
        font.family: "Arial"

        onButtonPress: {
            console.debug("Button Pressed.");
        }
    }


    Switch {
        id: switch1
        x: 207
        y: 245
        width: 49
        height: 135
        on: false
        textOff: ""
        textOn: ""
        textOnBold: false
        textOnFontFamily: "Arial"
        textOffFontFamily: "Arial"
        textOnFontSize: 14
        textOffFontSize: 14
        imageOn: "images/switch_on.png"
        imageOff: "images/switch_off.png"
        textOnColor: "#000000"
        textOffColor: "#000000"
        textOffBold: false

        onOnChanged: {
            console.debug(on)
        }
    }

    Switch {
        id: switch2
        x: 346
        y: 277
        width: 70
        height: 70
        on: false
        textOff: ""
        textOn: ""
        textOnBold: false
        textOnFontFamily: "Arial"
        textOffFontFamily: "Arial"
        textOnFontSize: 14
        textOffFontSize: 14
        imageOn: "images/btn_on.png"
        imageOff: "images/btn_off.png"
        textOnColor: "#000000"
        textOffColor: "#000000"
        textOffBold: false

        onOnChanged: {
            console.debug(on)
        }
    }

    VerticalSwitchGroup {
        id: switch_group2
        x: 705
        y: 239
        width: 60
        height: 146
        spacing: 10
        font.underline: false
        font.pixelSize: 20
        font.family: "Arial"
        font.bold: true
        model: ListModel {
            ListElement {
                text_on: "1"
                image_off: "../images/switchgroupup.png"
                val: "1"
                text_off: "1"
                image_on: "../images/switchgroupdown.png"
                item_width: 60
                item_height: 40
            }
            ListElement {
                text_on: "2"
                image_off: "../images/switchgroupup.png"
                val: "2"
                text_off: "2"
                image_on: "../images/switchgroupdown.png"
                item_width: 60
                item_height: 40
            }
            ListElement {
                text_on: "3"
                image_off: "../images/switchgroupup.png"
                val: "3"
                text_off: "3"
                image_on: "../images/switchgroupdown.png"
                item_width: 60
                item_height: 40
            }
        }

        textOnColor: "#000000"
        textOffColor: "#000000"

        onValueChanged: {
            console.debug(value);
        }
    }

    ImageButton {
        id: quitButton
        x: 208
        y: 497
        width: 48
        height: 48
        text: ""
        imageDown: "images/quit_down.png"
        imageUp: "images/quit_up.png"
        onButtonClick: parent.parent.parent.message("../src/mainmenu.qml");
    }


    Component.onCompleted: {
    }
}
