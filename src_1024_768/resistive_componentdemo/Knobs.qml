import QtQuick 2.0
import "../components"

Rectangle {
    id: root
    objectName: "root"
    width: 1024
    height: 768
    color: "#666666"
    signal message(string msg)

    Text {
        id: txtTitle
        x: 0
        y: 89
        width: 1024
        height: 32
        text: qsTr("Dials")
        horizontalAlignment: Text.AlignHCenter
        font.bold: false
        font.pixelSize: 30
    }

    Knob {
        id: knob1
        x: 246
        y: 230
        width: 225
        height: 225
        initialIndex: 0
        font.pixelSize: 18

        onKnobValueChanged: {
            text_input1.text = knob1.knobValue.toFixed(1).toString();
            if (! typeof connection === 'undefined')
                connection.sendMessage("txt.value=" + text_input1.text);
        }
    }


    Knob {
        id: knob2
        x: 574
        y: 247
        width: 190
        height: 190
        hintBorderColor: "#000000"
        imageNeedleHeight: 150
        imageBase: "images/black_dial.png"
        showHint: false
        hintBorderWidth: 2
        hintFontFamily: "Arial"
        imageNeedle: "images/black_dial_needle.png"
        hintBackgroundColor: "#ffffff"
        hintFontColor: "#000000"
        hintFontPixelSize: 16
        remove: false
        initialIndex: 0
        mouseAreaWidth: 120
        mouseAreaHeight: 120
        textColor: "#ffffff"
        imageNeedleWidth: 150
        font.family: "Arial"
        imageBaseHeight: 150
        font.bold: false
        hintRadius: 9
        imageBaseWidth: 150
        hintWidth: 40
        add: false
        hintHeight: 40
        font.pixelSize: 18
        model: listModel

        ListModel{
            id: listModel
            ListElement{
                index: 0
                value: 0
            }
            ListElement{
                index: 1
                value: 1
            }
            ListElement{
                index: 2
                value: 2
            }
            ListElement{
                index: 3
                value: 3
            }
            ListElement{
                index: 4
                value: 4
            }
            ListElement{
                index: 5
                value: 5
            }
            ListElement{
                index: 6
                value: 6
            }
            ListElement{
                index: 7
                value: 7
            }
            ListElement{
                index: 8
                value: 8
            }
        }

        onKnobValueChanged: {
            text_input1.text = knob2.knobValue.toFixed(1).toString();
            if (! typeof connection === 'undefined')
                connection.sendMessage("txt.value=" + text_input1.text);
        }
    }


    LineEdit {
        id: text_input1
        x: 482
        y: 329
        width: 61
        height: 26
        text: qsTr("")
        font.pixelSize: 18
        radius: 2
    }


}
