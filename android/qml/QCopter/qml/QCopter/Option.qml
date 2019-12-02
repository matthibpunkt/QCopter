import QtQuick 2.0
import "Components"
//import QtMultimedia 5.0 as Multimedia


Rectangle {
    id: option
    color: "#303030";
    anchors {  left: parent.left; leftMargin: 12; right: parent.right; top: parent.top; bottom: parent.bottom }

    Settings {
        property alias maxHeight: sliderHeight.maximum
        property alias minHeight: sliderHeight.minimum

    }


    Text {
        id: option_view_text
        anchors {  right: parent.right; left: parent.left; top: parent.top }
        text: qsTr("quick options")
        anchors.topMargin: 6
        verticalAlignment: Text.AlignTop
        horizontalAlignment: Text.AlignHCenter
        color: "white"; font.pixelSize: 32; font.bold: true
    }

    Column {

        anchors { top: option_view_text.bottom; leftMargin: 50; right: parent.right; left: parent.left; bottom: parent.bottom }
        spacing: 20


        Slider2 {
            id: sliderHeight
            //anchors { left: parent.left; leftMargin: 12; verticalCenter: parent.verticalCenter }
            width: parent.width * 0.75
            text: "- max. height +"
            unit: "m"
            valueMin: 0.0
            valueMax: 0.8
        }

        Slider {
            id: sliderNick
            //anchors { left: parent.left; leftMargin: 12; verticalCenter: parent.verticalCenter }
            width: parent.width * 0.75
            text: "- max. nick +"
            value: 0.5
        }

        Row {
            spacing: 16

            ToggleButton {
                id: lightToggle
                icon: "Components/images/light.png"
//                onCheckedChanged: Multimedia.Camera {
//                    flash.mode: Camera.FlashOn
//                }

            }

            ToggleButton {
                id: debuggerToggle
                icon: "Components/images/bug.png"
                checked: true
                onCheckedChanged: _accelorometer_view.onDebugger_shownChanged();

            }

            ToggleButton {
                id: joystickToggle
                icon: "Components/images/joystick.png"
                checked: false
                onCheckedChanged: _gv.onJoystick_shownChanged();
            }

            ToggleButton {
                id: ultrasonicToggle
                 icon: "Components/images/ultrasonic.png"
                checked: false
                onCheckedChanged: _ultrasonic.onGroundSensor_shownChanged();
            }
        }
    }

}
