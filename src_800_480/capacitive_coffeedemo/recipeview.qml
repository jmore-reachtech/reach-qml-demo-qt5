import QtQuick 2.0
import com.reachtech.systemplugin 1.0
import "../components"
import "js/dataModel.js" as Db

Rectangle {
    width: 800
    height: 480
    id: root
    color: "#666666"
    z: 200
    property string errorMessage: "";
    property bool keyBoardLoaded: false
    property int recipeId

    signal message(string msg)

    AlphaField {
        id: tbName
        x: 189
        y: 102
        width: 362
        height: 34
        keyboardBackGroundImage: "images/keyboardbg.png"
        normalKeyIcon: "images/key1_off.png"
        pressedKeyIcon: "images/key1_on.png"
        fieldSpacing: 8
        inputText: ""
        keyTextColor: "#000000"
        keyTextBold: false
        keyHeight: 48
        keyWidth: 46
        keyTextFontSize: 18
        inputColor: "#ffffff"
        labelColor: "#f7f6f6"
        inputFontPixelSize: 20
        keyboardAnimationSpeed: 100
        inputFontFamily: "Arial"
        labelFontFamily: "Arial"
        labelFontPixelSize: 18
        labelText: "Name"
        z: 30
    }

    Text {
        id: txtMsg
        x: 579
        y: 110
        color: "Red"
        text: qsTr("*")
        font.pixelSize: 14
        z: 30
    }

    Text {
        id: txtVolume
        x: 189
        y: 154
        color: "#f7f6f6"
        text: qsTr("Volume")
        font.pixelSize: 18
    }

    NumericSelector {
        id: volume
        x: 190
        y: 177
        height: 40
        width: 130
        max: 16
        min: 2
        displayText: " OZ"
    }

    Text {
        id: txtTemp
        x: 187
        y: 240
        color: "#f7f6f6"
        text: qsTr("Temperature")
        font.pixelSize: 18
    }

    NumericSelector {
        id: temp
        x: 190
        y: 264
        height: 40
        width: 130
        max: 208
        min: 165
        increment: 1
        displayText: qsTr("<sup>o</sup>F")
    }


    Text {
        id: txtFillPause
        x: 335
        y: 155
        color: "#f7f6f6"
        text: qsTr("Fill Pause")
        font.pixelSize: 18
    }

    NumericSelector {
        id: fillPause
        x: 335
        y: 177
        height: 40
        width: 150
        max: 25.0
        min: 1.0
        precision: 1
        increment: 0.1
        displayText: " Secs"
    }

    Text {
        id: txtExtractionTime
        x: 335
        y: 240
        color: "#f7f6f6"
        text: qsTr("Extraction Time")
        font.pixelSize: 18
    }

    NumericSelector {
        id: extractionTime
        x: 335
        y: 264
        height: 40
        width: 150
        max: 180
        min: 20
        precision: 0
        increment: 1
        displayText: " Secs"
    }

    Text {
        id: txtTurbulenceOn
        x: 499
        y: 154
        color: "#f7f6f6"
        text: qsTr("Turbulence On")
        font.pixelSize: 18
    }

    NumericSelector {
        id: turbulenceOn
        x: 499
        y: 177
        height: 40
        width: 140
        max: 45
        min: 1
        precision: 0
        increment: 1
        displayText: " Secs"
    }

    Text {
        id: txtTurbulenceOff
        x: 499
        y: 240
        color: "#f7f6f6"
        text: qsTr("Turbulence Off")
        font.pixelSize: 18
    }

    NumericSelector {
        id: turbulenceOff
        x: 499
        y: 264
        height: 40
        width: 140
        max: 40
        min: 1
        precision: 0
        increment: 1
        displayText: " Secs"
    }

    SqLite{
        id: db
    }

    ImageButton {
        id: btnSave
        x: 291
        y: 334
        width: 76
        height: 64
        text: ""
        imageUp: "images/btnSave.png"
        imageDown: "images/btnSaveOff.png"
        onButtonClick: {
            txtMsg.text = "*";

            if (tbName.inputText.trim().length > 0)
            {
                db.openDB();
                var query = "Update recipe set recipeName=?, volume=?, fillPause=?, extractionTime=?," +
                        "turbulenceOn=?, turbulenceOff=?, temp=? Where recipeID=?";
                var res = db.execSql(query, [tbName.inputText, volume.value.toString(), fillPause.value.toString(),
                                             extractionTime.value.toString(), turbulenceOn.value.toString(), turbulenceOff.value.toString(),
                                     temp.value.toString(), root.recipeId]);
                if (res > 0)
                {
                    db.closeDB();

                    Db.recipe = Db.dataList.get(Db.currentIndex);
                    Db.recipe.recipeName = tbName.inputText;
                    Db.recipe.volume = volume.value;
                    Db.recipe.temp = temp.value;
                    Db.recipe.fillPause = fillPause.value;
                    Db.recipe.extractionTime = extractionTime.value;
                    Db.recipe.turbulenceOn = turbulenceOn.value;
                    Db.recipe.turbulenceOff = turbulenceOff.value;

                    root.message("mainview.qml");
                }
                else
                {
                    errorMessage = db.lastError();
                    db.closeDB();
                    opaqueWindow.visible = true;
                    errorWindow.visible = true;
                }


            }
            else
            {
                txtMsg.text = "Required";
            }
        }
    }

    ImageButton {
        id: btnDelete
        x: 371
        y: 334
        width: 76
        height: 64
        text: ""
        imageUp: "images/btnDelete.png"
        imageDown: "images/btnDeleteOff.png"
        onButtonClick: {
            opaqueWindow.visible = true;
            opaqueWindow.z = 32;
            confirmWindow.visible = true;
        }
    }

    ImageButton {
        id: btnCancel
        x: 451
        y: 334
        width: 76
        height: 64
        text: ""
        imageUp: "images/btnCancel.png"
        imageDown: "images/btnCancelOff.png"
        onButtonClick: {
            root.message("mainview.qml")
        }
    }

    Rectangle{
        id: opaqueWindow
        width: parent.width
        height: parent.height
        x:0
        y:0
        visible: false
        color: "#2D2D2D"
        opacity: 0.8

        gradient: Gradient {
            GradientStop {position: 0.0; color: "#2D2D2D"}
            GradientStop {position: 1.0; color: "#666666"}
        }
        z: 10

    }

    Rectangle{
        id: confirmWindow
        width: 300
        height: 200
        border.color: "#000000"
        border.width: 4
        radius: 8
        smooth: true
        visible: false;
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        z: 33

        color: "#2D2D2D"

        gradient: Gradient {
            GradientStop {position: 0.0; color: "#2D2D2D"}
            GradientStop {position: 1.0; color: "#666666"}
        }
        Text{
            id: txtConfirm
            width: parent.width
            text: "Are you sure you wish\n to delete this recipe?"
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
            color: "White"
            x: 0
            y: 42

        }

        ImageButton {
            id: btnConfirmYes
            x: 70
            y: 129
            width: 76
            height: 64
            text: ""
            imageUp: "images/btnYes.png"
            imageDown: "images/btnYesOff.png"
            onButtonClick: {
                //First delete from the database
                db.openDB();
                var res = db.execSql("delete from recipe where recipeId = " + root.recipeId.toString());
                db.closeDB();
                if (res > 0)
                {      
                    Db.dataList.remove(Db.currentIndex);
                    Db.currentIndex = 0;
                    root.message("mainview.qml");
                }
            }
        }

        ImageButton {
            id: btnConfirmNo
            x: 155
            y: 129
            width: 76
            height: 64
            text: ""
            imageUp: "images/btnCancel.png"
            imageDown: "images/btnCancelOff.png"
            onButtonClick: {
                opaqueWindow.z = 10;
                opaqueWindow.visible = false;
                confirmWindow.visible = false;
            }
        }

    }

    Rectangle{
        id: errorWindow
        width: 300
        height: 200
        border.color: "#000000"
        border.width: 4
        radius: 8
        smooth: true
        visible: false;
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        z: 33

        color: "#2D2D2D"

        gradient: Gradient {
            GradientStop {position: 0.0; color: "#2D2D2D"}
            GradientStop {position: 1.0; color: "#666666"}
        }
        Text{
            id: txtError
            width: parent.width
            height: 95
            text: "An error occurred: \n" + errorMessage
            wrapMode: Text.WordWrap
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
            color: "White"
            x: 0
            y: 18

        }


        ImageButton {
            id: btnErrorCancel
            x: 117
            y: 132
            width: 76
            height: 64
            text: ""
            imageUp: "images/btnCancel.png"
            imageDown: "images/btnCancelOff.png"
            onButtonClick: {
                errorWindow.z = 10;
                errorWindow.visible = false;
                opaqueWindow.visible = false;
            }
        }

    }

    Text {
        id: text1
        x: 0
        y: 49
        width: 800
        height: 24
        color: "#ffffff"
        text: qsTr("Edit a Coffee Recipe")
        font.bold: false
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 20
    }

    Component.onCompleted: {
        //Initialize components
        Db.recipe = Db.dataList.get(Db.currentIndex);
        root.recipeId = Db.recipe.recipeId;
        tbName.inputText = Db.recipe.recipeName;
        volume.value = Db.recipe.volume;
        temp.value = Db.recipe.temp;
        fillPause.value = Db.recipe.fillPause;
        extractionTime.value = Db.recipe.extractionTime;
        turbulenceOn.value = Db.recipe.turbulenceOn;
        turbulenceOff.value = Db.recipe.turbulenceOff;

        //Position the delete and cancel buttons
        if (Db.recipe.machineRecipe === 1)
        {
            //hide delete button
            btnDelete.visible = false;
            btnCancel.x = 416;
            btnSave.x = 336;
        }

    }
}



