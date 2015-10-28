import QtQuick 2.0
import "../components"

Rectangle {
    id: root
    objectName: "root"
    width: 640
    height: 480
    color: "#666666"

    signal message(string msg)
    
    /* define a db element */
    SqLite{
        id: db
    }

    Speedometer {
        id: spedo
        x: 241
        y: 118
        objectName: "spedo"
        width: 210
        height: 210
        needleImage: "../images/needle.png"
        overlayImageHeight: 105
        min: 0
        needleImageHeight: 63
        overlayImage: "../images/overlay.png"
        value: 0
        needleImageWidth: 8
        max: 120
        needleRotationY: 65
        needleRotationX: 5
        maxAngle: 133
        overlayY: 18
        overlayImageWidth: 148
        overlayX: 21
        needleY: 33
        needleX: 98
        backgroundImage: "../images/meterbackground.png"
    }

    VerticalSlider {
        id: slider1
        x: 501
        y: 124
        width: 48
        height: 184
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
        x: 501
        y: 351
        width: 48
        height: 48
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
