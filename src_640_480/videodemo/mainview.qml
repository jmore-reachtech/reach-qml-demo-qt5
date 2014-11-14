import QtQuick 2.0
import QtMultimedia 5.0
import "../components"

Rectangle {
    id: root
    width: 640
    height: 480
    color: "gray"

    signal message(string msg)

    Rectangle{
        id: rect
        width: 512
        height: 384
        anchors.centerIn: parent
        color: "black"

        Video{
            id: video
            source: "video/video.mp4"
            width: 500
            height: 372
            muted: false
            anchors.centerIn: parent
            anchors.verticalCenterOffset: - 40

            onStopped:{
                btnPlay.visible = true;
                btnPause.visible = false;
            }
        }

    }

    ImageButton {
        id: btnPause
        x: 94
        y: 370
        width: 77
        height: 40
        text: "Pause"
        imageUp: "../images/internal_button_up.bmp"
        font.pixelSize: 16
        textColor: "#000000"
        imageDown: "../images/internal_button_dn.bmp"
        font.bold: false
        font.family: "DejaVu Sans"

        onButtonClick: {
            video.pause();
            btnPlay.visible = true;
            btnPause.visible = false;
        }
    }

    ImageButton {
        id: btnPlay
        visible: false
        x: 94
        y: 370
        width: 77
        height: 40
        text: "Play"
        imageUp: "../images/internal_button_up.bmp"
        font.pixelSize: 16
        textColor: "#000000"
        imageDown: "../images/internal_button_dn.bmp"
        font.bold: false
        font.family: "DejaVu Sans"

        onButtonClick: {
            video.play();
            btnPlay.visible = false;
            btnPause.visible = true;
        }
    }

    ImageButton {
        id: image_button2
        x: 202
        y: 370
        width: 77
        height: 40
        text: "Back"
        imageUp: "../images/internal_button_up.bmp"
        font.pixelSize: 16
        textColor: "#000000"
        imageDown: "../images/internal_button_dn.bmp"
        font.bold: false
        font.family: "DejaVu Sans"

        onButtonClick: {
            onButtonClick: root.message("../src/mainmenu.qml");
        }
    }

    Component.onCompleted: {
        video.play();
    }
}

