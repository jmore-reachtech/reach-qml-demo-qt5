import QtQuick 2.0
import "../components"

Rectangle {
    id: root
    objectName: "root"
    width: 640
    height: 480
    color: "#eeeeee"

    signal message(string msg)

    DrawArea{
        id: da
        x: 22
        y: 77
        width: 597
        height: 92
        color: "white"
    }

    Image {
        id: image1
        x: 22
        y: 175
        width: 597
        height: 119
    }


    ImageButton {
        id: image_button1
        x: 20
        y: 300
        width: 60
        height: 31
        text: "Copy"
        imageUp: "../images/internal_button_up.bmp"
        font.pixelSize: 12
        textColor: "#000000"
        imageDown: "../images/internal_button_dn.bmp"
        font.bold: false
        font.family: "Arial"

        onButtonClick: {
            image1.source = da.getDataUrl();
        }
    }

    Text {
        id: text1
        x: 22
        y: 51
        text: "Enter Signature"
        font.pixelSize: 14
    }

    ImageButton {
        id: image_button2
        x: 100
        y: 300
        width: 60
        height: 31
        text: "Clear"
        imageUp: "../images/internal_button_up.bmp"
        font.pixelSize: 12
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
        x: 187
        y: 300
        width: 60
        height: 31
        text: "Back"
        imageUp: "../images/internal_button_up.bmp"
        font.pixelSize: 12
        textColor: "#000000"
        imageDown: "../images/internal_button_dn.bmp"
        font.bold: false
        font.family: "Arial"

        onButtonClick: root.message("graphdemo/mainview.qml");
    }

}
