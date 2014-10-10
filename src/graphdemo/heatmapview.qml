import QtQuick 2.0
import "../components"

Rectangle {
    id: root
    objectName: "root"
    width: 480
    height: 272
    color: "gray"

    signal message(string msg)

    Image{
        width: 480
        height: 235
        source: "../images/map.png"
    }

    HeatMap{
        id: heatchart
        width: 480
        height: 235
    }

    ImageButton {
        id: image_button1
        x: 8
        y: 239
        width: 91
        height: 30
        text: "Change Data"
        imageUp: "../images/internal_button_up.bmp"
        font.pixelSize: 12
        textColor: "#000000"
        imageDown: "../images/internal_button_dn.bmp"
        font.bold: false
        font.family: "Arial"

        onButtonClick: {
            //heatchart.ctx.clearRect(0,0, heatchart.width, heatchart.height);
            //heatchart.model.clear();
            var xMin = -heatchart.width/2 + 10
            var xMax = heatchart.width/2 - 10
            var yMin = -heatchart.height/2 + 10
            var yMax = heatchart.height/2 - 10

            for (var i=0; i < 200; i++)
            {
                var data = {"x": getRandomInt(xMin, xMax), "y": getRandomInt(yMin, yMax), "count": getRandomInt(0, 20)};
                heatchart.model.append(data);
            }

            heatchart.requestPaint();
        }
    }

    ImageButton {
        id: image_button3
        x: 105
        y: 239
        width: 60
        height: 31
        text: "Back"
        imageUp: "../images/internal_button_up.bmp"
        font.pixelSize: 12
        textColor: "#000000"
        imageDown: "../images/internal_button_dn.bmp"
        font.bold: false
        font.family: "Arial"

        onButtonClick: root.message("graphdemo/mainview.qml");
    }

    function getRandomInt(min, max) {
        return Math.floor(Math.random() * (max - min + 1)) + min;
    }


    Component.onCompleted: {
        //Lets create some fake data points
        heatchart.model.clear();
        var xMin = -heatchart.width/2 + 10
        var xMax = heatchart.width/2 - 10
        var yMin = -heatchart.height/2 + 10
        var yMax = heatchart.height/2 - 10

        var list=[];

        for (var i=0; i < 100; i++)
        {
            var data = {"x": getRandomInt(xMin, xMax), "y": getRandomInt(yMin, yMax), "count": getRandomInt(0, 20)};
            heatchart.model.append(data);
        }

    }
}
