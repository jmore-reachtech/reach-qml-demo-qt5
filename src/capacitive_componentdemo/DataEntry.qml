import QtQuick 1.1
import "../components"

Rectangle {
    id: root
    objectName: "root"
    width: 480
    height: 272
    color: "#666666"
    signal message(string msg)

    gradient: Gradient {
        GradientStop {position: 0.0; color: "#666666"}
        GradientStop {position: 1.0; color: "#EEEEEE"}
    }

    Text {
        id: txtTitle
        x: 0
        y: 8
        width: 480
        height: 25
        text: qsTr("Data Entry")
        horizontalAlignment: Text.AlignHCenter
        font.bold: false
        font.pixelSize: 21
    }

    AlphaField {
        id: tbName
        x: 63
        y: 39
        width: 302
        height: 34
        labelFontBold: false
        keyboardBackGroundImage: "images/keyboardbg.png"
        normalKeyIcon: "images/key1_off.png"
        pressedKeyIcon: "images/key1_on.png"
        fieldSpacing: 7
        inputText: ""
        keyTextColor: "#000000"
        keyTextBold: false
        keyHeight: 44
        keyWidth: 42
        keyTextFontSize: 14
        inputColor: "#ffffff"
        labelColor: "#000000"
        inputFontPixelSize: 14
        keyboardAnimationSpeed: 100
        inputFontFamily: "Arial"
        labelFontFamily: "Arial"
        labelFontPixelSize: 14
        labelText: "Name"
        z: 30
    }

    NumericField {
        id: tbAge
        x: 63
        y: 75
        width: 180
        normalKeyIcon: "images/key1_off.png"
        pressedKeyIcon: "images/key1_on.png"
        max: 100
        fieldSpacing: 18
        min: 0
        inputText: ""
        keyTextColor: "#000000"
        keyTextBold: false
        keyTextFontSize: 14
        keyWidth: 44
        keyHeight: 42
        inputColor: "#ffffff"
        labelColor: "#000000"
        inputFontPixelSize: 14
        keyboardAnimationSpeed: 100
        inputFontFamily: "Arial"
        labelFontFamily: "Arial"
        labelFontPixelSize: 14
        labelText: "Age"
    }

    VerticalRadioButtonList {
        id: rbProduct
        x: 63
        y: 132
        spacing: 4
        imageHeight: 24
        imageWidth: 24
        itemSpacing: 3
        font.pixelSize: 14
        textColor: "#000000"
        font.family: "Arial"
        font.bold: false
        model: ListModel {
            ListElement {
                item_value: "1"
                item_checked: true
                item_text: "PDWZ100"
            }

            ListElement {
                item_value: "2"
                item_checked: false
                item_text: "PDWZ200"
            }
        }
        imageUnChecked: "images/radiobutton.png"
        imageChecked: "images/radiobutton_click.png"
    }

    Text {
        id: text1
        x: 61
        y: 110
        text: qsTr("Product Code")
        font.pixelSize: 14
    }

    Text {
        id: text2
        x: 229
        y: 110
        text: qsTr("Where did you buy this product?")
        font.pixelSize: 14
    }

    VerticalCheckBoxList {
        id: clStore
        x: 229
        y: 132
        width: 74
        height: 91
        spacing: 6
        itemSpacing: 4
        imageWidth: 24
        imageHeight: 24
        font.pixelSize: 14
        textColor: "#000000"
        font.family: "Arial"
        font.bold: false
        model: ListModel {
            ListElement {
                item_value: "1"
                item_checked: true
                item_text: "Store 1"
            }

            ListElement {
                item_value: "2"
                item_checked: false
                item_text: "Store 2"
            }
            ListElement {
                item_value: "3"
                item_checked: false
                item_text: "Store 3"
            }
        }
        imageUnChecked: "images/checkbox.png"
        imageChecked: "images/checkbox_click.png"
    }

    ImageButton{
        x: 61
        y: 216
        width: 64
        height: 33
        text: "Save"
        imageUp: "images/internal_button_up.bmp"
        imageDown: "images/internal_button_dn.bmp"

        onButtonClick: {
            console.debug("Name: " + tbName.inputText);
            console.debug("Age: " + tbAge.value);
            console.debug("Product: " + rbProduct.value);
            console.debug("Stores:");
            for (var i=0; i < clStore.values.count; i++)
            {
                console.debug(clStore.values.get(i).value);
            }
        }

    }

}
