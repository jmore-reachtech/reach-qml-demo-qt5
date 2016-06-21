import QtQuick 2.0
import "../components"
import com.reachtech.systemplugin 1.0

Rectangle{
    id: root
    objectName: "root"
    width: 640
    height: 480
    property int totalFiles: 0
	color: "#DDDDDD"
    signal message(string msg)

	Text {
        id: txtTitle
        x: 0
        y: 50
        width: 640
        height: 51
        text: "Upgrade Demo"
        font.family: "DejaVu Sans"
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 24
    }

    VerticalRadioButtonList {
        id: radio
        x: 231
        y: 166
        spacing: 6
        font.pixelSize: 14
        textColor: "#000000"
        imageHeight: 28
        itemSpacing: 7
        imageWidth: 28
        font.family: "DejaVu Sans"
        font.bold: false
        model: ListModel {
        }
        imageUnChecked: "../images/radiobutton.png"
        imageChecked: "../images/radiobutton_click.png"

        onValueChanged: {
            plugin.upgradeSourcePath = value;
            text1.text = "Note: If you decide to upgrade,\nall files in the " + plugin.applicationSourcePath + " folder will be deleted.\n"
                  + "The upgrade path is " + plugin.upgradeSourcePath;

        }
    }

    Upgrade{
        id: plugin
        applicationSourcePath: "/application/src"
        upgradeSourcePath: "/media/sda/application/src"

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
			text1.y = 60;
        }
    }

    HorizontalLevelIndicator {
        id: progress
        x: 120
        y: 160
        width: 400
        height: 40
        imageBase: "../images/tank.png"
        imageOverlay: "../images/tank_overlay.png"
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
        x: 277
        y: 225
        width: 90
        height: 56
        text: "Restart"
        imageUp: "../images/internal_button_up.bmp"
        imageDown: "../images/internal_button_dn.bmp"
        font.bold: false
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
        x: 0
        y: 100
        width: 640
        height: 51
        text: ""
        font.family: "DejaVu Sans"
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 15
    }

    ImageButton {
        id: btnBack
        x: 277
        y: 358
        width: 90
        height: 42
        text: "Back"
        imageUp: "../images/internal_button_up.bmp"
        imageDown: "../images/internal_button_dn.bmp"
        font.bold: false
        font.family: "DejaVu Sans"
        font.pixelSize: 14
        visible: true

        onButtonClick: {
            onButtonClick: mainView.mainLoader.source = "../mainmenu.qml";
        }
    }

    ImageButton {
        id: btnUpgrade
        x: 277
        y: 297
        width: 90
        height: 42
        text: "Upgrade"
        imageUp: "../images/internal_button_up.bmp"
        imageDown: "../images/internal_button_dn.bmp"
        font.bold: false
        font.family: "DejaVu Sans"
        font.pixelSize: 14
        visible: false

        onButtonClick: {
		    if (radio.value.length > 0)
			{
                totalFiles = plugin.getTotalFileCount();
                btnUpgrade.visible = false;
                btnBack.visible = false;
                radio.visible = false;
                progress.visible = true;
                plugin.upgrade();
			}
			else
			    text1.text = "Please choose a radio button selection.";
        }
    }

    System{
        id: system
    }

    Timer{
        id: timer
        interval: 100; running: true; repeat: true
        onTriggered: checkForUSBDevices();
    }


    function checkForUSBDevices()
    {
        var usb = system.execute("sh /application/src/upgradedemo/usb.sh");
        var values = usb.split("\n");
        
        if (values.length > 0 && values[0].length > 0)
		{
		    btnUpgrade.visible = true;
            text1.text = "USB stick found.";
			timer.stop();
		}
        else {
		    btnUpgrade.visible = false;
            text1.text = "No USB stick found.  Plug in a USB stick."
        }

        for (var i=1; i < values.length-1; i++)
        {
            radio.model.append({item_value: values[i] + "/application/src", item_checked: false, item_text: "Upgrade from USB Stick: " + values[i]});
        }
    }

    Component.onCompleted: {
    }


}

