import QtQuick 2.0
import "../components"

Rectangle {
    id: root
    objectName: "root"
    width: 1024
    height: 768
    color: "#eeeeee"
    property real angle: 0

    signal message(string msg)


    Timer {
        id: timer1
        interval: 120;
        running: false;
        repeat: true
        onTriggered: {
            wave.currentValue1 = getRandomInt(-10, 10);
        }
    }

    function getRandomInt (min, max) {
        return Math.floor(Math.random() * (max - min + 1)) + min;
    }

    ImageButton {
        id: image_button3
        x: 185
        y: 567
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


    ScopeChart{
        id: wave
        x: 170
        y: 202
        width: 684
        height: 304
        scaleLineColor : "rgba(0,0,0,1.0)"
        scaleLineWidth : 1
        scaleShowLabels : true
        scaleLabel : "<%=value%>"
        scaleFontFamily : "DejaVu Sans"
        scaleFontSize : 11
        scaleFontStyle : "normal"
        scaleFontColor : "#666"
        scaleShowGridLines : true
        scaleGridLineColor : "rgba(50,205,50,0.5)"
        scaleGridLineWidth : 1
        datasetStrokeWidth : 2
        bezierCurve: true
        scaleBgColor: "#000000"
        line1PenColor: "yellow"
        xPixels: 10
    }





    Component.onCompleted: {
        timer1.start();
    }
}
