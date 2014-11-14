import QtQuick 2.0
import "../components"

Rectangle {
    id: root
    objectName: "root"
    width: 640
    height: 480
    property int page: 0
    property string swipe

    color: "#666666"
    signal message(string msg)

    // Put the name of the QML files containing your pages (without the '.qml')
    property variant pagesList  : [
      "Buttons1",
      "Buttons2",
      "Sliders",
      "Indicators1",
      "Indicators2",
      "DataEntry",
      "Knobs",
      "Meters"
    ];

    // Set this property to another file name to change page
    property string  currentPage : "";

    // function to switch view on swipe
    function onLeftSwipe() {
        root.page += 1;
        if (root.page > repeater.count-1)
            root.page = repeater.count-1;
        currentPage = repeater.itemAt(root.page).pageName;
    }

    function onRightSwipe() {
        root.page -= 1;
        if (root.page < 0)
            root.page = 0;
        currentPage = repeater.itemAt(root.page).pageName;
    }

    // swipe detection code
    MouseArea {
        id: mouseArea
        anchors.fill: parent;

        property int oldX: 0
        property int oldY: 0

      onPressed: {
        oldX = mouseX;
        oldY = mouseY;
      }

      onReleased: {
          var xDiff = oldX - mouseX;
          var yDiff = oldY - mouseY;

          if(Math.abs(xDiff) > 10 && Math.abs(xDiff) > Math.abs(yDiff) ) {
              if( oldX > mouseX) {
                  imgSwipe.x = 0;
                  imgSwipe.y = root.height - imgSwipe.height - 4;
                  imgSwipe.source = "images/right_swipe.png";
                  imgSwipe.visible = true;
                  root.swipe = "left";
                  timer1.start();
              } else {
                  imgSwipe.x = root.width - imgSwipe.width;
                  imgSwipe.y = root.height - imgSwipe.height - 4;
                  imgSwipe.source = "images/left_swipe.png";
                  imgSwipe.visible = true;
                  root.swipe = "right";
                  timer1.start();
              }
          } else {
              if( oldY > mouseY) {/*up*/ }
              else {/*down*/ }
          }
       }
    }

    Repeater {
        id: repeater
        model: pagesList;
        delegate: Loader {
            id: loader
            property string pageName: modelData
            property bool beenLoaded: false
            anchors.fill: parent
            visible: (currentPage === modelData);
            //source: "%1.qml".arg(modelData)
            onVisibleChanged: {
                if (visible && !beenLoaded)
                {
                    source = "%1.qml".arg(pageName);
                    beenLoaded = true;
                }
            }

        }
    }

    Rectangle {
        id: rectPager
        width: root.width
        height: 30
        color: "transparent"
        anchors.bottom: root.bottom

        Row{
            id: rowPager
            spacing: 10
            anchors.centerIn: parent

        }
    }


    BorderImage {
        id: imgSwipe
        x: 41
        y: 146
        width: 34
        height: 28
        visible: false
        smooth: true
        source: "images/right_swipe.png"
    }

    Timer{
        id: timer1
        interval: 100; running: false; repeat: false
        onTriggered: {
            imgSwipe.visible = false;
            if (root.swipe == "left")
                onLeftSwipe();
            else
                onRightSwipe();
            updatePageIndicator();
        }
    }

    function createPageIndicator()
    {
        for (var i=0; i < repeater.count; i++)
        {
            var src = "";
            if ( i == root.page)
                src = "import QtQuick 2.0; Rectangle{color: \"white\"; border.width: 1; border.color: \"black\";  width: 12; height: 12; radius: width/2; smooth: true}"
            else
                src = "import QtQuick 2.0; Rectangle{color: \"#666666\"; width: 12; height: 12; border.width: 1; border.color: \"black\"; radius: width/2; smooth: true}"

            var rect = Qt.createQmlObject(src, rowPager, "rectPageIndicator" + i.toString());
        }

    }

    function updatePageIndicator()
    {
        for(var i = 0; i < rowPager.children.length ; i++) {
            if (i == root.page)
                rowPager.children[i].color = "white";
            else
                rowPager.children[i].color = "#666666";
        }
    }

    Component.onCompleted: {
        currentPage = "Buttons1";
        createPageIndicator();
    }
}
