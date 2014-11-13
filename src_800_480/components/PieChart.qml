import QtQuick 2.0

Canvas{
    id : graph
    width: 200
    height: 200
    //Boolean - Whether we should show a stroke on each segment
    property bool segmentShowStroke : true
    //String - The color of each segment stroke
    property string segmentStrokeColor : "#ffffff"
    //Number - The width of each segment stroke
    property int segmentStrokeWidth : 2
    //Bool: - Whether we should show a legend
    property bool showLegend: true
    //String - Legend label font declaration for the legend label
    property string legendFontFamily : "DejaVu Sans"
    //Number - Legend label font size in pixels
    property int legendFontSize : 10
    //Number - Legend Width
    property int legendWidth: 0
    //String - Legend label font weight style
    property string legendFontStyle : "normal"
    //String - Legend label font colour
    property string legendFontColor : "#000"
    property string color: ""

    property variant data : [
                {
                    text: "Series 1",
                    value: 30,
                    color:"#F38630"
                },
                {
                    text: "Series 2",
                    value : 50,
                    color : "#E0E4CC"
                },
                {
                    text: "Series 3",
                    value : 100,
                    color : "#69D2E7"
                },
                {
                    text: "Series 4",
                    value : 25,
                    color : "Red"
                }
            ];

    onDataChanged: graph.requestPaint();

    onPaint: {
        var ctx = getContext("2d");

        ctx.clearRect(0, 0, width, height);

        if (showLegend)
           drawLegend(ctx);

        var segmentTotal = 0;

        //var pieRadius = Math.min((height - titleHeight)/2, (width - legendWidth)/2) - 5;
        var pieRadius = Math.min((height)/2, (width - legendWidth - legendFontSize*2)/2) - 5;

        //Now lets find our circle center
        var xCenter = Math.max((width - legendWidth)/2 , pieRadius) - 5;
        var yCenter = Math.max(height/2, pieRadius);

        for (var i=0; i<data.length; i++){
                segmentTotal += data[i].value;
        }

        var cumulativeAngle = -Math.PI/2,
        scaleAnimation = 1,
        rotateAnimation = 1;

        for (var i=0; i<data.length; i++){
                var segmentAngle = rotateAnimation * ((data[i].value/segmentTotal) * (Math.PI*2));
                ctx.beginPath();
                ctx.arc(xCenter, yCenter, scaleAnimation * pieRadius, cumulativeAngle, cumulativeAngle + segmentAngle, false);
                ctx.lineTo(xCenter, yCenter);

                ctx.closePath();
                ctx.fillStyle = data[i].color;
                ctx.fill();

                if(segmentShowStroke){
                        ctx.lineWidth = segmentStrokeWidth;
                        ctx.strokeStyle = segmentStrokeColor;
                        ctx.stroke();
                }

                cumulativeAngle += segmentAngle;
        }
    }


    function drawLegend(ctx)
    {
        ctx.font = legendFontStyle + " " + legendFontSize + "px \"" + legendFontFamily + "\"";
        legendWidth = 0;

        //first get the length of the legend
        var dataText = new Array();
        var dataLength = new Array();
        var dataColor = new Array();

        for (var i=0; i < data.length; i++)
        {
            dataText[i] = data[i].text;
            dataLength[i] = ctx.measureText(data[i].text).width + legendFontSize;
            dataColor[i] = data[i].color;
            if (legendWidth < dataLength[i])
                legendWidth = dataLength[i];

        }

        var x = width - legendWidth;
        var y = (height - (i - 1) * legendFontSize)/2

        //Now lets place boxes and text to the right of the chart
        for (i=0; i < data.length; i++)
        {
            //Draw box
            ctx.fillStyle = dataColor[i];
            ctx.fillRect(x - legendFontSize - legendFontSize/2, y - legendFontSize, legendFontSize, legendFontSize);
            ctx.fillStyle = legendFontColor;
            ctx.textAlign = "left"
            ctx.fillText(dataText[i], x, y);
            y += legendFontSize + legendFontSize/2;
        }

    }

}

