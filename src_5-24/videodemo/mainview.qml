import QtQuick 2.0
import QtMultimedia 5.0

Rectangle {
    width: 640
    height: 480
    color: "gray"

    Rectangle{
        id: rect
        width: 620
        height: 460
        anchors.centerIn: parent
        color: "black"

        Video{
            id: video
            source: "../video/video.mp4"
            width: 600
            height: 420
            x: 10
            y: -24
            muted: false
        }

    }


    Component.onCompleted: {
        video.play();
    }
}

