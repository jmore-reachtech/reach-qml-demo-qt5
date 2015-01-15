import QtQuick 2.0

Item {
    width: imgBase.width
    height: imgBase.height
    property int step: 10
    property int currentImage: 0
    property int velocity: 50
    property int totalImages: 10
    property string imageExtension: ".png"
    property string imageBaseName: "progress_"
    property bool useTimer: true;
    property int timerDuration: 500;

    /*Behavior on currentImage {
        PropertyAnimation { duration: 1000 }
      }*/

    Image{
        id: imgBase
        source: "../images/" + imageBaseName + (currentImage*step).toString() + imageExtension;
    }

    Behavior on currentImage {
            PropertyAnimation { duration: (velocity*totalImages); }
            // EXTRAS
            // loops: -1 for infinite sequence
            // easing.type for fluid movement
        }

    Timer{
        id: timer1
        repeat: true
        running: false
        interval: timerDuration
        onTriggered: {
            if (currentImage < totalImages)
                currentImage += 1;
            if (currentImage === totalImages)
            {
                currentImage = 0;
                //timer1.stop();
            }
        }
    }

    Component.onCompleted: {
        if (useTimer)
        {
            timer1.start();
        }
    }
}
