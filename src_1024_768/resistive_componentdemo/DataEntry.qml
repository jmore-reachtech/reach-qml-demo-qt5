import QtQuick 2.0
import "../components"

Rectangle {
    id: root
    objectName: "root"
    width: 1024
    height: 768
    color: "#666666"
    signal message(string msg)

    Text {
        id: txtTitle
        x: 0
        y: 89
        width: 1024
        height: 32
        text: qsTr("Data Entry")
        horizontalAlignment: Text.AlignHCenter
        font.bold: false
        font.pixelSize: 30
    }

    AlphaField {
        id: tbName
        x: 361
        y: 173
        width: 302
        height: 34
        labelFontBold: false
        keyboardBackGroundImage: "images/keyboardbg.png"
        normalKeyIcon: "images/key1_off.png"
        pressedKeyIcon: "images/key1_on.png"
        fieldSpacing: 6
        inputText: ""
        keyTextColor: "#000000"
        keyTextBold: false
        keyHeight: 48
        keyWidth: 46
        keyTextFontSize: 16
        inputColor: "#ffffff"
        labelColor: "#000000"
        inputFontPixelSize: 20
        keyboardAnimationSpeed: 100
        inputFontFamily: "DejaVu Sans"
        labelFontFamily: "DejaVu Sans"
        labelFontPixelSize: 20
        labelText: "Name"
        z: 30
    }

    NumericField {
        id: tbAge
        x: 361
        y: 252
        width: 180
        normalKeyIcon: "images/key1_off.png"
        pressedKeyIcon: "images/key1_on.png"
        max: 100
        fieldSpacing: 18
        min: 0
        inputText: ""
        keyTextColor: "#000000"
        keyTextBold: false
        keyTextFontSize: 16
        keyWidth: 46
        keyHeight: 48
        inputColor: "#ffffff"
        labelColor: "#000000"
        inputFontPixelSize: 20
        keyboardAnimationSpeed: 100
        inputFontFamily: "DejaVu Sans"
        labelFontFamily: "DejaVu Sans"
        labelFontPixelSize: 20
        labelText: "Age"
    }

    VerticalRadioButtonList {
        id: rbProduct
        x: 359
        y: 366
        spacing: 5
        imageHeight: 36
        imageWidth: 36
        itemSpacing: 8
        font.pixelSize: 20
        textColor: "#000000"
        font.family: "DejaVu Sans"
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
        x: 359
        y: 326
        text: qsTr("Product Code")
        font.pixelSize: 20
    }

    Text {
        id: text2
        x: 527
        y: 326
        text: qsTr("Where did you buy this product?")
        font.pixelSize: 20
    }

    VerticalCheckBoxList {
        id: clStore
        x: 527
        y: 366
        width: 74
        height: 91
        spacing: 6
        itemSpacing: 9
        imageWidth: 36
        imageHeight: 36
        font.pixelSize: 18
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
        x: 361
        y: 516
        width: 79
        height: 40
        font.pixelSize: 20
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
