import QtQuick 2.0
import com.reachtech.systemplugin 1.0
import "../components"

Rectangle {
    id: root
    objectName: "root"
    width: 640
    height: 480
    property int page: 0
    property string swipe
    color: "#666666"

    signal message(string msg)

    Backlight{
        id: backLight
    }

    Network{
        id: network
    }

	System{
	    id: system
	}
    Text {
        id: txtTitle
        x: 0
        y: 41
        width: 640
        height: 25
        text: qsTr("System Plugin Demo")
        anchors.horizontalCenterOffset: 0
        horizontalAlignment: Text.AlignHCenter
        font.bold: false
        font.pixelSize: 21
        anchors.horizontalCenter: parent.horizontalCenter
    }


    Text {
        id: text4
        x: 122
        y: 131
        width: 119
        height: 14
        color: "#ffffff"
        text: qsTr("Disable Backlight")
        font.pixelSize: 16
        font.bold: false
    }

    Text {
        id: text5
        x: 122
        y: 208
        width: 119
        height: 14
        color: "#ffffff"
        text: qsTr("Backlight Brightness")
        font.pixelSize: 16
        font.bold: false
    }

    NumericSelector {
        id: brightness
        x: 122
        y: 235
        width: 119
        height: 38
        value: 7
        rightImageDown: "../images/right_arrow_spin_off.png"
        autoRepeatInterval: 10
        textFontFamily: "DejaVu Sans"
        increment: 1
        displayText: ""
        rightImageUp: "../images/right_arrow_spin.png"
        min: 0
        autoRepeat: false
        textColor: "#000000"
        max: 7
        leftImageDown: "../images/left_arrow_spin_off.png"
        precision: 0
        source: "../images/bg_numericedit.png"
        leftImageUp: "../images/left_arrow_spin.png"
        textFontPixelSize: 14
    }

    Text {
        id: textMsg
        x: 80
        y: 366
        visible: true
        width: 480
        height: 17
        color: "#f90e0e"
        text: qsTr("Data was saved!")
        font.bold: false
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 16
    }

    ImageButton {
        id: btnSubmit
        x: 290
        y: 300
        width: 60
        height: 35
        text: "Submit"
        imageUp: "../images/internal_button_up.bmp"
        textColor: "#000000"
        font.pixelSize: 14
        imageDown: "../images/internal_button_dn.bmp"
        font.family: "DejaVu Sans"
        font.bold: false

        onButtonClick: {
            //Set the Backlight values
            backLight.setBrightness(brightness.value);

            //Persist the Backlight values
            settings.setValue("backlight_brightness", brightness.value);
            textMsg.visible = true;
        }
    }

    ImageButton {
            id: quitButton
            x: 482
            y: 287
            width: 48
            height: 48
            text: ""
            imageDown: "../images/quit_down.png"
            imageUp: "../images/quit_up.png"
            onButtonClick: root.message("../src/mainmenu.qml");
        }

    ImageButton {
            id: disableBacklightButton
            x: 122
            y: 159
            width: 107
            height: 34
            text: "3 second test"
            font.pixelSize: 14
            imageDown: "../images/internal_button_dn.bmp"
            imageUp: "../images/internal_button_up.bmp"
            onButtonClick: {
                var start = new Date().getTime();
                backLight.disable();
                while ( (new Date().getTime() - start) < 3000)
                {

                }

                backLight.enable();
            }
    }

    Text {
        id: txtNetwork
        x: 0
        y: 89
        width: 640
        height: 19
        text: qsTr("IP Address of Module: ")
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 16
        color: "Yellow"
    }

	Text {
        id: txtTime
        x: 0
        y: 120
        width: 640
        height: 19
        text: ""
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 16
        color: "Yellow"
    }
	
    Component.onCompleted: {
        textMsg.visible = false;
        brightness.value = backLight.brightness();
		txtNetwork.text += network.getIp();
        txtTime.text = system.currentDateTime();
    }


}
