import QtQuick 2.0
import QtMultimedia 5.0
import "components"

Item {
    id: mainView
    width: 640
    height: 480

    Audio{
        id: sound1
        source: "audio/beep-01a.wav"
    }

    Loader{
        id: loader
    }

    /*Backlight{
        id: backLight
    }*/

    Connections {
        target: loader.item
        onMessage: {
            sound1.volume = 0.6;
            sound1.play();
            loader.source = msg;            
        }
    }

    Component.onCompleted: {
        //Set beeper values
        /*var volume = settings.getValue("beeper_volume",50);
        var duration = settings.getValue("beeper_duration", 100);
        var freq = settings.getValue("beeper_frequency", 1000);

        beeper.setVolume(volume);
        beeper.setFrequency(freq);
        beeper.setDuration(duration);

        settings.setValue("beeper_volume", volume);
        settings.setValue("beeper_duration", duration);
        settings.setValue("beeper_frequency", freq);

        //Set backlight values
        var brightness = settings.getValue("backlight_brightness",60);

        backLight.setBrightness(brightness);
        settings.setValue("backlight_enable", true);
        settings.setValue("backlight_brightness", brightness);*/
        loader.source = "mainmenu.qml";
    }
}

