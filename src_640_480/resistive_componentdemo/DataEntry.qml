import QtQuick 2.0
import "../components"

Rectangle {
    id: root
    objectName: "root"
    width: 640
    height: 480
    color: "#666666"
    signal message(string msg)

    Text {
        id: txtTitle
        x: 0
        y: 71
        width: 640
        height: 25
        text: qsTr("Data Entry")
        horizontalAlignment: Text.AlignHCenter
        font.bold: false
        font.pixelSize: 24
    }

    AlphaField {
        id: tbName
        x: 169
        y: 122
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
        keyHeight: 48
        keyWidth: 46
        keyTextFontSize: 18
        inputColor: "#ffffff"
        labelColor: "#000000"
        inputFontPixelSize: 20
        keyboardAnimationSpeed: 100
        inputFontFamily: "DejaVu Sans"
        labelFontFamily: "DejaVu Sans"
        labelFontPixelSize: 18
        labelText: "Name"
        z: 30
    }

    NumericField {
        id: tbAge
        x: 169
        y: 173
        width: 180
        normalKeyIcon: "images/key1_off.png"
        pressedKeyIcon: "images/key1_on.png"
        max: 100
        fieldSpacing: 7
        min: 0
        inputText: ""
        keyTextColor: "#000000"
        keyTextBold: false
        keyTextFontSize: 18
        keyWidth: 48
        keyHeight: 46
        inputColor: "#ffffff"
        labelColor: "#000000"
        inputFontPixelSize: 20
        keyboardAnimationSpeed: 100
        inputFontFamily: "DejaVu Sans"
        labelFontFamily: "DejaVu Sans"
        labelFontPixelSize: 18
        labelText: "Age"
    }

    VerticalRadioButtonList {
        id: rbProduct
        x: 169
        y: 248
        spacing: 5
        imageHeight: 30
        imageWidth: 30
        itemSpacing: 10
        font.pixelSize: 18
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
        x: 167
        y: 220
        text: qsTr("Product Code")
        font.pixelSize: 18
    }

    Text {
        id: text2
        x: 335
        y: 220
        text: qsTr("Where did you buy this product?")
        font.pixelSize: 18
    }

    VerticalCheckBoxList {
        id: clStore
        x: 335
        y: 248
        width: 74
        height: 91
        spacing: 6
        itemSpacing: 10
        imageWidth: 30
        imageHeight: 30
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
        x: 169
        y: 354
        width: 64
        height: 33
        text: "Save"
        imageUp: "images/internal_button_up.bmp"
        imageDown: "images/internal_button_dn.bmp"
        font.pixelSize: 16

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
