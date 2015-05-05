import QtQuick 2.0
import "../components"

Rectangle {
    id: indicator1
    objectName: "indicator1"
    width: 1280
    height: 800
    color: "#666666"

    signal message(string msg)

    Text {
        id: txtTitle
        x: 0
        y: 89
        width: 1280
        height: 32
        text: qsTr("Indicators")
        horizontalAlignment: Text.AlignHCenter
        font.bold: false
        font.pixelSize: 30
    }

    HorizontalLevelIndicator {
        id: horizontal1
        x: 704
        y: 261
        width: 200
        height: 20
        hintFontBold: true
        hintFontPointSize: 10
        minValue: 0
        hintFontPixelSize: 14
        imageBase: "images/tank.png"
        hintFontColor: "#ffffff"
        value: 0
        showHint: true
        imageOverlay: "images/tank_overlay.png"
        maxValue: 50
        increment: 4
        startPosition: "left"
        hintFontFamily: "Arial"

        onValueChanged: {
            if (value > 24)
                hintFontColor = "#000000"
            else
                hintFontColor = "#ffffff"
        }
    }

    Image{
        x: 547
        y: 270
        source: "images/level_base.png"
        VerticalLevelIndicator {
            id: vertical1
            x: 6
            y: 9
            width: 28
            height: 161
            hintFontBold: true
            minValue: 0
            hintFontPixelSize: 15
            imageBase: "images/level.png"
            hintFontColor: "#000000"
            value: 3
            showHint: true
            imageOverlay: "images/level_overlay.png"
            maxValue: 18
            increment: 9
            startPosition: "bottom"
            hintFontFamily: "Arial"

            onValueChanged: {
                if (value > 8)
                    hintFontColor = "#ffffff";
                else
                    hintFontColor = "#000000";
            }
        }

    }

    Image{
        x: 300
        y: 261
        source: "images/battery_base.png"

        VerticalLevelIndicator {
            id: vertical2
            x: 4
            y: 32
            width: 128
            height: 149
            hintFontBold: true
            minValue: 0
            hintFontPixelSize: 24
            valueScale: 2.0
            symbol: "%"
            imageBase: "images/battery_full.png"
            hintFontColor: "#000000"
            value: 0
            showHint: true
            imageOverlay: "images/battery_empty.png"
            maxValue: 50
            increment: 3
            startPosition: "bottom"
            hintFontFamily: "Arial"
        }
    }

    ImageSequencer{
        x: 726
        y: 344
        width: 169
        timerDuration: 1000
        imageExtension: ".png"
        property int totalImages: 10
    }

    function getRandomInt(min, max) {
      return Math.floor(Math.random() * (max - min + 1)) + min;
    }

    Component.onCompleted: {
        var src = "import QtQuick 2.0; Timer {id: timer1; interval: 200; running: true; repeat: true; onTriggered:{horizontal1.value += 1; if (horizontal1.value === horizontal1.maxValue) horizontal1.value = 0; vertical1.value = Math.floor(Math.random()*(vertical1.maxValue+1)); vertical2.value = getRandomInt(40, vertical2.maxValue); } }";
        var timer = Qt.createQmlObject(src, indicator1, "timerObject");
    }
}
