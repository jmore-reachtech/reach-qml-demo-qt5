import QtQuick 1.1
import "../components"

Rectangle {
    id: root
    objectName: "root"
    width: 480
    height: 272
    color: "#eeeeee"
    property int test: 0

    signal message(string msg)

    PieChart{
        id: pchart
        x: 1
        y: 8
        width: 236
        height: 220
        legendFontFamily: "DejaVu Sans"
        showLegend: true
        legendFontColor: "#090808"
        legendFontSize: 9
        segmentShowStroke: true
        color: "transparent"
    }

    DoughnutChart{
        id : dchart
        x: 242
        y: 8
        width: 236
        height: 220
        legendFontFamily: "DejaVu Sans"
        showLegend: true
        legendFontColor: "#090808"
        legendFontSize: 9
        segmentShowStroke: true
        color: "transparent"
    }

    ImageButton {
        id: image_button1
        x: 28
        y: 228
        width: 98
        height: 30
        text: "Change Data"
        imageUp: "../images/internal_button_up.bmp"
        font.pixelSize: 12
        textColor: "#000000"
        imageDown: "../images/internal_button_dn.bmp"
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
        x: 143
        y: 228
        width: 60
        height: 30
        text: "Back"
        imageUp: "../images/internal_button_up.bmp"
        font.pixelSize: 12
        textColor: "#000000"
        imageDown: "../images/internal_button_dn.bmp"
        font.bold: false
        font.family: "Arial"

        onButtonClick: root.message("graphdemo/mainview.qml");
    }


}
