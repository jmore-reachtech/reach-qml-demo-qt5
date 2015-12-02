import QtQuick 2.0
import "../components"

Rectangle {
    id: root
    objectName: "root"
    width: 1280
    height: 800
    color: "#666666"

    signal message(string msg)
    
    /* define a db element */
    SqLite{
        id: db
    }

    Speedometer {
        id: spedo
        x: 414
        y: 250
        visible: true
        objectName: "spedo"
        width: 300
        height: 300
        needleImage: "../images/needle.png"
        overlayImageHeight: 150
        min: 0
        needleImageHeight: 90
        overlayImage: "../images/overlay.png"
        value: 0
        needleImageWidth: 11
        max: 120
        needleRotationX: 6
        needleRotationY: 87
        maxAngle: 135
        minAngle: -130
        overlayImageWidth: 211
        overlayX: 30
        overlayY: 24
        needleX: 140
        needleY: 51
        backgroundImage: "../images/meterbackground.png"
    }

    VerticalSlider {
        id: slider1
        x: 747
        y: 269
        width: 48
        height: 240
        imageHandle: "../images/slider_handle.png"
        allowDrag: true
        yMin: 0
        value: 0
        maximum: 120
        imageTrack: "../images/slider_track.bmp"
        minimum: 0
        handleX: 0

        onValueChanged: spedo.value = value;
        
        onMousePressedChanged: {
			console.debug("mouse pressed " + mousePressed)
			if(!mousePressed) {
				console.debug("saving speed " + value)
				setSpeed(value)
			}
        }
    }

    ImageButton {
        id: quitButton
        x: 611
        y: 572
        width: 58
        height: 58
        text: ""
        imageDown: "../images/quit_down.png"
        imageUp: "../images/quit_up.png"
        onButtonClick: root.message("../src/mainmenu.qml");
    }
    
    function setSpeed(s)
    {
		/* open the database */
		db.openDB();
		
		/* update the current speed column */
		console.debug("setting speed to " + s);
		var ret = db.execSql("update speed set current = " +  s + ";");
		
		/* ret holds the number of rows affected */
		console.debug("rows = " + ret);
		if(ret < 0) {
			console.debug("error = " + db.lastError());
		}
		
		/* be sure to close the database. On close the database is 
		 * persisted to flash and a backup is created */
		db.closeDB();
    }
    
    function createSpeedTable()
    {
		/* open the database */
		db.openDB();
		
		/* create the table if it does not exist */
        db.execSql("CREATE TABLE IF NOT EXISTS speed (id INTEGER PRIMARY KEY AUTOINCREMENT, current REAL)");
        
        /* first time through the table is empty */
        var rows = db.getRows("select count(id) from speed");
        
        console.debug("speed count = " + rows.length);
        
        /* 
         * check row count. If zero we don't have any data so add a
		 * default record
        */
        if(rows[0][0] == 0) {
			/* default speed to zero */
			var ret = db.execSql("insert into speed (current) values(0)");
			/* ret holds the number of rows affected */
			console.debug("rows = " + ret);
			
			/* handle error condition */
			if(ret < 0) {
				console.debug("error = " + db.lastError());
			}
        }
        
        /* get the current speed */
        rows = db.getRows("select current from speed");
        console.debug("speed = " + rows[0][0]);
        
        /* set the slider value, that will change the dial */
        slider1.value = rows[0][0];
	
		/* be sure to close the database. On close the database is 
		 * persisted to flash and a backup is created */
		db.closeDB();
    }
    
    Component.onCompleted: {
		/* create the table if needed */
		createSpeedTable()
    }


}
