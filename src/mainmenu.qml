import QtQuick 2.0
import "components"

Rectangle {
    width: 640
    height: 480
    id: root
    objectName: "root"
    color: "#2D2D2D"
    signal message(string msg)

    ListModel {
        id: listModel

        ListElement {
            image: "images/coffee-icon.png"; iconheight:76; iconwidth: 100; form: "capacitive_coffeedemo/mainview.qml"; icontext: "  Capacitive\nCoffee Demo"
        }
        ListElement {
            image: "images/coffee-icon.png"; iconheight:76; iconwidth: 100; form: "resistive_coffeedemo/mainview.qml"; icontext: "   Resistive\nCoffee Demo"
        }
        ListElement {
            image: "images/dial-icon.png"; iconheight:76; iconwidth: 76; form: "dialdemo/mainview.qml"; icontext: "Dial Demo"
        }
        ListElement {
            image: "images/vumeter-icon.png"; iconheight:74; iconwidth: 110; form: "vumeterdemo/mainview.qml"; icontext: "VU Meter Demo"
        }
        ListElement {
            image: "images/samegame-icon.png"; iconheight:74; iconwidth: 110; form: "samegame/mainview.qml"; icontext: "Same Game"
        }
        ListElement {
            image: "images/spedometer-icon.png"; iconheight:78; iconwidth: 78; form: "spedometerdemo/mainview.qml"; icontext: "Spedometer Demo"
        }
        ListElement {
            image: "images/reach-icon.png"; iconheight:76; iconwidth: 76; form: "capacitive_componentdemo/mainview.qml"; icontext: "     Capacitive\nComponent Demo"
        }
        ListElement {
            image: "images/reach-icon.png"; iconheight:76; iconwidth: 76; form: "resistive_componentdemo/mainview.qml"; icontext: "      Resistive\nComponent Demo"
        }
        ListElement {
            image: "images/graph-icon.png"; iconheight:64; iconwidth: 76; form: "graphdemo/mainview.qml"; icontext: "Graph Demo"
        }
        ListElement {
            image: "images/system-icon.png"; iconheight:64; iconwidth: 76; form: "systemdemo/mainview.qml"; icontext: "System Plugin\n      Demo"
        }
        ListElement {
            image: "images/video-icon.png"; iconheight:77; iconwidth: 76; form: "videodemo/mainview.qml"; icontext: "Video Demo"
        }
        ListElement {
            image: "images/upgrade-icon.png"; iconheight:72; iconwidth: 77; form: "videodemo/mainview.qml"; icontext: "Upgrade Demo"
        }
    }

    GridView{
        id: menu
		x: 2
		y: 2
        property int rows: Math.ceil(menu.count/6)
        property int page: 1
        model: listModel
        currentIndex: -1 // default - no focus
        width: 600
        height: 460
        delegate: appDelegate
        cellWidth: 300; cellHeight: 160
        clip: true
        focus: true
        snapMode: GridView.SnapToRow
        onFlickEnded: {
            if (menu.atYBeginning)
                page = 1;
            else if (menu.atYEnd)
                page = rows;


        }

        Component {
            id: appDelegate

            Item {
                width: 300; height: 160 // controls the size
                Rectangle
                {
                    id: recIcon
                    width: 136
                    height: 112
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenterOffset: index % 2 == 0 ? 40: -40
                    color: "transparent"
                    Image {
                        id: imgIcon
                        width: iconwidth; height: iconheight
                        source: image
                        smooth: true
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top : parent.top
                        anchors.topMargin: 6
                    }
                    Text {
                        id: textIcon
                        anchors { // draw this below and centre to the image
                            top: imgIcon.bottom;
                            horizontalCenter: imgIcon.horizontalCenter;
                            topMargin: 4;
                        }
                        text: icontext
                        font.pixelSize: 16
                        font.family: "DejaVu Sans"
                        color:"white"
                        font.bold: false;
                    }

                    MouseArea{
                        anchors.fill: recIcon
                        z: 100

                        onPressed: {
                            textIcon.color = "yellow";
                            imgIcon.opacity = 0.7;
                            textIcon.opacity = 0.7;
                            root.message(form)
                            timer1.start();
                        }

                        onReleased: {
                            textIcon.color = "yellow";
                            imgIcon.opacity = 0.7;
                            textIcon.opacity = 0.7;
                        }

                        onCanceled: {
                            timer1.stop();
                            textIcon.color = "white";
                            imgIcon.opacity = 1.0;
                            textIcon.opacity = 1.0;
                        }
                    }

                    Timer{
                        id: timer1
                        interval: 100;
                        running: false;
                        repeat: false
                        onTriggered: root.message(form);
                    }

                }
            }
        }

        BorderImage {
            id: border_image1
            x: 13
            y: 142
            width: 50
            height: 48
            source: "images/uparrow.png"
        }

        BorderImage {
            id: border_image2
            x: 14
            y: 260
            width: 50
            height: 48
            source: "images/down_arrow.png"
        }

        Text {
            id: text1
            x: 15
            y: 216
            color: "#ffffff"
            text: qsTr("Swipe")
            rotation: -90
            font.pixelSize: 16
        }

        ImageButton {
            id: image_button1
            x: 567
            y: 409
            width: 40
            height: 40
            text: ""
            imageUp: "images/down-arrow_up.png"
            font.pixelSize: 18
            textColor: "#000000"
            imageDown: "images/down-arrow_down.png"
            font.bold: false
            font.family: "DejaVu Sans"
            z: 200

            onButtonClick: {
                var index = 0;
                menu.page += 1;
                if (menu.page > menu.rows)
                    menu.page = menu.rows;

                index = (menu.page - 1) * 6;
                menu.positionViewAtIndex(index, GridView.Beginning);
            }
        }

        ImageButton {
            id: image_button2
            x: 567
            y: 28
            width: 40
            height: 40
            text: ""
            imageUp: "images/up-arrow_up.png"
            font.pixelSize: 18
            textColor: "#000000"
            imageDown: "images/up-arrow_down.png"
            font.bold: false
            font.family: "Arial"
            z: 210

            onButtonClick: {
                var index = 0;
                menu.page -= 1;
                if (menu.page < 1)
                    menu.page = 1;
                index = (menu.page - 1) * 4;
                menu.positionViewAtIndex(index, GridView.Beginning);
            }
        }
    }


}
