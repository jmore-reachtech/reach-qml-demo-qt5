import QtQuick 2.0
import "../components"

Rectangle {
    id: root
    objectName: "root"
    width: 1280
    height: 800
    color: "#666666"

    signal message(string msg)

    HorizontalSlider {
        id: slider
        x: 351
        y: 539
        width: 622
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
        x: 351
        y: 625
        width: 70
        height: 40
        text: "Back"
        imageUp: "../images/blue_button_up.png"
        font.pixelSize: 16
        textColor: "#ffffff"
        imageDown: "../images/blue_button_dn.png"
        font.bold: false
        font.family: "Arial"

        onButtonClick: root.message("graphdemo/mainview.qml");
    }

    StripChart {
        id: wave
        x: 298
        y: 124
        width: 684
        height: 368
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
        scaleFontSize: 13
        scaleGridLineWidth: 1
        verticalGridLines: 10
    }


    Component.onCompleted: {
        timer1.start();
    }
}
