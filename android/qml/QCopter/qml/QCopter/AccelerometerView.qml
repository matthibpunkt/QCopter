import QtQuick 2.0
import QtSensors 5.0 as Sensors
import "Components"


Rectangle {
    id: root
    width: settings.g_width
    height: settings.g_height
    color: "#00000000"
    property bool debugger_shown: true

    Settings {
        id: settings
    }


    Sensors.Accelerometer {
        id: accel
        dataRate: 1000
        active:true

        onReadingChanged: {
            var min = 0.1
            var accx = accel.reading.x
            var accy = accel.reading.y
            var accz = accel.reading.z


            // Fenster
            if (accx < min && accx > -min) accx = 0
            if (accy < min && accy > -min) accy = 0
            if (accz < min && accz > -min) accz = 0

            var roll = calcRoll(accx, accy, accz)
            var pitch = calcPitch(accx, accy, accz)

            var newx =roll * .1
            var newy =pitch * .1
            var newHorizontY = horizont.y - pitch * .1

            if (newx < 0) newx = 0

            if (newx > root.width) newx = root.width

            if (newy < 18)newy = 18

            if (newy > root.height) newy = root.height

//            labelGesture1.text = " x : " + accx + "\n y: " + accy + "\n z: " + accz
//                    + "\n newx: " + newx + "\n newy: " + newy
//                    + "\n Roll: " + roll + "\n Pitch : " + pitch

            xBar.value = accx
            yBar.value = accy
            zBar.value = accz
            rollBar.value = roll
            pitchBar.value = pitch

            // horizont.y = newHorizontY
            horizont.rotation = Math.round(roll)


        }
        Component.onCompleted: accel.start()
        //Component.onDestroyed: accel.stop()

    }

    function calcPitch(x,y,z) {
        return Math.atan(y / Math.sqrt(x*x + z*z)) * 57.2957795;
    }
    function calcRoll(x,y,z) {
         return Math.atan(x / Math.sqrt(y*y + z*z)) * 57.2957795;
    }

    Horizont {
        id: horizont

        width: parent.width * 2.5
        height: parent.height * 2.5
        property real centerX: parent.width * 0.5
        property real centerY: parent.height  * 0.5
        property real horizontCenterX: horizont.width  * 0.5
        property real horizontCenterY: horizont.height  * 0.5
        x: centerX - horizontCenterX
        y: centerY - horizontCenterY
        z: -1

        smooth: true


        Behavior on rotation {
            SmoothedAnimation {
                easing.type: Easing.OutExpo
                duration: 10
            }
        }

        Behavior on y {
            SmoothedAnimation {
                easing.type: Easing.Linear
                duration: 100
            }
        }

    }

//    Text {
//        id: labelGesture1
//        anchors.top: parent.top
//        anchors.left: parent.left
//        font.pixelSize: 20
//        font.bold: true
//        opacity: root.debugger_shown ? 1 : 0
//    }



    Row {
        anchors.top: parent.top
        anchors.left: parent.left
        spacing: 5

        StatusBar {
            id: xBar
            minimum: -10
            maximum: +10
            headertext: "X"
            scale: 0.7
            opacity: root.debugger_shown ? 1 : 0
        }

        StatusBar {
            id: yBar
            minimum: -10
            maximum: +10
            headertext: "Y"
            scale: 0.7
            opacity: root.debugger_shown ? 1 : 0
        }

        StatusBar {
            id: zBar
            minimum: -15
            maximum: +15
            headertext: "Z"
            scale: 0.7
            opacity: root.debugger_shown ? 1 : 0
        }

        StatusBar {
            id: rollBar
            minimum: -90
            maximum: +90
            headertext: "Roll"
            scale: 0.7
            opacity: root.debugger_shown ? 1 : 0
        }

        StatusBar {
            id: pitchBar
            minimum: -90
            maximum: +90
            headertext: "Pitch"
            scale: 0.7
            opacity: root.debugger_shown ? 1 : 0
        }
    }

//    Image {
//        id: bubble
//        source: "Components/images/Bluebubble.png"
//        property real centerX: parent.width / 2
//        property real centerY: parent.height / 2
//        property real bubbleCenter: bubble.width / 2
//        x: centerX - bubbleCenter
//        y: centerY - bubbleCenter

//        smooth: true

//        Behavior on y {
//            SmoothedAnimation {
//                easing.type: Easing.Linear
//                duration: 100
//            }
//        }
//        Behavior on x {
//            SmoothedAnimation {
//                easing.type: Easing.Linear
//                duration: 100
//            }
//        }
//    }

    function onDebugger_shownChanged()
    {
       root.debugger_shown =  !root.debugger_shown
    }

}

