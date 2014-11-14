import QtQuick 2.0
import "../components"

Rectangle {
    id: root
    objectName: "root"
    width: 800
    height: 480
    color: "#eeeeee"

    signal message(string msg)

    DrawArea{
        id: da
        x: 20
        y: 125
        width: 600
        height: 92
        color: "white"
    }

    Image {
        id: image1
        x: 20
        y: 223
        width: 597
        height: 119
    }


    ImageButton {
        id: image_button1
        x: 26
        y: 348
        width: 64
        height: 40
        text: "Copy"
        imageUp: "../images/internal_button_up.bmp"
        font.pixelSize: 14
        textColor: "#000000"
        imageDown: "../images/internal_button_dn.bmp"
        font.bold: false
        font.family: "DejaVu Sans"

        onButtonClick: {
            image1.source = da.getDataUrl();
        }
    }

    Text {
        id: text1
        x: 20
        y: 99
        text: "Enter Signature"
        font.pixelSize: 18
    }

    ImageButton {
        id: image_button2
        x: 110
        y: 348
        width: 64
        height: 40
        text: "Clear"
        imageUp: "../images/internal_button_up.bmp"
        font.pixelSize: 14
        textColor: "#000000"
        imageDown: "../images/internal_button_dn.bmp"
        font.bold: false
        font.family: "Arial"

        onButtonClick: {
            da.clearCanvas();
            image1.source = "";
        }
    }

    ImageButton {
        id: image_button3
        x: 192
        y: 348
        width: 64
        height: 40
        text: "Back"
        imageUp: "../images/internal_button_up.bmp"
        font.pixelSize: 14
        textColor: "#000000"
        imageDown: "../images/internal_button_dn.bmp"
        font.bold: false
        font.family: "Arial"

        onButtonClick: root.message("graphdemo/mainview.qml");
    }

}
