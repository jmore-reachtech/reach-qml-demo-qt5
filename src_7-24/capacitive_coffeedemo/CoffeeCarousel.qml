import QtQuick 2.0

Item {
    width: 800
    height: 292
    property ListModel items: ListModel {}
    property int currentIndex: view.currentIndex

    PathView {
        id: view
        width: parent.width
        height: parent.height + y
        y: -33
        focus: true
        model: items
        delegate: del
        path: p
    }

    function setCurrentIndex(val)
    {
        view.currentIndex = val;
    }

    Component {
        id: del
            Image {
                id: wrapper
                //anchors.horizontalCenter: delegateText.horizontalCenter
                width: 200; height:119
                smooth: true
                source: "images/coffee_cup_small.png"
                scale: 2.3 * y / view.height * 6.0 / items.count
                z: y
                opacity: scale / 1.3
                asynchronous: true

                Text {
                    id: delegateText
                    text: recipeName
                    width: 110
                    wrapMode: Text.Wrap
                    font.pixelSize: 18
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.horizontalCenterOffset: -18
                    anchors.verticalCenterOffset: -16
                    smooth: true
                    color: wrapper.PathView.isCurrentItem ? "white" : "black"
                }
            }

           
    }


    Path {
        id: p
        property real width: view.width
        property real height: view.height
        property real margin: 50
        property real cx: width / 2
        property real cy: height / 2
        property real rx: width / 2 - margin
        property real ry: height / 2 - margin
        property real mx: rx * magic
        property real my: ry * magic
        property real magic: 0.551784
        startX: p.cx; startY: p.cy + p.ry
        PathCubic { // second quadrant arc
            control1X: p.cx - p.mx; control1Y: p.cy + p.ry
            control2X: p.cx - p.rx; control2Y: p.cy + p.my
            x: p.cx - p.rx; y: p.cy
        }
        PathCubic { // third quadrant arc
            control1X: p.cx - p.rx; control1Y: p.cy - p.my
            control2X: p.cx - p.mx; control2Y: p.cy - p.ry
            x: p.cx; y: p.cy - p.ry
        }
        PathCubic { // forth quadrant arc
            control1X: p.cx + p.mx; control1Y: p.cy - p.ry
            control2X: p.cx + p.rx; control2Y: p.cy - p.my
            x: p.cx + p.rx; y: p.cy
        }
        PathCubic { // first quadrant arc
            control1X: p.cx + p.rx; control1Y: p.cy + p.my
            control2X: p.cx + p.mx; control2Y: p.cy + p.ry
            x: p.cx; y: p.cy + p.ry
        }
    }


 }

