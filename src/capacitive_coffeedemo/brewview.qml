import QtQuick 2.0
import "../components"
import "js/dataModel.js" as Db


Rectangle {
    width: 480
    height: 272
    id: root
    color: "#666666"

    signal message(string msg)

    Text {
        id: textTitle
        x: 0
        y: 41
        width: 480
        color: "#ffffff"
        text: ""
        font.underline: false
        font.pixelSize: 18
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        style: Text.Normal
        font.bold: true
        horizontalAlignment: Text.AlignHCenter
    }

    ProgressBar{
        id: progress
        x: 50
        y: 125
        width: 381
        height: 23

    }

    Timer{
        id: timer

        interval: 100; running: true; repeat: true
        onTriggered: {
            progress.value += 2;
            if (progress.value == progress.maximum)
            {
                timer.stop();
                root.message("capacitive_coffeedemo/mainview.qml")
            }
        }
    }

    ImageButton {
        id: btnCancel
        x: 208
        y: 202
        width: 76
        height: 64
        text: ""
        imageUp: "images/btnCancel.png"
        imageDown: "images/btnCancelOff.png"
        onButtonClick: {
            if (typeof connection === "undefined")
                console.debug("brew=0");
            else
                connection.sendMessage("brew=0");
            root.message("mainview.qml");
        }
    }

    Component.onCompleted: {
        if (Db.dataList.get(Db.currentIndex).volume == 8 || Db.dataList.get(Db.currentIndex).volume == 11)
            textTitle.text = "Brewing an " + Db.dataList.get(Db.currentIndex).volume + "oz cup of "
                             + Db.dataList.get(Db.currentIndex).recipeName + " please wait...";
        else
            textTitle.text = "Brewing a " + Db.dataList.get(Db.currentIndex).volume + "oz cup of "
                             + Db.dataList.get(Db.currentIndex).recipeName + " please wait...";

        //Send data to console
        var recipe = Db.dataList.get(Db.currentIndex);

        if (typeof connection === "undefined")
        {
            console.debug("&recipeid=" + recipe.recipeId + "&recipeName=" + encodeURIComponent(recipe.recipeName) +
                "&volume=" + encodeURIComponent(recipe.volume) + "&fillPause=" + encodeURIComponent(recipe.fillPause) +
                "&extractionTime=" + encodeURIComponent(recipe.extractionTime) + "&turbulenceOn=" + encodeURIComponent(recipe.turbulenceOn) +
                "&turbulenceOff=" + encodeURIComponent(recipe.turbulenceOff) + "&temp=" +  encodeURIComponent(recipe.temp));
        }
        else
        {
            connection.sendMessage
                (
                    "brew="+recipe.recipeId + "," +
                    recipe.volume + "," +
                    recipe.fillPause + "," +
                    recipe.extractionTime + "," +
                    recipe.turbulenceOn + "," +
                    recipe.turbulenceOff + "," +
                    recipe.temp
                 )

        }
    }
}

