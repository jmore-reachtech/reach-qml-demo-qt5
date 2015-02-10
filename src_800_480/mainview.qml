import QtQuick 2.0
import QtMultimedia 5.0
import "components"

Item {
    id: mainView
    width: 800
    height: 480
	
    SoundEffect{
        id: sound1
        source: "audio/beep.wav"
    }

    Loader{
        id: loader
    }

    Connections {
        target: loader.item
        onMessage: {
            if (msg != "videodemo/mainview.qml")
            {
                sound1.volume = 0.4;
                sound1.play();
            }
            loader.source = msg;            
        }
    }

    Component.onCompleted: {
        loader.source = "mainmenu.qml";
    }
}

