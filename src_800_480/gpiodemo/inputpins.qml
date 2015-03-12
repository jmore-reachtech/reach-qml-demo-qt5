import QtQuick 2.0
import "../components"
import com.reachtech.systemplugin 1.0

Rectangle {
    id: root
    objectName: "root"
    width: 800
    height: 480

    gradient: Gradient {
        GradientStop {
            position: 0.16
            color: "#afacac"
        }

        GradientStop {
            position: 1
            color: "#000000"
        }
    }

    signal message(string msg)

	
	

	Text {
        id: txtTitle
        x: 0
        y: 44
        width: 800
        height: 25
        text: qsTr("GPIO Plugin Demo")
        horizontalAlignment: Text.AlignHCenter
        font.bold: false
        font.pixelSize: 24
        anchors.horizontalCenter: parent.horizontalCenter
    }
	
    NumericSelector {
        id: writeValue
        x: 345
        y: 135
        height: 33
        width: 109
        max: 32
        min: 0
        displayText: ""
    }

	GPIOPinInput{
        id: pin2
        pin: 2
        pollPin: false
    }

    GPIOPinInput{
        id: pin3
        pin: 3
        pollPin: false
    }
	
    GPIOPinsOutput{
        id: pinsOutput
    }

    ImageButton {
        id: quitButton
        x: 351
        y: 179
        width: 98
        height: 27
        text: "Submit"
        font.bold: true
        imageDown: "../images/internal_button_dn.bmp"
        imageUp: "../images/internal_button_up.bmp"
        onButtonClick: pinsOutput.writeToPins(writeValue.value);
    }

     Text {
         id: text1
         x: 160
         y: 278
         width: 480
         height: 20
         color: "#ffffff"
         text: qsTr("Input Register")
         horizontalAlignment: Text.AlignHCenter
         font.bold: true
         font.family: "DejaVu Sans"
         font.pixelSize: 15
     }

     PanelReadOut {
         id: panel
         x: 316
         y: 299
         width: 174
         height: 62
         text: ""
         font.pixelSize: 22
         textColor: "#50dd0e"
         imagePanel: "../images/bezel.bmp"
         font.bold: false
         font.family: "DejaVu Sans"
     }

        GPIOPinsInput{
        id: pinsInput

        onStateChanged:{
            if (state < 16)
                panel.text = "0x0" + pinsInput.getHexState();
            else
                panel.text = "0x" + pinsInput.getHexState();
        }
    }
	
        ImageButton{
            id:prevButton
            x: 181
            y: 314
            width: 48
            height: 48
            text: ""

            imageDown: "images/prev_down.png"
            imageUp: "images/prev_up.png"


            onButtonClick: {
                root.message("gpiodemo/mainview.qml");
            }
        }

        Text {
            id: text2
            x: 159
            y: 111
            width: 480
            height: 18
            color: "#ffffff"
            text: qsTr("Write To Register")
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 15
            font.bold: true
            font.family: "DejaVu Sans"
        }

        Rectangle {
            id: rectangle1
            x: 0
            y: 238
            width: 800
            height: 5
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#ffffff"
                }

                GradientStop {
                    position: 0.27
                    color: "#000000"
                }

                GradientStop {
                    position: 0.85
                    color: "#ffffff"
                }
            }
        }

}	
