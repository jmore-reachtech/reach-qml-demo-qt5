import QtQuick 2.0
import "../components"

Rectangle {
    id: menu
    objectName: "menu"
    width: 1280
    height: 800
    color: "#666666"

    signal message(string msg)

    Column{
        anchors.centerIn: parent
        spacing: 30

        Row{
            spacing: 30
            ImageButton {
                width: 160
                height: 80
                text: "Bar Chart"
                imageUp: "../images/blue_button_up.png"
                font.pixelSize: 22
                textColor: "#ffffff"
                imageDown: "../images/blue_button_dn.png"
                font.bold: false
                font.family: "Arial"

                onButtonClick: menu.message("graphdemo/barchartview.qml");
            }

            ImageButton {
                width: 160
                height: 80
                text: "Line Chart"
                imageUp: "../images/blue_button_up.png"
                font.pixelSize: 22
                textColor: "#ffffff"
                imageDown: "../images/blue_button_dn.png"
                font.bold: false
                font.family: "Arial"

                onButtonClick: menu.message("graphdemo/linechartview.qml");
            }

            ImageButton {
                width: 160
                height: 80
                text: "Pie Chart"
                imageUp: "../images/blue_button_up.png"
                font.pixelSize: 22
                textColor: "#ffffff"
                imageDown: "../images/blue_button_dn.png"
                font.bold: false
                font.family: "Arial"

                onButtonClick: menu.message("graphdemo/piechartview.qml");
            }
        }

        Row{
            spacing: 30
            ImageButton {
                width: 160
                height: 80
                text: "Strip Chart"
                imageUp: "../images/blue_button_up.png"
                font.pixelSize: 22
                textColor: "#ffffff"
                imageDown: "../images/blue_button_dn.png"
                font.bold: false
                font.family: "Arial"

                onButtonClick: menu.message("graphdemo/stripchartview.qml");
            }

            ImageButton {
                width: 160
                height: 80
                text: "Draw Area"
                imageUp: "../images/blue_button_up.png"
                font.pixelSize: 22
                textColor: "#ffffff"
                imageDown: "../images/blue_button_dn.png"
                font.bold: false
                font.family: "Arial"

                onButtonClick: menu.message("graphdemo/drawareaview.qml");
            }
             
			ImageButton {
                width: 160
                height: 80
                text: "Scope Chart"
                imageUp: "../images/blue_button_up.png"
                font.pixelSize: 22
                textColor: "#ffffff"
                imageDown: "../images/blue_button_dn.png"
                font.bold: false
                font.family: "Arial"

                onButtonClick: menu.message("graphdemo/scopechartview.qml");
            }

        }

        Row{
            spacing: 30

            ImageButton {
                width: 160
                height: 80
                text: "Go Back"
                imageUp: "../images/blue_button_up.png"
                font.pixelSize: 22
                textColor: "#ffffff"
                imageDown: "../images/blue_button_dn.png"
                font.bold: false
                font.family: "Arial"

                onButtonClick: menu.message("../src/mainmenu.qml");
            }

        }

    }

}
