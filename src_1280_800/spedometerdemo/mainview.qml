import QtQuick 2.0
import "../components"

Rectangle {
    id: root
    objectName: "root"
    width: 1280
    height: 800
    color: "#666666"

    signal message(string msg)

    Speedometer {
        id: spedo
        x: 414
        y: 250
        visible: true
        objectName: "spedo"
        width: 300
        height: 300
        needleImage: "../images/needle.png"
        overlayImageHeight: 150
        min: 0
        needleImageHeight: 90
        overlayImage: "../images/overlay.png"
        value: 0
        needleImageWidth: 11
        max: 120
        needleRotationX: 6
        needleRotationY: 87
        maxAngle: 135
        minAngle: -130
        overlayImageWidth: 211
        overlayX: 30
        overlayY: 24
        needleX: 140
        needleY: 51
        backgroundImage: "../images/meterbackground.png"
    }

    VerticalSlider {
        id: slider___vertical1
        x: 747
        y: 269
        width: 48
        height: 240
        imageHandle: "../images/slider_handle.png"
        allowDrag: true
        yMin: 0
        value: 0
        maximum: 120
        imageTrack: "../images/slider_track.bmp"
        minimum: 0
        handleX: 0

        onValueChanged: spedo.value = value;
    }

    ImageButton {
        id: quitButton
        x: 611
        y: 572
        width: 58
        height: 58
        text: ""
        imageDown: "../images/quit_down.png"
        imageUp: "../images/quit_up.png"
        onButtonClick: root.message("../src/mainmenu.qml");
    }


}
