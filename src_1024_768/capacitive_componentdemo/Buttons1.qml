import QtQuick 2.0
import "../components"

Rectangle {
    id: button1
    objectName: "button1"
    width: 1024
    height: 768
    color: "#666666"
    signal message(string msg)

    Text {
        id: txtTitle
        x: 0
        y: 89
        width: 1024
        height: 32
        text: qsTr("Buttons and Switches")
        horizontalAlignment: Text.AlignHCenter
        font.bold: false
        font.pixelSize: 30
    }

    ImageButton {
        id: image_button1
        x: 540
        y: 263
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
        x: 268
        y: 249
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
        x: 400
        y: 279
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

        VerticalSwitchGroup {
            id: switch_group2
            x: 329
            y: -30
            height: 2
            spacing: 14
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

            onValueChanged: console.debug(value);
        }
    }

    ImageButton {
        id: quitButton
        x: 269
        y: 531
        width: 48
        height: 48
        text: ""
        imageDown: "images/quit_down.png"
        imageUp: "images/quit_up.png"
        onButtonClick: parent.parent.parent.parent.parent.message("../src/mainmenu.qml");
    }

    Rectangle{
        id: rectOpaque
        color: "#666666"
        width: 1024
        height: 768
        opacity: 0.2

        Rectangle{
            id: rectMessage
            x: 68
            y: 84
            radius: 10
            anchors.verticalCenterOffset: 0
            anchors.horizontalCenterOffset: 0
            border.width: 2
            opacity: 1.0
            border.color: "#0f0f0e"
            height: 218
            width: 500
            smooth: true
            anchors.centerIn: parent
            gradient: Gradient {
                GradientStop {position: 0.0; color: "#ffffff"}
                GradientStop {position: 1.0; color: "#666666"}
            }

            Text{
                id: txtMessage
                height: 43
                color: "#ffffff"
                text: "Swipe right or left to change pages."
                verticalAlignment: Text.AlignVCenter
                anchors.verticalCenter: parent.verticalCenter
                horizontalAlignment: Text.AlignHCenter
                font.bold: true
                font.pixelSize: 22
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Image {
                id: image1
                x: 8
                y: 31
                width: 50
                height: 43
                anchors.rightMargin: -32
                smooth: true
                source: "images/leftarrow.png"
                anchors.right: txtMessage.left
            }

            Image {
                id: image2
                x: 281
                y: 30
                width: 50
                height: 43
                anchors.leftMargin: -23
                source: "images/rightarrow.png"
                anchors.left: txtMessage.right
            }


        }

        MouseArea{
            width: 1024
            height: 768
            anchors.fill: parent
            onClicked: {rectOpaque.visible = false;}

        }


    }


    PropertyAnimation {
         id: showAnim
         target: rectOpaque
         property: "opacity"
         duration: 2000
         easing.type: Easing.InOutQuad
     }


    Component.onCompleted: {
        showAnim.from = 0.2;
        showAnim.to = 1.0;
        showAnim.start();
        var src1 = "import QtQuick 2.0; Timer {id: timer1; interval: 3000; running: false; repeat: false; onTriggered:{rectOpaque.visible = false;} }";
        var timer1 = Qt.createQmlObject(src1, button1, "timerObject1");
        timer1.start();


    }
}
