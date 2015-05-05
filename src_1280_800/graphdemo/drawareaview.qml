import QtQuick 2.0
import "../components"

Rectangle {
    id: root
    objectName: "root"
    width: 1280
    height: 800
    color: "#eeeeee"

    signal message(string msg)

    DrawArea{
        id: da
        x: 232
        y: 177
        width: 817
        height: 147
        color: "white"
    }

    Image {
        id: image1
        x: 232
        y: 374
        width: 817
        height: 147
    }


    ImageButton {
        id: image_button1
        x: 234
        y: 573
        width: 70
        height: 40
        text: "Copy"
        imageUp: "../images/internal_button_up.bmp"
        font.pixelSize: 14
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
        x: 232
        y: 138
        text: "Enter Signature"
        font.pixelSize: 20
    }

    ImageButton {
        id: image_button2
        x: 318
        y: 573
        width: 70
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
        x: 401
        y: 573
        width: 70
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
