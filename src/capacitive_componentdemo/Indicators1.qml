import QtQuick 1.1
import "../components"

Rectangle {
    id: indicator1
    objectName: "indicator1"
    width: 480
    height: 272

    signal message(string msg)

    gradient: Gradient {
        GradientStop {position: 0.0; color: "#666666"}
        GradientStop {position: 1.0; color: "#EEEEEE"}
    }

    Text {
        id: txtTitle
        x: 0
        y: 8
        width: 480
        height: 25
        text: qsTr("Indicators")
        horizontalAlignment: Text.AlignHCenter
        font.bold: false
        font.pixelSize: 21
    }

    HorizontalLevelIndicator {
        id: horizontal1
        x: 250
        y: 53
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
        x: 182
        y: 59
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
        x: 23
        y: 36
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
        x: 265
        y: 79
        timerDuration: 1000
        imageExtension: ".png"
        property int totalImages: 10
    }

    function getRandomInt(min, max) {
      return Math.floor(Math.random() * (max - min + 1)) + min;
    }

    Component.onCompleted: {
        var src = "import QtQuick 1.1; Timer {id: timer1; interval: 200; running: true; repeat: true; onTriggered:{horizontal1.value += 1; if (horizontal1.value === horizontal1.maxValue) horizontal1.value = 0; vertical1.value = Math.floor(Math.random()*(vertical1.maxValue+1)); vertical2.value = getRandomInt(40, vertical2.maxValue); } }";
        var timer = Qt.createQmlObject(src, indicator1, "timerObject");
    }
}
