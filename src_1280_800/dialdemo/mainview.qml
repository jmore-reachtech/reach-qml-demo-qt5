import QtQuick 2.0
import "../components"

Rectangle {
    id: rootDial
    width: 1280
    height: 800
    color: "#666666"
    signal message(string msg)

    LineEdit {
        id: text_input1
        x: 616
        y: 347
        width: 82
        height: 33
        text: qsTr("")
        fontPixelSize: 22
        font.pointSize: 12
        radius: 2
    }

    Knob {
        id: knob1
        x: 414
        y: 139
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
        x: 437
        y: 381
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
        x: 933
        y: 419
        width: 58
        height: 58
        text: ""

        imageDown: "../images/next_down.png"
        imageUp: "../images/next_up.png"


        onButtonClick: {
            rootDial.message("dialdemo/largedemo.qml");
        }
    }

    ImageButton {
        id: quitButton
        x: 933
        y: 490
        width: 58
        height: 58
        text: ""
        imageDown: "../images/quit_down.png"
        imageUp: "../images/quit_up.png"
        onButtonClick: rootDial.message("../src/mainmenu.qml");
    }

    GeometricKnob {
        id: dial2
        x: 668
        y: 139
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
        x: 668
        y: 359
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
