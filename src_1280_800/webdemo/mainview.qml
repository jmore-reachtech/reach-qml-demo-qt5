import QtQuick 2.0
import QtWebKit 3.0
import "../components"

Rectangle {
    id: root
    width: 1280
    height: 800
    color: "gray"
    signal message(string msg)

    Flickable {
        id: flick
        anchors.centerIn: parent
        anchors.verticalCenterOffset: -30
        width: 1080
        height: 600
        boundsBehavior: Flickable.StopAtBounds
        contentWidth: web.width
        contentHeight: web.height
        interactive: true
        clip: true


        WebView{
            id: web
            width: 1080
            height: 600
            url: "http://127.0.0.1/info"
        }

    }

    Text{
        id: txtProgress
        anchors.centerIn: parent
        text: "Loading please wait..."
        font.pixelSize: 34
        color: "red"
        visible: web.loading
    }

    ImageButton {
        id: btnReload
        anchors.left: flick.left
        anchors.top: flick.bottom
        anchors.topMargin: 10
        width: 80
        height: 40
        text: "Reload"
        imageUp: "../images/internal_button_up.bmp"
        font.pixelSize: 18
        textColor: "#000000"
        imageDown: "../images/internal_button_dn.bmp"
        font.bold: false
        font.family: "DejaVu Sans"

        onButtonClick: {
            web.url = "http://127.0.0.1/info"
        }
    }

    ImageButton {
        id: btnBack
        anchors.left: btnReload.right
        anchors.leftMargin: 10
        anchors.top: flick.bottom
        anchors.topMargin: 10
        width: 80
        height: 40
        text: "Back"
        imageUp: "../images/internal_button_up.bmp"
        font.pixelSize: 18
        textColor: "#000000"
        imageDown: "../images/internal_button_dn.bmp"
        font.bold: false
        font.family: "DejaVu Sans"

        onButtonClick: {
            onButtonClick: root.message("../src/mainmenu.qml");
        }
    }

    Text{
        id: txtMessage
        text: "Flick up or down to scroll."
        font.pixelSize: 20
        anchors.left: btnBack.right
        anchors.leftMargin: 10
        anchors.top: flick.bottom
        anchors.topMargin: 10
    }
}

