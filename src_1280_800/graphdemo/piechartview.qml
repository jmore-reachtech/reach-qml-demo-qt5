import QtQuick 2.0
import "../components"

Rectangle {
    id: root
    objectName: "root"
    width: 1280
    height: 800
    color: "#666666"
    property int test: 0

    signal message(string msg)

    PieChart{
        id: pchart
        x: 130
        y: 172
        width: 434
        height: 378
        legendFontFamily: "DejaVu Sans"
        showLegend: true
        legendFontColor: "#ffffff"
        legendFontSize: 13
        segmentShowStroke: true
        color: "transparent"
    }

    DoughnutChart{
        id : dchart
        x: 696
        y: 172
        width: 434
        height: 378
        legendFontFamily: "DejaVu Sans"
        showLegend: true
        legendFontColor: "#ffffff"
        legendFontSize: 13
        segmentShowStroke: true
        innerCutoutColor: "#666666"
        color: "transparent"
    }

    ImageButton {
        id: image_button1
        x: 175
        y: 605
        width: 110
        height: 40
        text: "Change Data"
        imageUp: "../images/blue_button_up.png"
        font.pixelSize: 16
        textColor: "#ffffff"
        imageDown: "../images/blue_button_dn.png"
        font.bold: false
        font.family: "Arial"

        onButtonClick: {
            if (test === 0)
            {
                var d = "[{text: \"Series 1\", value: 70, color:\"#F7464A\"}, {text: \"Series 2\", value : 90, color : \"#E2EAE9\"}, {text: \"Series 3\", value : 20, color : \"#D4CCC5\"}, {text: \"Series 4\", value : 140, color : \"#949FB1\"},{text: \"Series 5\", value : 12, color : \"#4D5360\"}]";
                var testData = eval('(' + d + ')');
                pchart.data = testData;
                dchart.data = testData;
                test += 1;
            }
            else
            {
                var d1 = "[{text: \"Series 1\",value: 30,color:\"#F38630\"},{text: \"Series 2\",value : 50,color : \"#E0E4CC\"},{text: \"Series 3\",value : 100,color : \"#69D2E7\"},{text: \"Series 4\",value : 25,color : \"Red\"}]";
                var testData1 = eval('(' + d1 + ')');
                pchart.data = testData1;
                dchart.data = testData1;
                test -= 1;
            }

        }
    }

    ImageButton {
        id: image_button3
        x: 341
        y: 605
        width: 70
        height: 40
        text: "Back"
        imageUp: "../images/blue_button_up.png"
        font.pixelSize: 16
        textColor: "#ffffff"
        imageDown: "../images/blue_button_dn.png"
        font.bold: false
        font.family: "Arial"

        onButtonClick: root.message("graphdemo/mainview.qml");
    }


}
