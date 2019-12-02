import QtQuick 2.0
import "Components"

Rectangle {
    
    id: batteryView
    color: settings.g_primaryColor
    anchors.fill: parent


    Settings {
        id: settings
    }

    ListModel {
        id: batteryModel
        ListElement {name: "battery0"; text: "battery 1"}
        ListElement {name: "battery1"; text: "battery 2"}
        ListElement {name: "battery2"; text: "battery 3"}
        ListElement {name: "battery3"; text: "battery 4"}
    }


//    GridView {

//        model: batteryModel
//        delegate:
    Column {
        anchors.horizontalCenterOffset: 20
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 50

        Text {
            color: settings.g_textColor
            font.pixelSize: 32;
            text: text  }

        Battery {
            id: battery
            clip: false
            value: slider.value
            charging: chargingToggle.checked
            showText: true
            scale : 0.7
            rotation: -90
        }

        Row {
            //anchors.horizontalCenter: parent.horizontalCenter
            //anchors.bottom: parent.bottom
            //anchors.bottomMargin: 8
            spacing: 16
            Slider {
                id: slider
                width: 300
                text: "- Battery Level +"
                value: 0.5
            }
            ToggleButton {
                id: chargingToggle
                icon: "Components/images/plug.png"
            }
        }

    }
}
