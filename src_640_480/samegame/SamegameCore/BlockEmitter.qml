import QtQuick 2.0
import QtQuick.Particles 2.0
// Needed for singletons QTBUG-34418
import "."

Emitter {
    property Item block: parent
    velocity: TargetDirection{targetX: block.width/2; targetY: block.height/2; magnitude: -40; magnitudeVariation: 40}
    acceleration: TargetDirection{targetX: block.width/2; targetY: block.height/2; magnitude: -100;}
    shape: EllipseShape{fill:true}
    enabled: false;
    lifeSpan: 700; lifeSpanVariation: 100
    emitRate: 1000
    maximumEmitted: 100 //only fires 0.1s bursts (still 2x old number)
}
