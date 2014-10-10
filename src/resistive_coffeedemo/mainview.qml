import QtQuick 1.1
import "../components"
import "js/dataModel.js" as Db


Rectangle {
    width: 480
    height: 272
    id: mainView
    color: "#2D2D2D"
    signal message(string msg)

    gradient: Gradient {
        GradientStop {position: 0.0; color: "#666666"}
        GradientStop {position: 1.0; color: "#EEEEEE"}
    }


    CoffeeCarousel {
        id: imagecarousel1
        x: 0
        y: 40
        width: 480
        height: 180

        onCurrentIndexChanged: {
            if (imagecarousel1.currentIndex >= 0)
            {
                Db.currentIndex = imagecarousel1.currentIndex;
            }
        }
    }

    ImageButton {
        id: btnSettings
        x: 27
        y: 191
        width: 76
        height: 64
        text: ""
        imageUp: "images/btnSettings.png"
        imageDown: "images/btnSettingsOff.png"

        onButtonClick: {
            load.source = "settingsview.qml";
        }
    }

    ImageButton {
        id: btnRinse
        objectName: "btnRinse"
        x: 98
        y: 191
        text: ""
        width: 76
        height: 64
        imageUp: "images/btnRinse.png"
        imageDown: "images/btnRinseOff.png"

        onButtonClick: {
            load.source = "rinseview.qml";
        }
    }

    ImageButton {
        id: btnBrew
        x: 168
        y: 191
        text: ""
        width: 76
        height: 64
        imageUp: "images/btnBrew.png"
        imageDown: "images/btnBrewOff.png"

        onButtonClick: {
            Db.currentIndex = imagecarousel1.currentIndex;
            load.source = "brewview.qml";
        }
    }

    ImageButton {
        id: btnEdit
        x: 238
        y: 191
        width: 76
        height: 64
        text: ""
        imageUp: "images/btnEdit.png"
        imageDown: "images/btnEditOff.png"
        onButtonClick: {
            Db.currentIndex = imagecarousel1.currentIndex;
            load.source = "recipeview.qml";        }
    }

    ImageButton {
        id: btnAdd
        x: 308
        y: 191
        width: 76
        height: 64
        text: ""
        imageUp: "images/btnAdd.png"
        imageDown: "images/btnAddOff.png"
        onButtonClick: {
            load.source = "addrecipeview.qml";
        }
    }

    ImageButton {
        id: btnQuit
        x: 378
        y: 191
        width: 76
        height: 64
        text: ""
        imageUp: "images/btnCancel.png"
        imageDown: "images/btnCancelOff.png"
        onButtonClick: {
            mainView.message("../src/mainmenu.qml");
        }
    }

    DataModel
    {
        id: items
    }

    SqLite{
        id: db
    }

    function createRecipeTable()
    {
        return db.execSql("CREATE TABLE IF NOT EXISTS recipe (recipeId INTEGER PRIMARY KEY AUTOINCREMENT, machineRecipe BOOLEAN, recipeName TEXT UNIQUE, volume REAL, fillPause REAL, extractionTime REAL, turbulenceOn REAL, turbulenceOff REAL, temp REAL)");

    }

    function getRecipeCount()
    {
        var row = db.getRows("select count(recipeId) from recipe");
        var data = row[0];
        return parseInt(data[0]);
    }

    function insertRecipes()
    {
        db.execSql("insert into recipe (machineRecipe, recipeName, volume, fillPause, extractionTime, turbulenceOn, turbulenceOff, temp) values(1, \"House Special\", 8, 5, 45, 10, 4, 200);");
        db.execSql("insert into recipe (machineRecipe, recipeName, volume, fillPause, extractionTime, turbulenceOn, turbulenceOff, temp) values(1, \"Decaf\", 8, 5, 45, 10, 4, 200);");
        db.execSql("insert into recipe (machineRecipe, recipeName, volume, fillPause, extractionTime, turbulenceOn, turbulenceOff, temp) values(1, \"Decaf\", 8, 5, 45, 10, 4, 200);");
        db.execSql("insert into recipe (machineRecipe, recipeName, volume, fillPause, extractionTime, turbulenceOn, turbulenceOff, temp) values(1, \"Columbia\", 8, 5, 45, 10, 4, 200);");
        db.execSql("insert into recipe (machineRecipe, recipeName, volume, fillPause, extractionTime, turbulenceOn, turbulenceOff, temp) values(1, \"Costa Rica\", 8, 5, 45, 10, 4, 200);");
        db.execSql("insert into recipe (machineRecipe, recipeName, volume, fillPause, extractionTime, turbulenceOn, turbulenceOff, temp) values(1, \"Ethiopia\", 8, 5, 45, 10, 4, 200);");
        db.execSql("insert into recipe (machineRecipe, recipeName, volume, fillPause, extractionTime, turbulenceOn, turbulenceOff, temp) values(1, \"Kona\", 8, 5, 45, 10, 4, 200);");
    }

    function loadRecipes()
    {
        var rows = db.getRows("select recipeId, recipeName, volume, fillPause, extractionTime, turbulenceOn, turbulenceOff, temp, machineRecipe from recipe");
        for (var i=0; i < rows.length; i++)
        {
            var data = rows[i];
            Db.dataList.append({recipeId: data[0], recipeName: data[1], volume: data[2], fillPause: data[3], extractionTime: data[4], turbulenceOn: data[5], turbulenceOff: data[6], temp: data[7], machineRecipe: data[8] });
        }
    }

    Loader{
        id: load
    }

    Connections {
        target: load.item
        onMessage: {
            if (msg == "add")
                 imagecarousel1.setCurrentIndex(Db.currentIndex);
            load.source = "";
        }
    }

    Component.onCompleted: {
        Db.dataList = items;
        Db.dataList.clear();
        //Open database connection
        var r = db.openDB();

        //create the recipe table for application use
        if (r)
        {
            createRecipeTable();
            if (getRecipeCount() === 0)
            {
                insertRecipes();
            }

            //load recipes
            Db.dataList.clear();
            loadRecipes();

        }

        var currentIndex = parseInt(db.getSetting("currentIndex"));
        db.closeDB();

        if (currentIndex && currentIndex >= 0)
        {
            Db.currentIndex = currentIndex;
        }
        else
        {
            Db.currentIndex = 0;
        }


        imagecarousel1.items = Db.dataList;
        imagecarousel1.setCurrentIndex(Db.currentIndex);
    }

}
