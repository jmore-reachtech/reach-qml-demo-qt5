import QtQuick 2.0
import "../components"

Rectangle {
    id: root
    objectName: "root"
    width: 480
    height: 272
    color: "#666666"
    signal message(string msg)

    gradient: Gradient {
        GradientStop {position: 0.0; color: "#666666"}
        GradientStop {position: 1.0; color: "#EEEEEE"}
    }

    Text {
        id: txtTitle
        x: 139
        y: 8
        text: qsTr("Buttons and Switches")
        font.bold: false
        font.pixelSize: 21
    }

    Rectangle{
        x: 35
        y: 45
        width: 183
        height: 94
        color: "transparent"

        MouseArea{
            anchors.fill: parent
        }

        AnimatedSwitch{
            anchors.centerIn: parent
            font.bold: false
            font.pixelSize: 22
            font.family: "Arial"
            on: false
            onOnChanged: {
                console.debug(on)
            }
        }

    }

    HorizontalSwitchGroup {
        id: switch_group___horizontal1
        x: 61
        y: 158
        width: 8
        font.pixelSize: 16
        spacing: 5
        font.family: "Arial"
        font.bold: true
        model: ListModel {
            ListElement {
                text_on: "A"
                image_off: "../images/switchgroupuprnd.png"
                val: "a"
                text_off: "A"
                image_on: "../images/switchgroupdownrnd.png"
                item_width: 60
                item_height: 60
            }

            ListElement {
                text_on: "B"
                image_off: "../images/switchgroupuprnd.png"
                val: "b"
                text_off: "B"
                image_on: "../images/switchgroupdownrnd.png"
                item_width: 60
                item_height: 60
            }
            ListElement {
                text_on: "C"
                image_off: "../images/switchgroupuprnd.png"
                val: "c"
                text_off: "C"
                image_on: "../images/switchgroupdownrnd.png"
                item_width: 60
                item_height: 60
            }
        }
        textOnColor: "#000000"
        textOffColor: "#000000"

        onValueChanged: console.debug(value);
    }

    ImageButton {
        id: image_button1
        x: 302
        y: 120
        width: 122
        height: 123
        text: ""
        imageUp: "images/btn_on3.png"
        font.pixelSize: 18
        textColor: "#000000"
        imageDown: "images/btn_off3.png"
        font.bold: false
        font.family: "Arial"

        onButtonPress: console.debug("pressed");
    }

    Rectangle{
        x: 271
        y:45
        width: 145
        height: 76
        color: "transparent"

        MouseArea{
            anchors.fill: parent
        }

        AnimatedSwitch{
            id: animatedswitch2
            width: 100;
            height: 27;
            anchors.centerIn: parent
            on: true
            imageOff: "images/animated_btn_off.png"
            imageOffWidth: 100
            imageOffHeight: 27
            sliderImage: "images/animated_slider.png"
            imageOn: "images/animated_btn_on.png"
            imageOnWidth: 100
            imageOnHeight: 27
            sliderImageOnX: 0
            sliderImageY: 0
            sliderImageOffX: 62
            textOnX: 18
            textOffX: 54
            textColor: "Black"
        }

}

}
