import QtQuick 2.0

Rectangle {
    id: root
    objectName: "root"
    width: 800
    height: 480
    property int page: 0
    // Set this property to another file name to change page
    property string  currentPage : "";

    color: "#666666"

    signal message(string msg)


    ListModel{
        id: pageList

        ListElement{
            page: "Buttons1"
        }
        ListElement{
            page: "Buttons2"
        }
        ListElement{
            page: "Sliders"
        }
        ListElement{
            page: "Indicators1"
        }
        ListElement{
            page: "Indicators2"
        }
        ListElement{
            page: "DataEntry"
        }
        ListElement{
            page: "Knobs"
        }
        ListElement{
            page: "Meters"
        }
    }

    ListView {
        id: view
        contentHeight: 480
        width: 800
        height: 480
        model: pageList
        orientation: ListView.Horizontal
        snapMode: ListView.SnapOneItem;
        flickDeceleration: 500

        onFlickEnded: {
            var index = view.contentX/800;
            root.page = index;
            updatePageIndicator();
        }


        delegate: Component{
            Loader {
                id: loader
                property string pageName: page
                property bool beenLoaded: false
                width: 800
                height: 480
                source: "%1.qml".arg(page)
            }

        }

    }

    Rectangle {
        id: rectPager
        x: 0
        y: 447
        width: root.width
        height: 33
        color: "transparent"
        anchors.bottom: root.bottom

        Row{
            id: rowPager
            spacing: 5
            anchors.centerIn: parent

        }
    }


    function createPageIndicator()
    {
        for (var i=0; i < view.model.count; i++)
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
