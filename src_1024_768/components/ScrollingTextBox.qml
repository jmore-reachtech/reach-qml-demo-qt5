import QtQuick 2.0

Rectangle {
    id:main
    width:300; height:300
    property int borderWidth: 4
    property string borderColor: "#000000"
    radius: 2
    property int textMargins: 4
    border.width: borderWidth
    border.color: borderColor

    Rectangle {
        id:screen
        width:main.width-main.border.width; height:main.height - main.border.width
        anchors.centerIn : parent

        Flickable {
            id: flickArea
             anchors.fill: parent
             anchors.margins: main.textMargins
             contentWidth: text.width; contentHeight: text.height
             flickableDirection: Flickable.VerticalFlick
             clip: true


             TextEdit{
                  id: text
                   wrapMode: TextEdit.Wrap
                   width: screen.width;
                   readOnly:true

                   text:  "Text goes here\nText goes here\nText goes here\nText goes here\nText goes here\nText goes here\nText goes here\nText goes here\nText goes here\nText goes here\nText goes here\nText goes here\nText goes here\nText goes here\nText goes here\nText goes here\nText goes here\nText goes here\nText goes here\nText goes here\nText goes here\nText goes here\nText goes here\nText goes here\nText goes here\nText goes here\nText goes here\nText goes here\nText goes here\nText goes here\nText goes here\nText goes here\nText goes here\nText goes here\nText goes here\nText goes here\nText goes here\nText goes here\nText goes here\nText goes here\nText goes here\nText goes here\nText goes here\nText goes here\nText goes here\nText goes here\nText goes here\nText goes here\nText goes here"
            }
        }
    }
}
