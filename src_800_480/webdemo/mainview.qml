import QtQuick 2.0
import QtWebKit 3.0
import "../components"

Rectangle {
    id: root
    width: 800
    height: 480
    color: "gray"
    signal message(string msg)

    Flickable {
        anchors.fill: parent
        contentWidth: parent.width
        contentHeight: web.height
        interactive: true
        clip: true
        WebView{
            id: web
            width: 800
            height: 417
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
        x: 20
        y: 430
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
        x: 120
        y: 430
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
}

