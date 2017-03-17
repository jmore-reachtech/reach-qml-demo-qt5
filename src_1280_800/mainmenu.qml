import QtQuick 2.0
import "components"

Rectangle {
    width: 1280
    height: 800
    id: root
    objectName: "root"
    color: "#2D2D2D"
    signal message(string msg)

    ListModel {
        id: listModel

        ListElement {
            image: "images/coffee-icon.png"; iconheight:86; iconwidth: 113; form: "capacitive_coffeedemo/mainview.qml"; icontext: "  Capacitive\nCoffee Demo"
        }
        ListElement {
            image: "images/coffee-icon.png"; iconheight:86; iconwidth: 113; form: "resistive_coffeedemo/mainview.qml"; icontext: "   Resistive\nCoffee Demo"
        }
        ListElement {
            image: "images/dial-icon.png"; iconheight:88; iconwidth: 88; form: "dialdemo/mainview.qml"; icontext: "Dial Demo"
        }
        ListElement {
            image: "images/vumeter-icon.png"; iconheight:84; iconwidth: 125; form: "vumeterdemo/mainview.qml"; icontext: "VU Meter Demo"
        }
        ListElement {
            image: "images/samegame-icon.png"; iconheight:84; iconwidth: 125; form: "samegame/mainview.qml"; icontext: "Same Game"
        }
        ListElement {
            image: "images/spedometer-icon.png"; iconheight:96; iconwidth: 96; form: "spedometerdemo/mainview.qml"; icontext: "Spedometer Demo"
        }
        ListElement {
            image: "images/reach-icon.png"; iconheight:84; iconwidth: 84; form: "capacitive_componentdemo/mainview.qml"; icontext: "     Capacitive\nComponent Demo"
        }
        ListElement {
            image: "images/reach-icon.png"; iconheight:84; iconwidth: 84; form: "resistive_componentdemo/mainview.qml"; icontext: "      Resistive\nComponent Demo"
        }
        ListElement {
            image: "images/graph-icon.png"; iconheight:72; iconwidth: 86; form: "graphdemo/mainview.qml"; icontext: "Graph Demo"
        }
        ListElement {
            image: "images/system-icon.png"; iconheight:72; iconwidth: 84; form: "systemdemo/mainview.qml"; icontext: "System Plugin\n      Demo"
        }
        ListElement {
                   image: "images/video-icon.png"; iconheight:89; iconwidth: 88; form: "videodemo/mainview.qml"; icontext: "Video Demo"
        }
		ListElement {
                   image: "images/web-icon.png"; iconheight:90; iconwidth: 90; form: "webdemo/mainview.qml"; icontext: "Web Demo"
        }
		ListElement {
                   image: "images/io-icon.png"; iconheight:76; iconwidth: 92; form: "iodemo/mainview.qml"; icontext: "I/O Demo"
        }
        ListElement {
                   image: "images/gpio-icon.png"; iconheight:72; iconwidth: 86; form: "gpiodemo/mainview.qml"; icontext: "GPIO Plugin\n    Demo"
        }
        ListElement {
            image: "images/spedometer-icon.png"; iconheight:78; iconwidth: 78; form: "persist_spedometerdemo/mainview.qml"; icontext: "        Persistent\n Spedometer Demo"
        }
		ListElement {
            image: "images/imagedemo-icon.png"; iconheight:78; iconwidth: 130; form: "imagedemo/mainview.qml"; icontext: "    Image\n Test Demo"
        }
    }

    GridView{
        id: menu
        property int rows: Math.ceil(menu.count/6)
        property int page: 1
        model: listModel
        currentIndex: -1 // default - no focus
        anchors.fill: parent
        delegate: appDelegate
        cellWidth: 426
        cellHeight: 266
        clip: true
        focus: true

        onFlickEnded: {
            if (menu.atYBeginning)
                page = 1;
            else if (menu.atYEnd)
                page = rows;
            mainView.mainMenuY = menu.contentY;
        }

        Component {
            id: appDelegate

            Item {
                width: 426; height: 266 // controls the size
                Rectangle
                {
                    id: recIcon
                    width: 166
                    height: 122
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenterOffset: (index+1) % 3 == 0 ? -60 : 60
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
                        font.pixelSize: 18
                        font.family: "DejaVu Sans"
                        color:"white"
                        font.bold: false;
                    }

                    MouseArea{
                        anchors.fill: parent
                        z: 100

                        onPressed: {
                            beeper.play();
                            textIcon.color = "yellow";
                            imgIcon.opacity = 0.7;
                            textIcon.opacity = 0.7;
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
                        interval: 200;
                        running: false;
                        repeat: false
                        onTriggered: root.message(form);
                    }

                    Component.onCompleted: {
                        if ((index + 1) % 3 == 2)
                            anchors.horizontalCenterOffset = 10;
                    }
                }
            }
        }

        BorderImage {
            id: border_image1
            x: 46
            y: 317
            width: 50
            height: 48
            source: "images/uparrow.png"
        }

        BorderImage {
            id: border_image2
            x: 46
            y: 435
            width: 50
            height: 48
            source: "images/down_arrow.png"
        }

        Text {
            id: text1
            x: 46
            y: 389
            color: "#ffffff"
            text: qsTr("Swipe")
            rotation: -90
            font.pixelSize: 18
        }

        ImageButton {
            id: image_button1
            x: 1160
            y: 693
            width: 50
            height: 50
            text: ""
            imageUp: "images/down-arrow_up.png"
            font.pixelSize: 18
            textColor: "#000000"
            imageDown: "images/down-arrow_down.png"
            font.bold: false
            font.family: "DejaVu Sans"

            onButtonClick: {
                var index = 0;
                menu.page += 1;
                if (menu.page > menu.rows)
                    menu.page = menu.rows;

                index = (menu.page - 1) * 6;
                menu.positionViewAtIndex(index, GridView.Beginning);
                mainView.mainMenuY = menu.contentY;
            }
        }
    }

    ImageButton {
        id: image_button2
        x: 1160
        y: 76
        width: 50
        height: 50
        text: ""
        imageUp: "images/up-arrow_up.png"
        font.pixelSize: 18
        textColor: "#000000"
        imageDown: "images/up-arrow_down.png"
        font.bold: false
        font.family: "Arial"

        onButtonClick: {
            var index = 0;
            menu.page -= 1;
            if (menu.page < 1)
                menu.page = 1;
            index = (menu.page - 1) * 6;
            menu.positionViewAtIndex(index, GridView.Beginning);
            mainView.mainMenuY = menu.contentY;
        }
    }

    Component.onCompleted: {
        menu.contentY = mainView.mainMenuY;
    }
}
