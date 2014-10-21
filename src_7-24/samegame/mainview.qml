/****************************************************************************
**
** Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
** Contact: http://www.qt-project.org/legal
**
** This file is part of the QtDeclarative module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and Digia.  For licensing terms and
** conditions see http://qt.digia.com/licensing.  For further information
** use the contact form at http://qt.digia.com/contact-us.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 2.1 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPL included in the
** packaging of this file.  Please review the following information to
** ensure the GNU Lesser General Public License version 2.1 requirements
** will be met: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
**
** In addition, as a special exception, Digia gives you certain additional
** rights.  These rights are described in the Digia Qt LGPL Exception
** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3.0 as published by the Free Software
** Foundation and appearing in the file LICENSE.GPL included in the
** packaging of this file.  Please review the following information to
** ensure the GNU General Public License version 3.0 requirements will be
** met: http://www.gnu.org/copyleft/gpl.html.
**
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.0
import "SamegameCore"
import "SamegameCore/samegame.js" as Logic

Rectangle {
    id: screen
    width: 800;
    height: 480
    property bool inAnotherDemo: false //Samegame often is just plonked straight into other demos

    signal message(string msg)
    SystemPalette { id: activePalette }

    Item {
        width: parent.width
        anchors { top: parent.top; bottom: toolBar.top }

        Image {
            id: background
            anchors.fill: parent
            source: "SamegameCore/pics/background.png"
            fillMode: Image.PreserveAspectCrop
        }

        Item {
            id: gameCanvas
            property int score: 0
            property int blockSize: 40

            z: 20; anchors.centerIn: parent
            width: parent.width - (parent.width % blockSize);
            height: parent.height - (parent.height % blockSize);

            MouseArea {
                //anchors.fill: parent; onClicked: Logic.handleClick(mouse.x,mouse.y);
				//Changed action to occur on press rather than release
				anchors.fill: parent; onPressed: Logic.handleClick(mouse.x,mouse.y);
            }
        }
    }

    Dialog { id: dialog; anchors.centerIn: parent; z: 21 }

    Dialog {
        id: nameInputDialog

        property int initialWidth: 0

        anchors.centerIn: parent
        z: 22;

        Behavior on width {
            NumberAnimation {} 
            enabled: nameInputDialog.initialWidth != 0
        }

        onClosed: {
        }
        Text {
            id: dialogText
            anchors { horizontalCenter: parent.horizontalCenter; verticalCenter: parent.verticalCenter }
            text: "Congratulations you have won!"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                    nameInputDialog.forceClose();
            }
        }

    }

    Rectangle {
        id: toolBar
        x: 0
        y: 219
        width: parent.width; height: 40
        color: activePalette.window
        anchors.bottom: screen.bottom

        Button {
            id: newGameButton
            x: 3
            y: 9
            width: 137
            height: 39
            anchors { left: parent.left; leftMargin: 3; verticalCenter: parent.verticalCenter }
            text: "New Game" 
            onClicked: Logic.startNewGame()
        }

        Button {
            x: 143
            y: 9
            width: 63
            height: 39
            visible: !inAnotherDemo
            text: "Quit"
            anchors { left: newGameButton.right; leftMargin: 3; verticalCenter: parent.verticalCenter }
            onClicked: screen.message("../src/mainmenu.qml");
        }

        Text {
            id: score
            anchors { right: parent.right; rightMargin: 3; verticalCenter: parent.verticalCenter }
            text: "Score: " + gameCanvas.score
            font.bold: true
            font.pixelSize: 24
            color: activePalette.windowText
        }
    }

}
