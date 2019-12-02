
import QtQuick 2.0

// draws two arcs (portion of a circle)
// fills the circle with a lighter secondary color
// when pressed
Canvas {
    id: canvas
    width: 200
    height: 200
    antialiasing: true

    property color primaryColor: "#303030"
    property color secondaryColor: "#fda116"
    property real border:1
    property bool groundSensor: true

    property real maxValue: 450
    property real minvalue: 0

    // if groundSensor == true -> the last element of thies array ist the value of groundSensor!
    property variant value: [405,190,150,60,200,300]

    /* Private */
    property real __centerWidth: width / 2
    property real __centerHeight: height / 2
    property real __radius: Math.min(canvas.width, canvas.height) / 2 - border

    property real __radiusOffset: 0

    onPrimaryColorChanged: requestPaint()
    onSecondaryColorChanged: requestPaint()
    onBorderChanged: requestPaint()
    onValueChanged: requestPaint()
    onMaxValueChanged:  requestPaint()
    onGroundSensorChanged: requestPaint()

    onPaint: {

        var ctx = getContext("2d");
        ctx.save();
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        var length = value.length;

        // bprüfen ob Groundsensor aktiviert ist
        if (groundSensor) length--;

        var angleOffset = -Math.PI/2  * value.length// -90° offset
        //var angleOffset =  -Math.PI  * length// 180° offset
        var angle = 2*Math.PI /length;  // 360°
        //var angle = Math.PI /length;    // 180°



        for (var k=0; k < length; k++) {

            //////////////////* values */////////////////////
            ctx.beginPath();
            ctx.lineWidth = 3*border;
            // setup the stroke
            ctx.strokeStyle = primaryColor;
            ctx.fillStyle = Qt.lighter(canvas.secondaryColor, 1.25);
            ctx.arc( canvas.__centerWidth,
                     canvas.__centerHeight,
                     canvas.__radius* (value[k]-minvalue)/(maxValue - minvalue),
                     angleOffset,
                     angleOffset + angle);
            ctx.lineTo(canvas.__centerWidth ,canvas.__centerHeight);
            ctx.closePath();
            ctx.fill();
            ctx.stroke();

            //////////////////* border lines */////////////////////
            ctx.beginPath();
            ctx.lineWidth = border;
            ctx.font = "15px Verdana"
            ctx.textAlign = "center"
            ctx.arc( canvas.__centerWidth,
                     canvas.__centerHeight,
                     canvas.__radius,
                     angleOffset,
                     angleOffset + angle);
            ctx.lineTo(canvas.__centerWidth ,canvas.__centerHeight);
            ctx.closePath();

            ctx.lineWidth = border;
            ctx.font = "20px Verdana"
            ctx.textAlign = "center"
            ctx.text(value[k] ,
                     canvas.__centerWidth+ (canvas.__radius/1.7)*Math.cos(angleOffset+ angle/2) ,
                     canvas.__centerHeight+ (canvas.__radius/1.7)*Math.sin(angleOffset+ angle/2)  );

            ctx.stroke();
            angleOffset += angle;

        }

//            ctx.beginPath();
//            ctx.lineWidth = border;
//            ctx.font = "15px Verdana"
//            ctx.textAlign = "center"
//            // setup the stroke

//            ctx.strokeStyle = primaryColor;

////                console.debug("Value: "+ value[i], "R/: " + canvas.__radius/2,"CenterX/Y: " + canvas.__centerWidth + " "  +  canvas.__centerHeight,
////                              "angleOffset: "+ canvas.__angleOffset,"angle: "+canvas.__angle ,
////                              "Text X: "+ (canvas.__centerWidth+ (canvas.__radius/2)*Math.cos(canvas.__angleOffset+ canvas.__angle/2)),
////                              "Text Y: "+ (canvas.__centerHeight+ (canvas.__radius/2)*Math.sin(canvas.__angleOffset+ canvas.__angle/2)))
//            ctx.stroke();
//            angleOffset += angle;
//        }


        // bprüfen ob Groundsensor aktiviert ist
        if (groundSensor) {

            // Second, thinner inner arc
            // From angle to 2*PI
            ctx.beginPath();
            ctx.lineWidth = border;
            ctx.font = "20px Calibri"
            ctx.textAlign = "center"
            ctx.strokeStyle = primaryColor;
            ctx.fillStyle = Qt.lighter(canvas.secondaryColor, 1.25);
            ctx.arc(canvas.__centerWidth ,
                    canvas.__centerHeight,
                    canvas.__radius* 0.15,
                    angleOffset,
                    angleOffset + 2*Math.PI);
            ctx.fill();
            ctx.text(value[length], canvas.__centerWidth-10, canvas.__centerHeight+5);
            ctx.stroke();

        }
        ctx.restore();
    }

    function onGroundSensor_shownChanged() {
       canvas.groundSensor =  !canvas.groundSensor
    }

    function onMaxValueChanged(temp) {
       canvas.maxValue = temp
       console.debug(temp)
    }
}

