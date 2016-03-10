import QtQuick 2.0
import "../components"
import com.reachtech.systemplugin 1.0

Rectangle {
    id: root
    objectName: "root"
    width: 800
    height: 480
    property int page: 0
    color: "#666666"

    signal message(string msg)

    System{
        id: system
    }

    // Put the name of the QML files containing your pages (without the '.qml')
    property variant pagesList  : [
      "Buttons1",
      "Buttons2",
      "Indicators1",
      "Indicators2",
      "DataEntry",
      "Knobs",
      "Meters"
    ];

    // Set this property to another file name to change page
    property string  currentPage : "";

    Repeater {
        id: repeater
        model: pagesList;
        delegate: Loader {
            id: loader
            property string pageName: modelData
            property bool beenLoaded: false
            anchors.fill: parent
            visible: (currentPage === modelData);
            //source: "%1.qml".arg(modelData)
            onVisibleChanged: {
                if (visible && !beenLoaded)
                {
                    source = "%1.qml".arg(pageName);
                    beenLoaded = true;
                }
            }

        }
    }

    ImageButton {
        id: image_button1
        x: 40
        y: 392
        width: 48
        height: 40
        text: ""
        imageUp: "images/left_arrow_up.png"
        font.pixelSize: 18
        textColor: "#000000"
        imageDown: "images/left_arrow_down.png"
        font.bold: false
        font.family: "Arial"
        smooth: true
        visible: root.page > 0

        onButtonClick: {
            system.execute("beep -f 2000 -l 100");
            root.page -= 1;
            if (root.page < 0)
                root.page = 0;
            currentPage = repeater.itemAt(root.page).pageName;
        }
    }

    ImageButton {
        id: image_button2
        x: 713
        y: 392
        width: 48
        height: 40
        text: ""
        smooth: true
        imageUp: "images/right_arrow_up.png"
        font.pixelSize: 18
        textColor: "#000000"
        imageDown: "images/right-arrow_down.png"
        font.bold: false
        font.family: "Arial"
        visible: root.page < pagesList.length-1

        onButtonClick: {
            system.execute("beep -f 2000 -l 100");
            root.page += 1;
            if (root.page > repeater.count-1)
                root.page = repeater.count-1;
            currentPage = repeater.itemAt(root.page).pageName;
        }
    }

    Component.onCompleted: currentPage = "Buttons1";
}
