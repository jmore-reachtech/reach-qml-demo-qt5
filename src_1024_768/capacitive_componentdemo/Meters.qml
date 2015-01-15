import QtQuick 2.0
import "../components"

Rectangle {
    id: root
    objectName: "root"
    width: 1024
    height: 768
    signal message(string msg)

    Image{
        source: "images/meterdemobgd.png"
        anchors.fill: parent

        Text {
            id: txtTitle
            x: 0
            y: 89
            width: 1024
            height: 32
            text: qsTr("Meters")
            horizontalAlignment: Text.AlignHCenter
            font.bold: false
            font.pixelSize: 30
        }

        Speedometer {
            id: spedometer2
            x: 543
            y: 207
            width: 215
            height: 217
            minAngle: -112
            needleImage: "images/needle.png"
            overlayImageHeight: 40
            min: 0
            needleImageHeight: 79
            overlayImage: "images/speedometer_overlay.png"
            value: 0
            needleImageWidth: 8
            max: 80
            needleRotationY: 76
            needleRotationX: 5
            maxAngle: 113
            overlayY: 80
            overlayImageWidth: 40
            overlayX: 95
            needleY: 24
            needleX: 110
            backgroundImage: "images/rpm_base.png"
        }


        Speedometer {
            id: spedometer1
            x: 249
            y: 193
            width: 244
            height: 245
            minAngle: -126
            smooth: false
            needleImage: "images/needle.png"
            overlayImageHeight: 46
            min: 0
            needleImageHeight: 88
            overlayImage: "images/speedometer_overlay.png"
            value: 0
            needleImageWidth: 8
            max: 180
            needleRotationY: 86
            needleRotationX: 4
            maxAngle: 126
            overlayY: 91
            overlayImageWidth: 47
            overlayX: 104
            needleY: 28
            needleX: 122
            backgroundImage: "images/speedometer_base.png"

            onValueChanged: text1.text = value.toFixed(0).toString();
            Text {
                id: text1
                x: 100
                y: 158
                width: 54
                height: 19
                color: "#12cf19"
                text: qsTr("0")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 16
            }

        }
    }

    HorizontalSlider {
        id: slider___horizontal1
        x: 356
        y: 489
        width: 358
        height: 36
        xMax: 310
        hintBorderColor: "#000000"
        showHint: false
        maximum: 180
        hintBorderWidth: 2
        hintFontFamily: "Arial"
        hintBackgroundColor: "#ffffff"
        hintFontColor: "#000000"
        hintFontPixelSize: 16
        imageTrack: "images/slider_bg.png"
        minimum: 0
        imageOverlay: "images/slider_fg.png"
        xMin: 0
        value: 0
        handleY: 0
        hintRadius: 9
        hintWidth: 40
        imageHandle: "images/handle.png"
        allowDrag: true
        hintHeight: 40

        onValueChanged: {
            spedometer1.value = value;
            spedometer2.value = 38.23 * spedometer1.value / 100.0;
        }
    }


}




