import QtQuick 2.0
import "../components"

Rectangle {
    id: menu
    objectName: "menu"
    width: 640
    height: 480
    color: "#666666"

    signal message(string msg)

    Column{
        anchors.centerIn: parent
        spacing: 14

        Row{
            spacing: 10
            ImageButton {
                width: 139
                height: 77
                text: "Bar Chart"
                imageUp: "../images/internal_button_up.bmp"
                font.pixelSize: 18
                textColor: "#000000"
                imageDown: "../images/internal_button_dn.bmp"
                font.bold: false
                font.family: "Arial"

                onButtonClick: menu.message("graphdemo/barchartview.qml");
            }

            ImageButton {
                width: 139
                height: 77
                text: "Line Chart"
                imageUp: "../images/internal_button_up.bmp"
                font.pixelSize: 18
                textColor: "#000000"
                imageDown: "../images/internal_button_dn.bmp"
                font.bold: false
                font.family: "Arial"

                onButtonClick: menu.message("graphdemo/linechartview.qml");
            }

            ImageButton {
                width: 139
                height: 77
                text: "Pie Chart"
                imageUp: "../images/internal_button_up.bmp"
                font.pixelSize: 18
                textColor: "#000000"
                imageDown: "../images/internal_button_dn.bmp"
                font.bold: false
                font.family: "Arial"

                onButtonClick: menu.message("graphdemo/piechartview.qml");
            }
        }

        Row{
            spacing: 10
            ImageButton {
                width: 139
                height: 77
                text: "Strip Chart"
                imageUp: "../images/internal_button_up.bmp"
                font.pixelSize: 18
                textColor: "#000000"
                imageDown: "../images/internal_button_dn.bmp"
                font.bold: false
                font.family: "Arial"

                onButtonClick: menu.message("graphdemo/stripchartview.qml");
            }

            ImageButton {
                width: 139
                height: 77
                text: "Draw Area"
                imageUp: "../images/internal_button_up.bmp"
                font.pixelSize: 18
                textColor: "#000000"
                imageDown: "../images/internal_button_dn.bmp"
                font.bold: false
                font.family: "Arial"

                onButtonClick: menu.message("graphdemo/drawareaview.qml");
            }
             
			ImageButton {
                width: 139
                height: 77
                text: "Scope Chart"
                imageUp: "../images/internal_button_up.bmp"
                font.pixelSize: 18
                textColor: "#000000"
                imageDown: "../images/internal_button_dn.bmp"
                font.bold: false
                font.family: "Arial"

                onButtonClick: menu.message("graphdemo/scopechartview.qml");
            }

        }

        Row{
            spacing: 10

            ImageButton {
                width: 139
                height: 77
                text: "Go Back"
                imageUp: "../images/internal_button_up.bmp"
                font.pixelSize: 18
                textColor: "#000000"
                imageDown: "../images/internal_button_dn.bmp"
                font.bold: false
                font.family: "Arial"

                onButtonClick: menu.message("../src/mainmenu.qml");
            }

        }

    }

}
