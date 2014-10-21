import QtQuick 1.1

Rectangle{
    id: root
    objectName: "root"
    width: 480
    height: 272
    property int totalFiles: 0
    signal message(string msg)

    gradient: Gradient {
        GradientStop {position: 0.0; color: "#666666"}
        GradientStop {position: 1.0; color: "#EEEEEE"}
    }
	

	
	Text {
        id: text1
        x: 0
        y: 24
        width: 480
        height: 29
        text: qsTr("Upgrade was successful.")
        font.family: "DejaVu Sans"
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 16
    }
}