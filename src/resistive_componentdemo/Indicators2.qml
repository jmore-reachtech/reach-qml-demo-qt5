import QtQuick 2.0
import "../components"

Rectangle {
    id: indicator2
    objectName: "indicator2"
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


    LEDLight {
        id: led_light1
        x: 112
        y: 170
        width: 58
        height: 58
        on: false
        font.pixelSize: 13
        textColor: "#000000"
        textPosition: "bottom"
        label: "  Temp\nWarning"
        fieldSpacing: 4
        font.bold: true
        font.family: "Arial"
        imageOff: "images/ledoff.png"
        imageOn: "images/ledon.png"
    }

    PanelReadOut {
        id: panel_read_out1
        x: 237
        y: 179
        width: 116
        height: 76
        text: ""
        font.pixelSize: 22
        textColor: "#50dd0e"
        imagePanel: "images/bezel.bmp"
        font.bold: false
        font.family: "Arial"
    }

    Image {
        id: image1
        x: 70
        y: 40
        width: 340
        height: 124
        source: "images/therm_horizbase.png"

        HorizontalLevelIndicator {
            id: horizontal1
            x: 72
            y: 59
            width: 240
            height: 24
            minValue: -30
            hintFontPixelSize: 14
            imageBase: "images/therm_horiz.png"
            hintFontColor: "#000000"
            value: -3
            showHint: false
            imageOverlay: "images/therm_horiz_overlay.png"
            maxValue: 50
            increment: 3
            startPosition: "left"
            hintFontFamily: "Arial"

            onValueChanged: {
                if(value * scale < 20)
                {
                    led_light1.on = true;
                }
                else
                {
                    led_light1.on = false;
                }

                panel_read_out1.text = (value * scale).toFixed(1).toString() + symbol;
            }
        }
    }


    function getRandomInt(min, max) {
      return Math.floor(Math.random() * (max - min + 1)) + min;
    }

    Component.onCompleted: {
        var src = "import QtQuick 2.0; Timer {id: timer1; interval: 1000; running: true; repeat: true; onTriggered:{horizontal1.value = getRandomInt(horizontal1.minValue, horizontal1.maxValue-2); } }";
        var timer = Qt.createQmlObject(src, indicator2, "timerObject");

    }
}

