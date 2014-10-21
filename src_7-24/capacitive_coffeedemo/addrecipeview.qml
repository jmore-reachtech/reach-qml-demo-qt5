import QtQuick 2.0
import "../components"
import "js/dataModel.js" as Db

Rectangle {
    width: 800
    height: 480
    id: root
    color: "#666666"
    property string errorMessage: ""
    property int count

    signal message(string msg)

    AlphaField {
        id: tbName
        x: 188
        y: 87
        width: 362
        height: 34
        keyboardBackGroundImage: "images/keyboardbg.png"
        normalKeyIcon: "images/key1_off.png"
        pressedKeyIcon: "images/key1_on.png"
        fieldSpacing: 16
        inputText: ""
        keyTextColor: "#000000"
        keyTextBold: false
        keyHeight: 44
        keyWidth: 42
        keyTextFontSize: 14
        inputColor: "#ffffff"
        labelColor: "#f7f6f6"
        inputFontPixelSize: 18
        keyboardAnimationSpeed: 100
        inputFontFamily: "DejaVu Sans"
        labelFontFamily: "Arial"
        labelFontPixelSize: 18
        labelText: "Name"
        z: 30
    }

    Text {
        id: txtMsg
        x: 565
        y: 95
        color: "Red"
        text: qsTr("*")
        font.family: "DejaVu Serif"
        font.pixelSize: 14
        z: 30
    }

    Text {
        id: txtVolume
        x: 187
        y: 138
        color: "#f7f6f6"
        text: qsTr("Volume")
        font.pixelSize: 18
    }

    NumericSelector {
        id: volume
        x: 188
        y: 161
        height: 40
        width: 130
        max: 16
        min: 2
        displayText: " OZ"
    }

    Text {
        id: txtTemp
        x: 187
        y: 224
        color: "#f7f6f6"
        text: qsTr("Temperature")
        font.pixelSize: 18
    }

    NumericSelector {
        id: temp
        x: 190
        y: 248
        height: 40
        width: 130
        max: 208
        min: 165
        increment: 1
        displayText: qsTr("<sup>o</sup>F")
    }


    Text {
        id: txtFillPause
        x: 333
        y: 139
        color: "#f7f6f6"
        text: qsTr("Fill Pause")
        font.pixelSize: 18
    }

    NumericSelector {
        id: fillPause
        x: 333
        y: 161
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
        y: 224
        color: "#f7f6f6"
        text: qsTr("Extraction Time")
        font.pixelSize: 18
    }

    NumericSelector {
        id: extractionTime
        x: 335
        y: 248
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
        x: 497
        y: 138
        color: "#f7f6f6"
        text: qsTr("Turbulence On")
        font.pixelSize: 18
    }

    NumericSelector {
        id: turbulenceOn
        x: 497
        y: 161
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
        y: 224
        color: "#f7f6f6"
        text: qsTr("Turbulence Off")
        font.pixelSize: 18
    }

    NumericSelector {
        id: turbulenceOff
        x: 499
        y: 248
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
        x: 336
        y: 318
        width: 76
        height: 64
        text: ""
        imageUp: "images/btnSave.png"
        imageDown: "images/btnSaveOff.png"
        onButtonClick: {
            txtMsg.text = "*";
            if (tbName.inputText.trim().length > 0)
            {
                var error = "";
                db.openDB();
                //Insert recipe to the database and get the ID
                var res = db.execSql("insert into recipe (machineRecipe, recipeName, volume, fillPause, extractionTime, turbulenceOn, turbulenceOff, temp)" +
                                     " values(?, ?, ?, ?, ?, ?, ?, ?)", ["0", tbName.inputText, volume.value.toString(), fillPause.value.toString(), extractionTime.value.toString(),
                                     turbulenceOn.value.toString(), turbulenceOff.value.toString(), temp.value.toString()]);

                if (res === 0)
                    error = db.lastError();

                //Get last recipeID in the table
                var row = db.getRows("Select max(recipeID) from recipe");
                var data = row[0];
                var recipeId = data[0];

                db.closeDB();

                if (res > 0)
                {           
                    //Add an item to Db.datalist
                    Db.dataList.append({recipeId: parseInt(recipeId), recipeName: tbName.inputText, volume: volume.value, fillPause: fillPause.value,
                                       extractionTime: extractionTime.value, turbulenceOn: turbulenceOn.value, turbulenceOff: turbulenceOff.value,
                                       temp: temp.value, machineRecipe: 0});
                    Db.currentIndex = Db.dataList.count-1;
                    root.message("add");
                }
                else
                {
                    //Show error here
                    tbName.visible = false;           
                    txtMsg.visible = false;
                    errorMessage = error;
                    errorWindow.visible = true;
                    opaqueWindow.visible = true;
                }
            }
            else
            {
                txtMsg.text = "Required";
            }

        }
    }

    ImageButton {
        id: btnCancel
        x: 416
        y: 318
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
        opacity: 1.0

        gradient: Gradient {
            GradientStop {position: 0.0; color: "#2D2D2D"}
            GradientStop {position: 1.0; color: "#666666"}
        }
    }


    Rectangle{
        id: errorWindow
        width: 300
        height: 240
        border.color: "#000000"
        border.width: 4
        radius: 8
        smooth: true
        visible: false;
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        color: "#2D2D2D"

        gradient: Gradient {
            GradientStop {position: 0.0; color: "#2D2D2D"}
            GradientStop {position: 1.0; color: "#666666"}
        }
        Text{
            id: txtError
            width: parent.width
            height: 95
            text: "An error occurred: Duplicate entry.  TRy another name\n"
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
                tbName.visible = true;
                txtMsg.visible = true;
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
        text: qsTr("Add a Coffee Recipe")
        font.bold: false
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 20
    }

    Component.onCompleted: {
        volume.value = 8;
        temp.value = 200;
        fillPause.value = 5;
        extractionTime.value = 45;
        turbulenceOn.value = 5;
        turbulenceOff.value = 10;
        db.openDB();
        var row = db.getRows("select count(recipeId) from recipe");
        var data = row[0];
        root.count = data[0];
        db.closeDB();
    }

}



