import QtQuick 2.0
import "../components"
import "js/dataModel.js" as Db


Rectangle {
    width: 1280
    height: 800
    id: root
    color: "#666666"

    signal message(string msg)


    Text {
        id: textTitle
        x: -8
        y: 268
        width: 1280
        height: 44
        color: "#ffffff"
        text: qsTr("Placeholder for Setting Controls")
        font.underline: false
        font.pixelSize: 30
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        style: Text.Normal
        font.bold: true
        font.family: "MV Boli"
        horizontalAlignment: Text.AlignHCenter
    }


    ImageButton {
        id: btnCancel
        x: 602
        y: 430
        width: 86
        height: 74
        text: ""
        imageUp: "images/btnCancel.png"
        imageDown: "images/btnCancelOff.png"
        onButtonClick: {
            root.message("mainview.qml")
        }
    }

    Component.onCompleted: Db.firstRun = false;
}
