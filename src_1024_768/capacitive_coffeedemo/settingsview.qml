import QtQuick 2.0
import "../components"
import "js/dataModel.js" as Db


Rectangle {
    width: 1024
    height: 768
    id: root
    color: "#666666"

    signal message(string msg)


    Text {
        id: textTitle
        x: -8
        y: 268
        width: 1024
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
        x: 474
        y: 437
        width: 76
        height: 64
        text: ""
        imageUp: "images/btnCancel.png"
        imageDown: "images/btnCancelOff.png"
        onButtonClick: {
            root.message("mainview.qml")
        }
    }

    Component.onCompleted: Db.firstRun = false;
}
