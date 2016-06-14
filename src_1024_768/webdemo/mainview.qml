import QtQuick 2.0
import QtWebKit 3.0
import "../components"

Rectangle {
    id: root
    width: 1024
    height: 768
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
            x: 107
            y: 43
            width: 800
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
        x: 107
        y: 675
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
        x: 207
        y: 675
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
            onButtonClick: mainView.mainLoader.source = "../mainmenu.qml";
        }
    }
}

