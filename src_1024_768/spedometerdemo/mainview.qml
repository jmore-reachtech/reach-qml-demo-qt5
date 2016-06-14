import QtQuick 2.0
import "../components"

Rectangle {
    id: root
    objectName: "root"
    width: 1024
    height: 768
    color: "#666666"

    signal message(string msg)

    Speedometer {
        id: spedo
        x: 362
        y: 292
        objectName: "spedo"
        width: 210
        height: 210
        needleImage: "../images/needle.png"
        overlayImageHeight: 105
        min: 0
        needleImageHeight: 63
        overlayImage: "../images/overlay.png"
        value: 0
        needleImageWidth: 8
        max: 120
        needleRotationY: 65
        needleRotationX: 5
        maxAngle: 133
        overlayY: 18
        overlayImageWidth: 148
        overlayX: 21
        needleY: 33
        needleX: 98
        backgroundImage: "../images/meterbackground.png"
    }

    VerticalSlider {
        id: slider___vertical1
        x: 622
        y: 298
        width: 48
        height: 184
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
        x: 622
        y: 525
        width: 48
        height: 48
        text: ""
        imageDown: "../images/quit_down.png"
        imageUp: "../images/quit_up.png"
        onButtonClick: mainView.mainLoader.source = "../mainmenu.qml";
    }


}
