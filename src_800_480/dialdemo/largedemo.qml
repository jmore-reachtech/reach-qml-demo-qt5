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
        x: 346
        y: 97
        width: 108
        height: 26
        text: qsTr("")
        font.pixelSize: 18
        radius: 2
    }

    Knob {
        id: knob1
        x: 230
        y: 129
        width: 234
        height: 222
        anchors.verticalCenterOffset: 15
        anchors.horizontalCenterOffset: 0
        anchors.centerIn: parent
        imageBase: "../images/dialbase_large.svg"
        imageNeedle: "../images/dialneedle_large.png"
        model: listModel3

        ListModel{
            id: listModel3
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
        }

        onKnobValueChanged: {
            text_input1.text = knob1.knobValue.toFixed(1).toString();
            if (! typeof connection === 'undefined')
                connection.sendMessage("txt.value=" + text_input1.text);
        }
    }

    ImageButton {
        id: textbutton1
        x: 551
        y: 62
        width: 48
        height: 48
        text: ""
        imageUp: "../images/plus.png"
        imageDown: "../images/plus_down.png"

        onButtonClick:{
            var i = listModel3.count;
            knob1.add = true;
            listModel3.append({"index": i, "value": i});
            text_input1.text = "";
        }
    }

    ImageButton {
        id: textbutton2
        x: 551
        y: 125
        width: 48
        height: 48
        text: ""
        imageDown: "../images/minus_down.png"
        imageUp: "../images/minus.png"

        onButtonClick:{
            knob1.remove = true;
            var i = listModel3.count;
            listModel3.remove(i-1);
            text_input1.text = "";
        }
    }

    ImageButton {
        id: imagebutton1
        x: 44
        y: 216
        width:48
        height:48
        text: ""
        imageDown: "../images/prev_down.png"
        imageUp: "../images/prev_up.png"
        onButtonClick : rootDial.message("dialdemo/mainview.qml");
    }

}

