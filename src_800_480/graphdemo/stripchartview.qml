import QtQuick 2.0
import "../components"

Rectangle {
    id: root
    objectName: "root"
    width: 800
    height: 480
    color: "#eeeeee"

    signal message(string msg)

    HorizontalSlider {
        id: slider
        x: 262
        y: 348
        width: 362
        height: 46
        hintBorderColor: "#000000"
        showHint: true
        maximum: 10
        hintBorderWidth: 2
        hintFontFamily: "Arial"
        hintBackgroundColor: "#ffffff"
        hintFontColor: "#000000"
        hintFontPixelSize: 16
        imageTrack: "../images/slider_htrack.png"
        minimum: -10
        xMin: 0
        value: 0
        handleY: 2
        imageOverlay: ""
        hintRadius: 9
        hintWidth: 40
        imageHandle: "../images/slider_handle.png"
        allowDrag: true
        hintHeight: 40
    }

    Timer {
        id: timer1
        interval: 30;
        running: false;
        repeat: true
        onTriggered: wave.currentValue1 = slider.value;
    }


    ImageButton {
        id: image_button3
        x: 134
        y: 344
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

    StripChart {
        id: wave
        x: 121
        y: 90
        width: 558
        height: 236
        scaleShowGridLines: true
        line1PenColor: "#ffffff"
        datasetStrokeWidth: 2
        bgColor: "#EEEEEE"
        scaleLineWidth: 1
        scaleBgColor: "#000000"
        scaleFontStyle: "normal"
        scaleLabel: "<%=value%>"
        maxTime: 100
        scaleLineColor: "rgba(0,0,0,1.0)"
        maxYValue: 10
        scaleFontFamily: "DejaVu Sans"
        scaleShowLabels: true
        scaleFontColor: "#666"
        minTime: 0
        minYValue: -10
        scaleGridLineColor: "rgba(50,205,50,0.5)"
        scaleFontSize: 11
        scaleGridLineWidth: 1
        verticalScaleLines: 10
    }


    Component.onCompleted: {
        timer1.start();
    }
}
