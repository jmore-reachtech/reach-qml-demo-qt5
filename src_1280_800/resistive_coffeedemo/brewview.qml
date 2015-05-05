import QtQuick 2.0
import "../components"
import "js/dataModel.js" as Db


Rectangle {
    width: 1280
    height: 800
    id: root
    color: "#666666"

    signal message(string msg)

    Text {
        id: textTitle
        x: 0
        y: 203
        width: 1280
        height: 66
        color: "#ffffff"
        text: ""
        font.underline: false
        font.pixelSize: 30
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        style: Text.Normal
        font.bold: true
        horizontalAlignment: Text.AlignHCenter

        ProgressBar{
            id: progress
            x: 342
            y: 152
            width: 597
            height: 37

        }
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
        x: 602
        y: 455
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

