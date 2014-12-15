import QtQuick 2.0
import QtMultimedia 5.0
import "../components"

Rectangle {
    id: root
    width: 800
    height: 480
    color: "gray"

    signal message(string msg)

    Rectangle{
        id: rect
        width: 640
        height: 460
        anchors.centerIn: parent
        color: "black"

        Video{
            id: video
            source: "video/video.mp4"
            width: 620
            height: 420
            x: 10
            y: -20
            muted: false

            onStopped:{
                btnPlay.visible = true;
                btnPause.visible = false;
            }
        }

    }

    ImageButton {
        id: btnPause
        x: 94
        y: 420
        width: 80
        height: 40
        text: "Pause"
        imageUp: "../images/internal_button_up.bmp"
        font.pixelSize: 18
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
        y: 420
        width: 80
        height: 40
        text: "Play"
        imageUp: "../images/internal_button_up.bmp"
        font.pixelSize: 18
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
        y: 420
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
			video.stop();
            onButtonClick: root.message("../src/mainmenu.qml");
        }
    }

    Component.onCompleted: {
        video.play();
    }
}

