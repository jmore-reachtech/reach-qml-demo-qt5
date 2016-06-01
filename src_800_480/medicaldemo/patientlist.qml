import QtQuick 2.0
import "../components"

Item {
    id: root
    width: 800
    height: 480
    property string txtMinute: mainview.minute < 10 ? "0" + mainview.minute : mainview.minute
    property string txtHour: mainview.hour < 10 ? "0" + mainview.hour : mainview.hour

    Text {
        id: txtTime
        anchors.top: parent.top
        anchors.topMargin: 16
        x: 614
        color: "#ffffff"
        text: "01-05-2016  " + txtHour + ":"
        font.pixelSize: 19
        font.family: "Museo Sans Rounded 300"
    }

    Text {
        id: txtMin
        x: 750
        anchors.top: parent.top
        anchors.topMargin: 16
        color: "#ffffff"
        text: txtMinute
        font.pixelSize: 19
        font.family: "Museo Sans Rounded 300"
    }


    Flickable{
        id: flick
        width: 376
        height: 405
        clip: true
        flickableDirection: Flickable.VerticalFlick
        boundsBehavior: Flickable.StopAtBounds
        contentHeight: switchGroup.height
        contentWidth: switchGroup.width
        anchors.top: parent.top
        anchors.topMargin: 64
        anchors.left: parent.left
        anchors.leftMargin: 20

        onContentYChanged: {
            if (contentY == 0)
            {
                btnUp.visible = false;
                btnDown.visible = true;
            }
            else if (contentY == (contentHeight - height))
            {
                btnUp.visible = true;
                btnDown.visible = false;
            }
        }


        VerticalSwitchGroup {
            id: switchGroup
            spacing: 5
            font.pixelSize: 26
            font.bold: false
            font.family: "Museo Sans Rounded 300"
            textOffColor: "#ffffff"
            textOnColor: "#ffffff"
            //textHorizontalOffSet: 0

            model: ListModel{
                ListElement{
                    val: "0";
                    text_on: "Cotola, Stephen";
                    text_off: "Cotola, Stephen";
                    image_on: "../medicaldemo/images/patient_on.png";
                    image_off: "../medicaldemo/images/patient_off.png"
                    item_width: 376
                    item_height: 46
                }

                ListElement{
                    val: "1";
                    text_on: "Huffington, Sue";
                    text_off: "Huffington, Sue";
                    image_on: "../medicaldemo/images/patient_on.png";
                    image_off: "../medicaldemo/images/patient_off.png"
                    item_width: 376
                    item_height: 46
                }

                ListElement{
                    val: "2";
                    text_on: "Hearn, Jeff";
                    text_off: "Hearn, Jeff";
                    image_on: "../medicaldemo/images/patient_on.png";
                    image_off: "../medicaldemo/images/patient_off.png"
                    item_width: 376
                    item_height: 46
                }

                ListElement{
                    val: "3";
                    text_on: "Marsh, Jane";
                    text_off: "Marsh, Jane";
                    image_on: "../medicaldemo/images/patient_on.png";
                    image_off: "../medicaldemo/images/patient_off.png"
                    item_width: 376
                    item_height: 46
                }

                ListElement{
                    val: "4";
                    text_on: "Melvin, Ralph";
                    text_off: "Melvin, Ralph";
                    image_on: "../medicaldemo/images/patient_on.png";
                    image_off: "../medicaldemo/images/patient_off.png"
                    item_width: 376
                    item_height: 46
                }

                ListElement{
                    val: "5";
                    text_on: "Mason, Chris";
                    text_off: "Mason, Chris";
                    image_on: "../medicaldemo/images/patient_on.png";
                    image_off: "../medicaldemo/images/patient_off.png"
                    item_width: 376
                    item_height: 46
                }

                ListElement{
                    val: "6";
                    text_on: "Morehouse, Jonathan";
                    text_off: "Morehouse, Jonathan";
                    image_on: "../medicaldemo/images/patient_on.png";
                    image_off: "../medicaldemo/images/patient_off.png"
                    item_width: 376
                    item_height: 46
                }

                ListElement{
                    val: "7";
                    text_on: "Tonkin, Michael";
                    text_off: "Tonkin, Michael";
                    image_on: "../medicaldemo/images/patient_on.png";
                    image_off: "../medicaldemo/images/patient_off.png"
                    item_width: 376
                    item_height: 46
                }

                ListElement{
                    val: "8";
                    text_on: "Tyler, Matthew";
                    text_off: "Tyler, Matthew";
                    image_on: "../medicaldemo/images/patient_on.png";
                    image_off: "../medicaldemo/images/patient_off.png"
                    item_width: 376
                    item_height: 46
                }


            }

            onValueChanged:{
                mainview.initialValue = value;
                mainview.patientName = switchGroup.model.get(switchGroup.value).text_on;
            }
        }

    }

    ImageButton {
        id: imgDetail
        anchors.top : flick.top
        anchors.left: flick.right
        anchors.leftMargin: 7
        width: 376
        height: 30
        text: switchGroup.model.get(switchGroup.value).text_on
        font.family: "Museo Sans Rounded 300"
        font.pixelSize: 20
        imageUp: "images/patient_box.png"
        font.bold: false
        textColor: "#ffffff"
        imageDown: "images/patient_box_down.png"

        onButtonClick: {
            load.source = "patientgraphs.qml";
        }
    }

    Image {
        id: imgHeartRate
        anchors.top: imgDetail.bottom
        anchors.topMargin: 9
        anchors.left: flick.right
        anchors.leftMargin: 8
        width: 376
        height: 116
        source: "images/heart_rate_box.png"

        Text {
            id: txtHeartRate
            x: 179
            color: "#ffffff"
            font.family: "Museo Sans Rounded 900"
            text: qsTr("65")
            font.bold: true
            font.pixelSize: 46
            anchors.verticalCenter: parent.verticalCenter

            Timer{
                id: heartTimer
                interval: 1100;
                running: true;
                repeat: true
                onTriggered: {
                    txtHeartRate.text = getRandomInt(60, 100);
                    if (parseInt(txtHeartRate.text) > 99)
                    {
                        imgHeartRateBad.visible = true;
                        txtBPM.x = 265;
                    }
                    else
                    {
                        imgHeartRateBad.visible = false;
                        txtBPM.x = 240;
                    }
                }
            }
        }

        Text{
            id: txtBPM
            x: 240
            color: "#ffffff"
            font.family: "Museo Sans Rounded 900"
            text: qsTr("bpm")
            font.bold: true
            font.pixelSize: 46
            anchors.verticalCenter: parent.verticalCenter
        }

        Image{
            id: imgHeartRateBad
            x: 14
            y: 11
            visible: false
            source: "images/heartbeat_bad.png"
        }

    }



    Image {
        id: imgO2Rate
        anchors.top: imgHeartRate.bottom
        anchors.topMargin: 9
        anchors.left: flick.right
        anchors.leftMargin: 8
        width: 376
        height: 116
        source: "images/o2_rate_box.png"

        Text {
            id: txt02Rate
            x: 179
            color: "#ffffff"
            font.family: "Museo Sans Rounded 900"
            text: qsTr("98")
            font.bold: true
            font.pixelSize: 46
            anchors.verticalCenter: parent.verticalCenter            

            Timer{
                id: oTimer
                interval: 1200;
                running: true;
                repeat: true
                onTriggered: {
                    txt02Rate.text = getRandomInt(89, 99);
                    if (parseInt(txt02Rate.text) < 90)
                        imgO2RateBad.visible = true;
                    else
                        imgO2RateBad.visible = false;
                }
            }
        }

        Text{
            id: txtPercentage
            x: 239
            color: "#ffffff"
            font.family: "Museo Sans Rounded 900"
            text: qsTr("%")
            font.bold: true
            font.pixelSize: 46
            anchors.verticalCenter: parent.verticalCenter
        }

        Image{
            id: imgO2RateBad
            x: 14
            y: 11
            source: "images/oxygen_bad.png"
            visible: false
        }
    }


    Image {
        id: imgTemp
        anchors.top: imgO2Rate.bottom
        anchors.topMargin: 9
        anchors.left: flick.right
        anchors.leftMargin: 8
        width: 376
        height: 116
        source: "images/temp_box.png"

        Text {
            id: txtTemp
            x: 179
            color: "#ffffff"
            font.family: "Museo Sans Rounded 900"
            text: qsTr("98.5")
            font.bold: true
            font.pixelSize: 46
            anchors.verticalCenter: parent.verticalCenter

            Timer{
                id: tempTimer
                interval: 1000;
                running: true;
                repeat: true
                onTriggered: {
                    var temp = getRandomInt(98, 100);
                    txtTemp.text = temp + "." + getRandomInt(0, 9);
                    if (temp > 99)
                    {
                        imgTempBad.visible = true;
                        imgFarenheit.x = 311;
                    }
                    else
                    {
                        imgTempBad.visible = false;
                        imgFarenheit.x = 284;
                    }
                }
            }
        }

        Image{
            id: imgFarenheit
            x: 284
            y: 40
            source: "images/farenheit.png"
        }

        Image{
            id: imgTempBad
            x: 14
            y: 11
            source: "images/temperature_bad.png"
            visible: false
        }
    }

    ImageButton {
        id: btnDown
        x: 357
        y: 428
        width: 30
        height: 30
        text: ""
        textColor: "#000000"
        imageDown: "images/down_arrow.png"
        font.family: "DejaVu Sans"
        font.pixelSize: 18
        imageUp: "images/down_arrow.png"
        font.bold: false

        onButtonClick: {
            flick.contentY = flick.contentHeight - flick.height;
            btnDown.visible = false;
            btnUp.visible = true;
        }
    }

    ImageButton {
        id: btnUp
        x: 357
        y: 71
        width: 30
        height: 30
        text: ""
        textColor: "#000000"
        imageDown: "images/up_arrow.png"
        font.family: "DejaVu Sans"
        font.pixelSize: 18
        imageUp: "images/up_arrow.png"
        font.bold: false
        visible: false

        onButtonClick: {
            flick.contentY = 0;
            btnDown.visible = true;
            btnUp.visible = false;
        }
    }

    function getRandomInt(min, max) {
        return Math.floor(Math.random() * (max - min + 1)) + min;
    }

    Component.onCompleted: {
        switchGroup.initialValue = mainview.initialValue;
        mainview.patientName = switchGroup.model.get(switchGroup.value).text_on;
    }

}
