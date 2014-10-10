import QtQuick 1.1
import "../components"

Rectangle {
    id: root
    objectName: "root"
    width: 480
    height: 272
    color: "#eeeeee"
    property real angle: 0

    signal message(string msg)


    Timer {
        id: timer1
        interval: 120;
        running: false;
        repeat: true
        onTriggered: {
            wave.inComingValue = getRandomInt(-10, 10);
            //wave.inComingValue = 10 * Math.sin(angle);
            //angle += 0.0628;
        }
    }

    function getRandomInt (min, max) {
        return Math.floor(Math.random() * (max - min + 1)) + min;
    }

    ImageButton {
        id: image_button3
        x: 84
        y: 234
        width: 60
        height: 30
        text: "Back"
        imageUp: "../images/internal_button_up.bmp"
        font.pixelSize: 12
        textColor: "#000000"
        imageDown: "../images/internal_button_dn.bmp"
        font.bold: false
        font.family: "Arial"

        onButtonClick: root.message("graphdemo/mainview.qml");
    }


    ScopeChart{
        id: wave
        x: 40
        y: 20
        width: 400
        height: 200
        scaleLineColor : "rgba(0,0,0,1.0)"
        scaleLineWidth : 1
        scaleShowLabels : true
        scaleLabel : "<%=value%>"
        scaleFontFamily : "DejaVu Sans"
        scaleFontSize : 10
        scaleFontStyle : "normal"
        scaleFontColor : "#666"
        scaleShowGridLines : true
        scaleGridLineColor : "rgba(50,205,50,0.5)"
        scaleGridLineWidth : 1
        datasetStrokeWidth : 2
        bezierCurve: true
        xPixels: 10
    }





    Component.onCompleted: {
        timer1.start();
    }
}
