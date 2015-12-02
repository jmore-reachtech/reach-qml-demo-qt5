import QtQuick 2.0
import "../components"

Rectangle {
    id: root
    objectName: "root"
    width: 1280
    height: 800
    color: "#666666"
    property real angle: 0

    signal message(string msg)


    Timer {
        id: timer1
        interval: 60;
        running: false;
        repeat: true
        onTriggered: {
            wave.currentValue1 = getRandomInt(-10, -1);
            wave.currentValue2 = getRandomInt(0, 10);
        }
    }

    function getRandomInt (min, max) {
        return Math.floor(Math.random() * (max - min + 1)) + min;
    }

    ImageButton {
        id: image_button3
        x: 274
        y: 602
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


    ScopeChart{
        id: wave
        x: 274
        y: 136
        width: 732
        height: 411
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
        line2PenColor: "red"
        xPixels: 10
    }





    Component.onCompleted: {
        timer1.start();
    }
}
