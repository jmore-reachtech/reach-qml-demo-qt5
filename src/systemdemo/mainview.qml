import QtQuick 2.0
import "../components"

Rectangle {
    id: root
    objectName: "root"
    width: 640
    height: 480
    property int page: 0
    property string swipe

    gradient: Gradient {
        GradientStop {
            position: 0.16
            color: "#afacac"
        }

        GradientStop {
            position: 1
            color: "#000000"
        }
    }

    signal message(string msg)

    Beeper{
        id: beeper
    }

    Backlight{
        id: backLight
    }

    Text {
        id: txtTitle
        x: 152
        y: 9
        text: qsTr("System Plugin Demo")
        anchors.horizontalCenterOffset: 0
        horizontalAlignment: Text.AlignLeft
        font.bold: false
        font.pixelSize: 21
        anchors.horizontalCenter: parent.horizontalCenter
    }

    NumericSelector {
        id: volume
        x: 65
        y: 63
        width: 107
        height: 34
        value: 50
        rightImageDown: "../images/right_arrow_spin_off.png"
        autoRepeatInterval: 10
        textFontFamily: "DejaVu Sans"
        increment: 1
        displayText: ""
        rightImageUp: "../images/right_arrow_spin.png"
        min: 0
        autoRepeat: true
        textColor: "#000000"
        max: 100
        leftImageDown: "../images/left_arrow_spin_off.png"
        precision: 0
        source: "../images/bg_numericedit.png"
        leftImageUp: "../images/left_arrow_spin.png"
        textFontPixelSize: 14
    }

    Text {
        id: text1
        x: 65
        y: 43
        width: 90
        height: 14
        color: "#ffffff"
        text: qsTr("Beeper Volume")
        font.bold: true
        font.pixelSize: 14
    }

    Text {
        id: text2
        x: 65
        y: 103
        width: 126
        height: 14
        color: "#ffffff"
        text: qsTr("Beeper Frequency")
        font.bold: true
        font.pixelSize: 14
    }

    NumericSelector {
        id: frequency
        x: 65
        y: 124
        width: 126
        height: 34
        value: 1000
        rightImageDown: "../images/right_arrow_spin_off.png"
        autoRepeatInterval: 10
        textFontFamily: "DejaVu Sans"
        increment: 100
        displayText: " hz"
        rightImageUp: "../images/right_arrow_spin.png"
        min: 100
        autoRepeat: true
        textColor: "#000000"
        max: 5000
        leftImageDown: "../images/left_arrow_spin_off.png"
        precision: 0
        source: "../images/bg_numericedit.png"
        leftImageUp: "../images/left_arrow_spin.png"
        textFontPixelSize: 14
    }

    Text {
        id: text3
        x: 65
        y: 166
        width: 126
        height: 14
        color: "#ffffff"
        text: qsTr("Beeper Duration")
        font.pixelSize: 14
        font.bold: true
    }

    NumericSelector {
        id: duration
        x: 65
        y: 187
        width: 126
        height: 34
        rightImageDown: "../images/right_arrow_spin_off.png"
        autoRepeatInterval: 10
        textFontFamily: "DejaVu Sans"
        increment: 1
        displayText: " ms"
        rightImageUp: "../images/right_arrow_spin.png"
        min: 100
        value: 100
        autoRepeat: true
        textColor: "#000000"
        max: 1000
        leftImageDown: "../images/left_arrow_spin_off.png"
        precision: 0
        source: "../images/bg_numericedit.png"
        leftImageUp: "../images/left_arrow_spin.png"
        textFontPixelSize: 14
    }


    Text {
        id: text4
        x: 296
        y: 43
        width: 119
        height: 14
        color: "#ffffff"
        text: qsTr("Disable Backlight")
        font.pixelSize: 14
        font.bold: true
    }

    Text {
        id: text5
        x: 296
        y: 103
        width: 119
        height: 14
        color: "#ffffff"
        text: qsTr("Backlight Brightness")
        font.pixelSize: 14
        font.bold: true
    }

    NumericSelector {
        id: brightness
        x: 296
        y: 124
        width: 107
        height: 34
        value: 100
        rightImageDown: "../images/right_arrow_spin_off.png"
        autoRepeatInterval: 10
        textFontFamily: "DejaVu Sans"
        increment: 1
        displayText: ""
        rightImageUp: "../images/right_arrow_spin.png"
        min: 0
        autoRepeat: true
        textColor: "#000000"
        max: 100
        leftImageDown: "../images/left_arrow_spin_off.png"
        precision: 0
        source: "../images/bg_numericedit.png"
        leftImageUp: "../images/left_arrow_spin.png"
        textFontPixelSize: 14
    }

    Text {
        id: textMsg
        x: 0
        y: 245
        visible: true
        width: 480
        height: 17
        color: "#f90e0e"
        text: qsTr("Data was saved!")
        font.bold: true
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 14
    }

    ImageButton {
        id: btnSubmit
        x: 210
        y: 204
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
            //Set the beeper values
            beeper.setVolume(volume.value);
            beeper.setFrequency(frequency.value);
            beeper.setDuration(duration.value);

            //Persist beeper values
            settings.setValue("beeper_volume", volume.value);
            settings.setValue("beeper_duration", duration.value);
            settings.setValue("beeper_frequency", frequency.value);

            //Set the Backlight values
            backLight.setBrightness(brightness.value);

            //Persist the Backlight values
            settings.setValue("backlight_enable", enable.on);
            settings.setValue("backlight_brightness", brightness.value);
            textMsg.visible = true;
        }
    }

    ImageButton {
            id: quitButton
            x: 415
            y: 216
            width: 48
            height: 48
            text: ""
            imageDown: "../images/quit_down.png"
            imageUp: "../images/quit_up.png"
            onButtonClick: root.message("../src/mainmenu.qml");
        }

    ImageButton {
            id: disableBacklightButton
            x: 296
            y: 65
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

    Component.onCompleted: {
        textMsg.visible = false;
        volume.value = beeper.volume();
        duration.value = beeper.duration();
        frequency.value = beeper.frequency();
        brightness.value = backLight.brightness();

    }


}
