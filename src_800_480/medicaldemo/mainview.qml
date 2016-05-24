import QtQuick 2.0
import "../components"

Item {
    id: mainview
    width: 800
    height: 480
    property int hour: 13
    property int minute: 39
    property string patientName: ""
    property int initialValue: 6

    signal message(string msg)

    Image{
        id: bgImage
        source: "images/med_background.png"
    }

    Loader{
        id: load
        source: "patientlist.qml"
    }

    ImageButton {
        id: btnHome
        x: 180
        y: 2
        width: 48
        height: 48
        text: ""
        imageUp: "images/quit_up.png"
        imageDown: "images/quit_down.png"
        font.pixelSize: 18
        textColor: "#000000"
        font.bold: false
        font.family: "DejaVu Sans"

        onButtonClick: goBack();
    }

    Timer{
        id: timer
        interval: 1000;
        running: true;
        repeat: true
        onTriggered: {
            minute += 1;
            if (minute > 59)
            {
                minute = 0;
                hour += 1;
                if (hour > 24)
                    hour = 0;
            }
        }
    }

    function goBack()
    {
        mainView.mainLoader.source = "../mainmenu.qml";
    }

}
