// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 2.0

ListModel{
    id: coffeeItems

    ListElement {
        recipeId: 0
        machineRecipe: 1
        recipeName: "House Special"
        volume: 8
        preWet: 0.0
        preInfusion: 10
        fillPause: 5
        extractionTime: 45
        turbulenceOn: 5
        turbulenceOff: 10
        turbulencePower: 4
        pressOutPower: 7
        pressOutTime: 60
        temp: 200
    }

    ListElement {
        recipeId: 1
        machineRecipe: 1
        recipeName: "Kona"
        volume: 8
        preWet: 0.0
        preInfusion: 10
        fillPause: 5
        extractionTime: 45
        turbulenceOn: 5
        turbulenceOff: 10
        turbulencePower: 4
        pressOutPower: 7
        pressOutTime: 60
        temp: 200
    }

}
