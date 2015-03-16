import QtQuick 2.0
import "components"
import com.reachtech.systemplugin 1.0

Rectangle {
    id: mainView
    width: 800
    height: 480
	color: "#2D2D2D"
    property int mainMenuY: 0

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

    GPIOPinOutput{
        id: pin0
        pin: 0
    }

    GPIOPinOutput{
        id: pin1
        pin: 1
    }

    GPIOPinOutput{
        id: pin2
        pin: 2
    }

    GPIOPinOutput{
        id: pin3
        pin: 3
    }

    Component.onCompleted: {
        pin0.writeToPin(0);
        pin1.writeToPin(0);
        pin2.writeToPin(0);
        pin3.writeToPin(0);

    }
}
