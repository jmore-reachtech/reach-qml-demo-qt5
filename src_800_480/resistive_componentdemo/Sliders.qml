import QtQuick 2.0
import "../components"

Rectangle {
    width: 800
    height: 480
    color: "#666666"
    signal message(string msg)

    Text {
        id: txtTitle
        x: 80
        y: 76
        width: 640
        height: 25
        text: qsTr("Sliders")
        horizontalAlignment: Text.AlignHCenter
        font.bold: false
        font.pixelSize: 24
    }

    Rectangle{
        x: 133
        y: 293
        color: "transparent"
        width: 214
        height: 77

        MouseArea{
            anchors.fill: parent
        }

        HorizontalSlider {
            width: 184
            height: 48
            anchors.centerIn: parent
            hintBorderColor: "#000000"
            showHint: true
            maximum: 10
            hintBorderWidth: 2
            hintFontFamily: "Arial"
            hintBackgroundColor: "#ffffff"
            hintFontColor: "#000000"
            hintFontPixelSize: 16
            imageTrack: "images/slider_htrack.png"
            minimum: 0
            xMin: 0
            value: 0
            handleY: 0
            hintRadius: 9
            hintWidth: 40
            imageHandle: "images/slider_handle.png"
            allowDrag: true
            hintHeight: 40
        }
    }

    Rectangle{
        x: 126
        y: 166
        color: "transparent"
        width: 326
        height: 72

        MouseArea{
            anchors.fill: parent
        }

        HorizontalSlider {
            id: slider___horizontal1
            x: 20
            y: 16
            width: 288
            height: 29
            anchors.centerIn: parent
            hintBorderColor: "#000000"
            showHint: false
            maximum: 50
            hintBorderWidth: 2
            hintFontFamily: "Arial"
            hintBackgroundColor: "#ffffff"
            hintFontColor: "#000000"
            hintFontPixelSize: 16
            imageOverlay: "images/slider_fg.png"
            imageTrack: "images/slider_bg.png"
            minimum: 0
            xMin: 0
            xMax: 247
            value: 0
            handleY: -2
            hintRadius: 9
            hintWidth: 40
            imageHandle: "images/handle.png"
            allowDrag: true
            hintHeight: 40

            Text{
                id: sliderText
                text: parent.value.toFixed(0).toString()
                color: "#ffffff"
                font.bold: true
                font.pixelSize: 17
                anchors.bottom: parent.top;
                anchors.bottomMargin: 4
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

    }

    VerticalSlider {
        id: slider___vertical2
        x: 615
        y: 141
        width: 23
        height: 260
        hintBorderColor: "#000000"
        showHint: true
        maximum: 10
        hintBorderWidth: 0
        hintFontFamily: "Arial"
        hintFontColor: "#ffffff"
        hintFontPixelSize: 16
        hintFontBold: true
        hintBackgroundColor: "transparent"
        imageTrack: "images/vert_slider_fg.png"
        imageOverlay: "images/vert_slider_bg.png"
        minimum: 0
        value: 0
        handleX: -9
        hintRadius: 9
        yMin: 0
        hintWidth: 40
        imageHandle: "images/vert_handle.png"
        allowDrag: true
        hintHeight: 40
    }

    VerticalSlider {
        id: slider___vertical1
        x: 503
        y: 179
        width: 48
        height: 184
        hintBorderColor: "#000000"
        showHint: true
        maximum: 50
        hintBorderWidth: 2
        hintFontFamily: "Arial"
        hintBackgroundColor: "#ffffff"
        hintFontColor: "#000000"
        hintFontPixelSize: 16
        imageTrack: "images/slider_track.bmp"
        minimum: -2
        value: -2
        handleX: 0
        imageOverlay: ""
        hintRadius: 9
        yMin: 0
        hintWidth: 40
        imageHandle: "images/slider_handle.png"
        allowDrag: true
        hintHeight: 40
    }


}
