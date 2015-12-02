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

Dial{
    id: speedometer
    value: 120
    min: 0
    max:120
    // Width and height dictated by the background image
    width: 300; height: 300

    // Set the images
    backgroundImage: "../images/meterbackground.png"
    needleImage: "../images/needle.png"
    needleImageWidth:11
    needleImageHeight: 90

    overlayImage: "../images/overlay.png"
    overlayImageWidth: 211
    overlayImageHeight: 150

    // Set the needle position
    needleX: 140
    needleY: 47
    // Set the overlay image position
    overlayX: 30
    overlayY: 24
    // Set the position of the needle image where the rotation moves around
    needleRotationX: 8
    needleRotationY: 86

    minAngle: -130
    maxAngle: 133
    // Set the initial angle of the needle rotation
    angle: minAngle
    property real scaleFactor: (maxAngle - minAngle)/(max-min)

    onValueChanged: {
        //Math that will change the angle
        angle = Math.min(Math.max(minAngle, value * scaleFactor + minAngle), maxAngle);
    }

    onScaleFactorChanged: {
        angle = Math.min(Math.max(minAngle, value * scaleFactor + minAngle), maxAngle);
    }


    Component.onCompleted: {
        angle = Math.min(Math.max(minAngle, value * scaleFactor + minAngle), maxAngle);
    }
}
