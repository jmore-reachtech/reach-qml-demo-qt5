import QtQuick 1.1
import "../components"
import "js/dataModel.js" as Db


Rectangle {
    width: 480
    height: 272
    id: root
    color: "#2D2D2D"

    signal message(string msg)

    gradient: Gradient {
        GradientStop {position: 0.0; color: "#666666"}
        GradientStop {position: 1.0; color: "#EEEEEE"}
    }

    Text {
        id: textTitle
        x: 0
        y: 41
        width: 480
        color: "#ffffff"
        text: qsTr("Rinsing the coffee maker please wait...")
        font.underline: false
        font.pixelSize: 18
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        style: Text.Normal
        font.bold: true
        horizontalAlignment: Text.AlignHCenter
    }

    ProgressBar{
        id: progress
        x: 50
        y: 125
        width: 381
        height: 23

    }

    Timer{
        id: timer

        interval: 100; running: true; repeat: true
        onTriggered: {
            progress.value += 2;
            if (progress.value == progress.maximum)
            {
                timer.stop();
                root.message("mainview.qml")
            }
        }
    }

    ImageButton {
        id: btnCancel
        x: 208
        y: 202
        width: 76
        height: 64
        text: ""
        imageUp: "images/btnCancel.png"
        imageDown: "images/btnCancelOff.png"
        onButtonClick: {
            if (typeof connection === "undefined")
                console.debug("rinse=0");
            else
                connection.sendMessage("rinse=0");
            root.message("mainview.qml");
        }
    }

    Component.onCompleted: {
        if (typeof connection === "undefined")
            console.debug("rinse=1");
        else
            connection.sendMessage("rinse=1");
    }


}
