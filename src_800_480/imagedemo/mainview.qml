import QtQuick 2.0
import "../components"
import "../js/imagedemo.js" as Jscript
//import com.reachtech.systemplugin 1.0

Rectangle {
    id: root
    width: 800
    height: 480
    color: "#666666"
    signal message(string msg)
    property string usbFolder: ""

    Text {
        id: txtTitle
        x: 0
        y: 53
        width: 800
        height: 29
        text: qsTr("Image Test")
        horizontalAlignment: Text.AlignHCenter
        font.bold: false
        font.pixelSize: 26
        font.family: "DejaVu Sans"
    }

    ImageButton {
        id: btnTestImages
        x: 294
        y: 111
        width: 240
        height: 40
        text: "Browse Test Images"
        imageUp: "images/red_up.png"
        imageDown: "images/red_down.png"
        font.pixelSize: 16
        textColor: "#ffffff"
        font.bold: false
        font.family: "DejaVu Sans"
        onButtonClick: {
            Jscript.folder = "/application/src/imagedemo/testimages/";
            message("imagedemo/imagebrowse.qml");
        }
    }

    ImageButton {
        id: btnUSB
        x: 294
        y: 182
        width: 240
        height: 40
        text: "Browse USB Drive Images"
        imageUp: "images/red_up.png"
        imageDown: "images/red_down.png"
        font.pixelSize: 16
        textColor: "#ffffff"
        font.bold: false
        font.family: "DejaVu Sans"

        onButtonClick: {
            if (usbFolder.length > 0)
            {
                Jscript.folder = usbFolder + "/";
                var images = system.execute("sh /application/src/imagedemo/files.sh " + Jscript.folder);
                var values = images.split('\n');

                if (values.length > 1 && values[0].indexOf("No such file or directory") < 0)
                    message("imagedemo/imagebrowse.qml");
                else
                {
                    txtWarning.text = "Insert USB drive with customer images to display.\nFormats supported are *.bmp, *.png, *.jpg, *.gif, *.svg";
                    txtWarning.visible = true;
                }
            }
            else{
                txtWarning.text = "Insert USB drive with customer images to display.\nFormats supported are *.bmp, *.png, *.jpg, *.gif, *.svg";
                txtWarning.visible = true;
                timer.restart();
			}
        }
    }

    ImageButton {
        id: btnUnmount
        x: 294
        y: 252
        width: 240
        height: 40
        text: "Unmount USB Drive"
        imageUp: "images/red_up.png"
        imageDown: "images/red_down.png"
        font.pixelSize: 16
        textColor: "#ffffff"
        font.bold: false
        font.family: "DejaVu Sans"

        onButtonClick: {
            if (usbFolder.length > 0)
            {
                var test = system.execute("umount " + usbFolder);
                usbFolder = "";
                txtWarning.text = "You can safely unplug your USB drive.";
                txtWarning.visible = true;
            }
        }
    }

    ImageButton {
        id: btnQuit
        x: 294
        y: 323
        width: 240
        height: 40
        text: "Go Back to Main Menu"
        imageUp: "images/red_up.png"
        imageDown: "images/red_down.png"
        font.pixelSize: 16
        textColor: "#ffffff"
        font.bold: false
        font.family: "DejaVu Sans"

        onButtonClick: {
            message("../src/mainmenu.qml");
        }
    }

    System{
        id: system
    }

    Text {
        id: txtWarning
        x: 0
        y: 375
        width: 800
        height: 72
        color: "#ff0000"
        visible: false
        wrapMode: Text.NoWrap
        horizontalAlignment: Text.AlignHCenter
        font.bold: false
        font.pixelSize: 19
    }

    Timer{
        id: timer
        interval: 500
        running: false
        repeat: true
        onTriggered: testForUSB();
    }

    function testForUSB()
    {
        var data = system.execute("sh", "/application/src/imagedemo/usb.sh");
        var values = data.split('\n');
        if (values.length > 0 && values[0].length > 0)
        {
            usbFolder = values[0];
            console.debug(usbFolder);
            if (timer.running)
                timer.stop();
			txtWarning.text = "USB drive detected";
        }
    }

    Component.onCompleted: {
        testForUSB();
        if (usbFolder.length == 0)
            timer.start();
    }
}
