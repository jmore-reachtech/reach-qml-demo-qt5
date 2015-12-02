import QtQuick 2.0
import com.reachtech.systemplugin 1.0
import "../components"

Rectangle {
    id: root
    objectName: "root"
    width: 1280
    height: 800
    property int page: 0
    property string swipe
    color: "#666666"

    signal message(string msg)

    Backlight{
        id: backLight
    }

	System{
	    id: system
	}
    Text {
        id: txtTitle
        x: 0
        y: 167
        width: 1280
        height: 25
        text: qsTr("System Plugin Demo")
        anchors.horizontalCenterOffset: 0
        horizontalAlignment: Text.AlignHCenter
        font.bold: false
        font.pixelSize: 30
        anchors.horizontalCenter: parent.horizontalCenter
        font.family: "DejaVu Sans"
    }


    Text {
        id: text4
        x: 565
        y: 275
        width: 119
        height: 14
        color: "#ffffff"
        text: qsTr("Disable Backlight")
        font.pixelSize: 22
        font.bold: false
    }

    Text {
        id: text5
        x: 565
        y: 364
        width: 119
        height: 14
        color: "#ffffff"
        text: qsTr("Backlight Brightness")
        font.pixelSize: 22
        font.bold: false
    }

    NumericSelector {
        id: brightness
        x: 565
        y: 393
        width: 119
        height: 38
        value: 7
        rightImageDown: "../images/right_arrow_spin_off.png"
        autoRepeatInterval: 10
        textFontFamily: "DejaVu Sans"
        increment: 1
        displayText: ""
        rightImageUp: "../images/right_arrow_spin.png"
        min: 5
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
        x: 0
        y: 526
        visible: true
        width: 1280
        height: 17
        color: "#f90e0e"
        text: qsTr("Data was saved!")
        font.bold: false
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 22
    }

    ImageButton {
        id: btnSubmit
        x: 565
        y: 458
        width: 80
        height: 40
        text: "Submit"
        imageUp: "../images/blue_button_up.png"
        textColor: "#ffffff"
        font.pixelSize: 18
        imageDown: "../images/blue_button_dn.png"
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
            x: 660
            y: 458
            width: 64
            height: 40
            text: "Back"
            textColor: "#ffffff"
            font.pixelSize: 18
			font.family: "DejaVu Sans"
            imageDown: "../images/blue_button_dn.png"
            imageUp: "../images/blue_button_up.png"
            onButtonClick: root.message("../src/mainmenu.qml");
        }

    ImageButton {
            id: disableBacklightButton
            x: 565
            y: 307
            width: 150
            height: 40
            text: "3 second test"
            textColor: "#ffffff"
            font.family: "DejaVu Sans"
            font.pixelSize: 18
            imageDown: "../images/blue_button_dn.png"
            imageUp: "../images/blue_button_up.png"
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
        id: txtTime
        x: 0
        y: 228
        width: 1280
        height: 19
        text: "Time"
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 22
        color: "Yellow"
    }
	
    Component.onCompleted: {
        textMsg.visible = false;
        brightness.value = backLight.brightness();
        txtTime.text = "Current Date Time: " + system.currentDateTime();
    }


}
