import QtQuick 2.0
import "../components"

Rectangle {
    id: root
    objectName: "root"
    width: 1280
    height: 800
    color: "#666666"
    signal message(string msg)

    Text {
        id: txtTitle
        x: 0
        y: 89
        width: 1280
        text: qsTr("Buttons and Switches")
        horizontalAlignment: Text.AlignHCenter
        font.bold: false
        font.pixelSize: 30
    }

    Rectangle{
        x: 315
        y: 249
        width: 183
        height: 94
        color: "transparent"

        MouseArea{
            x: 67
            y: 0
            anchors.rightMargin: -67
            anchors.bottomMargin: 0
            anchors.leftMargin: 67
            anchors.topMargin: 0
            anchors.fill: parent
        }

        AnimatedSwitch{
            x: 94
            y: 19
            anchors.verticalCenterOffset: 0
            anchors.horizontalCenterOffset: 67
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
        x: 390
        y: 464
        width: 281
        height: 60
        font.pixelSize: 16
        spacing: 10
        font.family: "Arial"
        font.bold: true
        model: ListModel {
            ListElement {
                text_on: "A"
                image_off: "../images/switchgroupuprnd.png"
                val: "a"
                text_off: "A"
                image_on: "../images/switchgroupdownrnd.png"
                item_width: 70
                item_height: 70
            }

            ListElement {
                text_on: "B"
                image_off: "../images/switchgroupuprnd.png"
                val: "b"
                text_off: "B"
                image_on: "../images/switchgroupdownrnd.png"
                item_width: 70
                item_height: 70
            }
            ListElement {
                text_on: "C"
                image_off: "../images/switchgroupuprnd.png"
                val: "c"
                text_off: "C"
                image_on: "../images/switchgroupdownrnd.png"
                item_width: 70
                item_height: 70
            }
            ListElement {
                text_on: "D"
                image_off: "../images/switchgroupuprnd.png"
                val: "d"
                text_off: "D"
                image_on: "../images/switchgroupdownrnd.png"
                item_width: 70
                item_height: 70
            }
        }
        textOnColor: "#000000"
        textOffColor: "#000000"

        onValueChanged: console.debug(value);
    }

    ImageButton {
        id: image_button1
        x: 738
        y: 419
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
        x: 650
        y:258
        width: 145
        height: 76
        color: "transparent"

        MouseArea{
            x: 75
            y: 0
            width: 155
            height: 86
            anchors.rightMargin: -75
            anchors.bottomMargin: 0
            anchors.leftMargin: 75
            anchors.topMargin: 0
            anchors.fill: parent
        }

        AnimatedSwitch{
            id: animatedswitch2
            x: 98
            y: 24
            width: 120;
            height: 40;
            anchors.verticalCenterOffset: 0
            anchors.horizontalCenterOffset: 75
            anchors.centerIn: parent
            on: true
            imageOff: "images/animated_btn_off.png"
            imageOffWidth: 120
            imageOffHeight: 40
            sliderImage: "images/animated_slider.png"
            imageOn: "images/animated_btn_on.png"
            imageOnWidth: 120
            imageOnHeight: 40
            sliderImageOnX: 0
            sliderImageY: 0
            sliderImageOffX: 62
            textOnX: 18
            textOffX: 68
            textColor: "Black"
        }

    }


}
