import QtQuick 2.0
import "../components"
import "js/dataModel.js" as Db


Rectangle {
    width: 480
    height: 272
    id: root
    color: "#666666"

    signal message(string msg)

    Text {
        id: textTitle
        x: 0
        y: 41
        width: 480
        color: "#ffffff"
        text: qsTr("Placeholder for Setting Controls")
        font.underline: false
        font.pointSize: 16
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        style: Text.Normal
        font.bold: true
        font.family: "MV Boli"
        horizontalAlignment: Text.AlignHCenter
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
            root.message("mainview.qml")
        }
    }

    Component.onCompleted: Db.firstRun = false;
}
