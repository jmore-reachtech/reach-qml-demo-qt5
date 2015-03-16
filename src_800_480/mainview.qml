import QtQuick 2.0
import "components"

Rectangle {
    id: mainView
    width: 800
    height: 480
	color: "#2D2D2D"

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
            loader.source = msg;            
        }
    }
}
