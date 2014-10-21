import QtQuick 2.0
import "../components"

Rectangle{
    id: root
    objectName: "root"
    width: 800
    height: 480
    property int totalFiles: 0    
    color: "#666666"

    signal message(string msg)

    VerticalRadioButtonList {
        id: radio
        x: 277
        y: 209
        spacing: 4
        font.pixelSize: 14
        textColor: "#000000"
        imageHeight: 28
        itemSpacing: 7
        imageWidth: 28
        font.family: "DejaVu Sans"
        font.bold: false
        model: ListModel {
            ListElement {
                item_value: "/media/sda1/application"
                item_checked: true
                item_text: "Upgrade from USB thumbdrive"
            }

            ListElement {
                item_value: "/media/mmcblk0p2/application"
                item_checked: false
                item_text: "Upgrade from uSD card"
            }
        }
        imageUnChecked: "../images/radiobutton.png"
        imageChecked: "../images/radiobutton_click.png"

        onValueChanged: {
            plugin.upgradeSourcePath = value;
            text1.text = "Note: If you decide to upgrade the demo,\nall files in the " + plugin.applicationSourcePath + " folder will be deleted.\n"
                  + "The upgrade path is " + plugin.upgradeSourcePath;

        }
    }

    Upgrade{
        id: plugin
        applicationSourcePath: "/application"
        upgradeSourcePath: "/media/sda1/application"

        onProgressChanged:{
            progress.value = (plugin.progress()/totalFiles)*100;
            if (progress.value == 100)
            {
                progress.visible = false;
                btnRestart.visible = true;
                text1.text = "The upgrade was successful.\nClick the \"Restart\" button to reboot your module.";
            }

            if (progress.value == 50)
                progress.hintFontColor = "#000000"
        }

        onErrorMsgChanged:{
            text1.text = plugin.errorMsg();
            btnRestart.visible = false;
            progress.visible = false;
			btnQuit.visible = true;
			btnQuit.x = 195;
			text1.y = 60;
        }
    }

    HorizontalLevelIndicator {
        id: progress
        x: 200
        y: 204
        width: 400
        height: 20
        imageBase: "tank.png"
        imageOverlay: "tank_overlay.png"
        increment: 4
        maxValue: 100
        minValue: 0
        value: 0
        symbol: "%"
        hintFontBold: true
        hintFontColor: "#ffffff"
        hintFontPixelSize: 14
        hintFontFamily: "DejaVu Sans"
        visible: false
    }


    ImageButton {
        id: btnRestart
        x: 355
        y: 215
        width: 90
        height: 56
        text: "Restart"
        imageUp: "../images/internal_button_up.bmp"
        imageDown: "../images/internal_button_dn.bmp"
        font.bold: true
        font.family: "DejaVu Sans"
        font.pixelSize: 14
        visible: false

        onButtonClick: {
            btnRestart.visible = false;
            text1.text = "Please wait...rebooting the module."
            plugin.execute("/etc/init.d/reboot", [""]);

        }
    }

    Text {
        id: text1
        x: 160
        y: 98
        width: 480
        height: 51
        text: "Note: If you decide to upgrade the demo,\nall files in the " + plugin.applicationSourcePath + " folder will be deleted.\n"
              + "The upgrade path is " + plugin.upgradeSourcePath;
        font.family: "DejaVu Sans"
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 15
    }


    AlphaField {
        id: password
        x: 277
        y: 172
        width: 247
        height: 26
        inputFontBold: true
        labelFontBold: false
        fieldSpacing: 7
        inputText: "1234"
        keyTextColor: "#ffffff"
        inputColor: "#ffffff"
        labelColor: "#000000"
        inputFontPixelSize: 14
        keyboardAnimationSpeed: 100
        inputFontFamily: "DejaVu Serif"
        labelFontFamily: "DejaVu Sans"
        labelFontPixelSize: 14
        labelText: "Enter Password"
    }

    ImageButton {
        id: btnQuit
        x: 421
        y: 292
        width: 90
        height: 42
        text: "Go Back"
        font.pixelSize: 14
        font.bold: true
        imageDown: "../images/internal_button_dn.bmp"
        imageUp: "../images/internal_button_up.bmp"
        onButtonClick: root.message("../src/mainmenu.qml");
    }

    ImageButton {
        id: btnUpgrade
        x: 314
        y: 292
        width: 90
        height: 42
        text: "Upgrade"
        imageUp: "../images/internal_button_up.bmp"
        imageDown: "../images/internal_button_dn.bmp"
        font.bold: true
        font.family: "DejaVu Sans"
        font.pixelSize: 14

        onButtonClick: {
            var passw = settings.getValue("password");

            if (passw === password.inputText)
            {
                totalFiles = plugin.getTotalFileCount();
                btnUpgrade.visible = false;
                btnQuit.visible = false;
                password.visible = false;
                radio.visible = false;
                progress.visible = true;
                plugin.upgrade();
            }
            else
            {
                text1.text = "Password was invalid.  Try again.";
            }
        }
    }



    System{
        id: system
    }

    Component.onCompleted: {
        //Check if we are running from NAND
        var data = system.execute("df");

        if (data.indexOf("ubi0:rootfs0") < 0)
        {
            //show an error
            text1.text = "Error:  You must boot from NAND to upgrade."
            btnUpgrade.visible = false;
            password.visible = false;
            radio.visible = false;
			btnQuit.x = 195;
			text1.y = 60;
        }
    }


}
