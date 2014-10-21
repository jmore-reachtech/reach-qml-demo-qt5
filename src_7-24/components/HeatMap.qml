/****************************************************************************
 **
 ** Copyright (C) 2013-2014 Reach Technology Inc.
 ** All rights reserved.
 **
 ** This code is protected by international copyright laws. This file may
 ** only be used in accordance with a license and cannot be used on
 ** hardware other than supplied by Reach Technology Inc. We appreciate
 ** your understanding and fairness.
 **
****************************************************************************/
import QtQuick 2.0

Canvas {
    width: 256
    height: 300
    id: graph
    renderStrategy: Canvas.Threaded
    property string color: "transparent"
    property int centerX: width/2
    property int centerY: height/2
    //Number - the maximum number for intensity
    property int max: 20
    //Number - the minimum number for intensity
    property int min: 0
    //Number - Radius to draw the heat image
    property int radius: 20
    //Bool - Whether we calculate intensity
    property bool calculateIntensity: true
    //Number - this needs to be set if we do not calculate intensity (0 - 1 range)
    property real intensity: 0.2
    property alias model: data
    property string image1: "images//0.1_small.png"
    property string image2: "images/0.2_small.png"
    property string image3: "images/0.3_small.png"
    property string image4: "images/0.4_small.png"
    property string image5: "images/0.5_small.png"
    property string image6: "images/0.6_small.png"
    property string image7: "images/0.7_small.png"
    property string image8: "images/0.8_small.png"
    property string image9: "images/0.9_small.png"
    property string image10: "images/1_small.png"
    property variant images: [image1, image2, image3, image4, image5, image6, image7, image8, image9, image10]

    Component.onCompleted:{
        //load images
        for(var i=0; i < images.length; i++)
        {
            loadImage(images[i].toString());
        }
    }

    Image {
        id: designerImage
        visible: false
        source: "../images/heatmap.png"
        anchors.fill: parent
    }

    ListModel{
        id: data
        ListElement
        {
            x: 10
            y: 20
            count: 18
        }
        ListElement
        {
            x: 25
            y : 50
            count : 14
        }
        ListElement
        {
            x: -50
            y : -10
            count : 10
        }
        ListElement
        {
            x: 12
            y: 22
            count : 16
        }
        ListElement
        {
            x: 1
            y: 2
            count : 4
        }
    }

    onPaint :
    {
        var ctx = graph.getContext("2d")
        ctx.fillStyle = "transparent";
        ctx.fillRect(0,0, graph.width, graph.height);

        if(graph.isImageLoaded(image1))
        {
            designerImage.visible = true;
        }

        //First we draw the dark intensity
        for (var i=0; i < data.count; i++)
        {
            var x = centerX + data.get(i).x
            var y = centerY + data.get(i).y

            if (calculateIntensity)
                intensity = ((data.get(i).count - min)/(max - min)).toFixed(1);
            else
                intensity = intensity.toFixed(1);

            if (intensity > 0)
            {
                var index  = intensity * 10;
                ctx.drawImage(images[index], x - (radius), y - (radius), radius*2, radius*2);
            }
        }

        var gctx = gradient.getContext("2d");
        var gradientData = gctx.getImageData(0, 0, 256, 1);

        var mapData = ctx.getImageData(0, 0, width, height);

        for (var j = 0; j < height*width*4; j+=4)
        {
            var a = mapData.data[j + 3]*4; // get the alpha value of this pixel
            mapData.data[j] = gradientData.data[a]; // get the red value from linear gradient that corresponds to this alpha
            mapData.data[j + 1] = gradientData.data[a + 1]; //get the green value based on alpha
            mapData.data[j + 2] = gradientData.data[a + 2]; //get the blue value based on alpha
        }

         ctx.putImageData(mapData, 0, 0);
    }


    Canvas{
        id: gradient
        width: 256
        height: 1
        renderStrategy: Canvas.Threaded
        visible: false

        onPaint: {
            var gctx = gradient.getContext("2d");
            var grd = gctx.createLinearGradient(0,0,256,0);
            grd.addColorStop(0,"magenta");
            grd.addColorStop(0.25,"blue");
            grd.addColorStop(0.50,"green");
            grd.addColorStop(0.75,"yellow");
            grd.addColorStop(1,"red");

            gctx.fillStyle=grd;
            gctx.fillRect(0,0,256,1);
        }
    }
}
