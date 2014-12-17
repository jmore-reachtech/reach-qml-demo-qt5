import QtQuick 2.0
import "../components"

Rectangle {
    id: rootDial
    width: 800
    height: 480
    color: "#666666"
    signal message(string msg)

    LineEdit {
        id: text_input1
        x: 359
        y: 224
        width: 82
        height: 33
        text: qsTr("")
        fontPixelSize: 22
        font.pointSize: 12
        radius: 2
    }

    Knob {
        id: knob1
        x: 157
        y: 16
        width: 225
        height: 225
        initialIndex: 0

        onKnobValueChanged: {
            text_input1.text = knob1.knobValue.toFixed(1).toString();
            if (! typeof connection === 'undefined')
                connection.sendMessage("txt.value=" + text_input1.text);
        }
    }

    Knob {
        id: knob2
        x: 180
        y: 258
        initialIndex: 0
        model: listModel3

        ListModel{
            id: listModel3
            ListElement{
                index: 0
                value: -3
            }
            ListElement{
                index: 1
                value: -2
            }
            ListElement{
                index: 2
                value: -1
            }
            ListElement{
                index: 3
                value: 0
            }
            ListElement{
                index: 4
                value: 1
            }
            ListElement{
                index: 5
                value: 2
            }
            ListElement{
                index: 6
                value: 3
            }
        }

        onKnobValueChanged: {
            text_input1.text = knob2.knobValue.toFixed(1).toString();
            if (! typeof connection === 'undefined')
                connection.sendMessage("txt.value=" + text_input1.text);
        }
    }

    ImageButton{
        id:nextButton
        x: 676
        y: 307
        width: 48
        height: 48
        text: ""

        imageDown: "../images/next_down.png"
        imageUp: "../images/next_up.png"


        onButtonClick: {
            rootDial.message("dialdemo/largedemo.qml");
        }
    }

    ImageButton {
        id: quitButton
        x: 676
        y: 372
        width: 48
        height: 48
        text: ""
        imageDown: "../images/quit_down.png"
        imageUp: "../images/quit_up.png"
        onButtonClick: rootDial.message("../src/mainmenu.qml");
    }

    GeometricKnob {
        id: dial2
        x: 411
        y: 16
        model: listModel2

        ListModel{
            id: listModel2
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
            ListElement{
                index: 9
                value: 9
            }
            ListElement{
                index: 10
                value: 10
            }

        }

        onValueChanged: {
            text_input1.text = dial2.value.toFixed(1).toString();
            if (! typeof connection === 'undefined')
                connection.sendMessage("txt.value=" + text_input1.text);
        }

    }


    GeometricKnob {
        id: dial1
        x: 411
        y: 236
        outerCircleColor: "#aa9b38"
        needleColor: "#084a95"
        innerCircleRadius: outerCircleRadius-30

        model: listModel1

        ListModel{
            id: listModel1
            ListElement{
                index: 0
                value: -3
            }
            ListElement{
                index: 1
                value: -2
            }
            ListElement{
                index: 2
                value: -1
            }
            ListElement{
                index: 3
                value: 1
            }
            ListElement{
                index: 4
                value: 2
            }
            ListElement{
                index: 5
                value: 3
            }
        }

        onValueChanged: {
            text_input1.text = dial1.value.toFixed(1).toString();
            if (! typeof connection === 'undefined')
                connection.sendMessage("txt.value=" + text_input1.text);
        }

    }
}
