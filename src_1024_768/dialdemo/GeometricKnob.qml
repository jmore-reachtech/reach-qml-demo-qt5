import QtQuick 2.0

Rectangle
{
    id: view
    height: 225
    width: 225
    color: "transparent"

    property real degreeAngle : 360.0/repeater.model.count //disect the circle into slices
    property real digitAngle : degreeAngle/57.2957795  //1 radian = 57.2957795 degrees
    property real angleOffSet:  90.0 + degreeAngle/2 //We rotate the needle around the positive x axis in a downward position
    property real value: 0
    property real index: 0
    property alias outerCircleRadius: outerCircle.width
    property alias innerCircleRadius: innerCircle.width
    property alias model : repeater.model
    property color textColor : "White"
    property alias innerCircleColor: innerCircle.color
    property alias outerCircleColor: outerCircle.color
    property alias needleColor: needle.color

    onIndexChanged: {
        //calculate the value using extrapolation
        //console.debug(index)
        var valueScale = 0;
        var indexScale = 0;
        for (var i = 0; i < repeater.model.count-1; i++)
        {
            if (index >= repeater.model.get(i).index && index <= repeater.model.get(i+1).index)
            {
                valueScale = (repeater.model.get(i+1).value - repeater.model.get(i).value);
                indexScale = index - repeater.model.get(i).index;

                value = valueScale * indexScale + repeater.model.get(i).value;
                break;
            }

        }

    }

    /* List element for the control */
    ListModel{
        id: listModel
        ListElement{
            index: 0
            value: 1
        }
        ListElement{
            index: 1
            value: 1
        }
        ListElement{
            index: 2
            value: 2
        }
        ListElement{
            index: 3
            value: 3
        }
        ListElement{
            index: 4
            value: 4
        }
        ListElement{
            index: 5
            value: 5
        }
    }


    /**************************************************************/
    /* This section draws the circles and needle for the knob.    */
    /**************************************************************/
    Rectangle
    {
        id: outerCircle
        width: 128
        height: width
        color: "#0e8ba4"
        border.color: "black"
        border.width: 1
        radius: width*0.5
        anchors.centerIn: parent
        smooth: true

        Rectangle {
            id: innerCircle
            width: 115
            height: width
            color: "#bebbbb"
            border.color: "black"
            border.width: 1
            radius: width*0.5
            anchors.centerIn: parent
            smooth: true
        }

    }

    // Needle and mouse
    Rectangle{
        id:needle
        width: innerCircleRadius/2 + 4
        height: 8
        x: view.width/2 - 4
        y: view.height/2 - 4
        color:"Red"
        smooth: true
        transform: Rotation {
            id: needleRotation
            origin.x : 4;
            origin.y : 4;
        }
    }

    MouseArea {
        height: innerCircleRadius
        width: innerCircleRadius
        anchors.centerIn: parent

        onPositionChanged: {
             needleRotation.angle = getEventAngle(mouse);
        }
        onReleased: {
             needleRotation.angle = getEventAngle(mouse);
        }
        onPressed: {
            needleRotation.angle = getEventAngle(mouse);
        }
    }


    /**************************************************************/
    /* This section will draw the numbers around the outer circle.*/
    /**************************************************************/
    Rectangle {
        id: numbers
        anchors.fill: parent
        color: "transparent"

        Repeater {
            id: repeater
            model: listModel
            delegate:
                Rectangle {
                width: 30
                height: 30
                color: "transparent"
                x: view.width / 2 + (outerCircleRadius * 0.605) * Math.cos((-index) * digitAngle) - 15
                y: view.height / 2 - (outerCircleRadius * 0.605) * Math.sin((-index) * digitAngle) - 15

                Text {
                    id: numberText
                    color: textColor
                    font.pointSize:12
                    anchors.centerIn: parent
                    font.bold: false
                    text: value
                    style: Text.Sunken
                }
                Component.onCompleted: {
                    rotation = -angleOffSet;
                }
            }

          anchors.centerIn: parent
      }

}


    function getEventAngle(event)
    {
        var angle = Math.atan2(event.y - innerCircleRadius/2, event.x - innerCircleRadius/2);

        if(angle < 0)
            angle += 2 * Math.PI;

        //1 radian = 57.2957795 degrees
        var angleCalc = angle * 57.2957795 - angleOffSet;

        if (angleCalc < 0)
            angleCalc = angleCalc += 360.0;

        view.index = angleCalc / degreeAngle;
        return (angle * 57.2957795);
    }


    Component.onCompleted : {
        numbers.rotation = angleOffSet;
        //Set the angle to what value is first assigned
        needleRotation.angle = angleOffSet;

    }
}


