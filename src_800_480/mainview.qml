import QtQuick 2.0
import QtMultimedia 5.0
import "components"

Rectangle {
    id: mainView
    width: 800
    height: 480
	color: "#2D2D2D"
	
    SoundEffect{
        id: sound1
        source: "audio/beep.wav"
    }

    Loader{
        id: loader
    }

    Text{
        id: txtMessage
	anchors.centerIn:parent
        font.pixelSize: 32
	color: "Red"
	text: "Loading QML Application...Please Wait."
	visible: true
    }
	
    Connections {
        target: connection
        onReadyToSend: {
	    txtMessage.visible = false;
	    loader.source = "mainmenu.qml";
        }
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
}
