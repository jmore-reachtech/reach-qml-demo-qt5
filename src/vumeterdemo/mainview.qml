import QtQuick 2.0
import "../components"

Rectangle {
    id: root
    width: 640
    height: 480
    gradient: Gradient {
        GradientStop {
            position: 0.16
            color: "#afacac"
        }

        GradientStop {
            position: 1
            color: "#000000"
        }
    }

    signal message(string msg)

    VUMeter {
        id: vu_meter1
        x: 98
        y: 119
        width: 377
        height: 242
        needleImage: "../images/vu_needle.png"
        overlayImageHeight: 26
        needleImageHeight: 139
        overlayImage: "../images/vu_overlay.png"
        value: -20
        needleImageWidth: 8
        needleRotationY: 139
        needleRotationX: 4
        overlayY: 191
        overlayImageWidth: 39
        overlayX: 168
        needleY: 57
        needleX: 181
        backgroundImage: "../images/vu_background.png"

        Spinner {
            id: spinner2
            x: 395
            y: 2
            width: 68
            height: 187
            color: "#ffffff"
            radius: 2
            initialIndex: 0
            textColor: "#000000"
            font.pixelSize: 25
            border.color: "#000000"
            border.width: 3
            backGroundImage: "images/spinner-bg.png"
            highlightImage: "images/spinner-select.png"
            font.bold: false
            font.family: "Arial"
            model: ListModel {
                ListElement {
                    text: "-20"
                    value: -20
                }
                ListElement {
                    text: "-19"
                    value: -19
                }
                ListElement {
                    text: "-18"
                    value: -18
                }
                ListElement {
                    text: "-17"
                    value: -17
                }
                ListElement {
                    text: "-16"
                    value: -16
                }
                ListElement {
                    text: "-15"
                    value: -15
                }
                ListElement {
                    text: "-14"
                    value: -14
                }
                ListElement {
                    text: "-13"
                    value: -13
                }
                ListElement {
                    text: "-12"
                    value: -12
                }
                ListElement {
                    text: "-11"
                    value: -11
                }
                ListElement {
                    text: "-10"
                    value: -10
                }
                ListElement {
                    text: "-9"
                    value: -9
                }
                ListElement {
                    text: "-8"
                    value: -8
                }
                ListElement {
                    text: "-7"
                    value: -7
                }
                ListElement {
                    text: "-6"
                    value: -6
                }
                ListElement {
                    text: "-5"
                    value: -5
                }
                ListElement {
                    text: "-4"
                    value: -4
                }
                ListElement {
                    text: "-3"
                    value: -3
                }
                ListElement {
                    text: "-2"
                    value: -2
                }
                ListElement {
                    text: "-1"
                    value: -1
                }
                ListElement {
                    text: "0"
                    value: 0
                }
                ListElement {
                    text: "1"
                    value: 1
                }
                ListElement {
                    text: "2"
                    value: 2
                }
                ListElement {
                    text: "3"
                    value: 3
                }
            }

            itemHeight: 29

            onCurrentIndexChanged: {
                vu_meter1.value = spinner2.model.get(currentIndex).value;
            }
        }
    }

    ImageButton {
        id: quitButton
        x: 503
        y: 398
        width: 48
        height: 48
        text: ""
        imageDown: "../images/quit_down.png"
        imageUp: "../images/quit_up.png"
        onButtonClick: root.message("../src/mainmenu.qml");
    }


}
