import QtQuick 2.0
import QtQuick.Controls 1.0

import "Components"

Rectangle {
    id: _gv

    width: settings.g_width
    height: settings.g_height
    color: settings.g_roomColor

    property bool menu_shown: false
    property bool option_shown: false

    property bool battery_shown: false

    property bool joystick_shown: false
    property bool ultrasonic_shown: false

    /* Private */
    property int __durrationTime: 400       /*  time for the sliding views*/

    Settings {
        id: settings

    }


    /* this rectangle contains the "normal" view in your app */
    Rectangle {
        id: _normal_view
        anchors.fill: parent
        color: "#00000000"
        /* this is what moves the normal view aside */
        transform: Translate {
                id: _game_translate
                x: 0
                Behavior on x { NumberAnimation { duration: __durrationTime; easing.type: Easing.OutQuad } }
            }


        AccelerometerView {
            id: _accelorometer_view
            width: parent.width
            opacity: 0.6
            height: parent.height - _menu_bar.height
            anchors { top: _menu_bar.bottom; bottom: parent.bottom; left: parent.left; right: parent.right }
            //z: -1
        }


        Rectangle {
            id: _menu_bar
            anchors.top: parent.top
            width: parent.width;
            height: 50;
            color: settings.g_primaryColor
          //  z: +1

            Row {
                //anchors.left:menu_button.right
                anchors {left: parent.left; verticalCenter: parent.verticalCenter; margins: 12 }
                spacing: 30

                Rectangle {
                    id: _menu_button

                    color: settings.g_secondaryColor
                    width: 40; height: 40; smooth: true
                    radius: 8
                    scale: ma_menu.pressed ? 1.2 : 1

                    Text {
                        anchors.centerIn: parent;
                        font.pixelSize: 48;
                        color: settings.g_primaryColor
                        text: ">"
                    }

                    MouseArea {
                        id: ma_menu;
                        anchors.fill: parent;
                        onClicked: _gv.onMenu();
                    }
                }

                Rectangle {
                    id: _qc_button

                    color: settings.g_secondaryColor
                    width: 80; height: 40; smooth: true
                    radius: 8
                    scale: ma_battery.pressed ? 1.2 : 1

                    Battery {
                        id: battery
                        anchors.centerIn: parent
                        value: 0.5
                        showText: false
                        scale: 0.15
                    }

                    MouseArea {
                        id: ma_battery;
                        anchors.fill: parent;
                        onClicked: _gv.onBatteryView();
                    }


                }

                Rectangle {
                    id: _bluetooth_button

                    color: settings.g_secondaryColor
                    width: 80; height: 40;
                    smooth: true
                    radius: 8
                    scale: ma_bluetooth.pressed ? 1.2 : 1

                    Text {
                        anchors.centerIn: parent;
                        font.pixelSize: 30;
                        color: settings.g_primaryColor
                        text: "BT"
                    }

                    MouseArea {
                        id: ma_bluetooth;
                        anchors.fill: parent;
                        onClicked: _gv.onBluetoothView();
                    }


                }
            }

            Rectangle {
                id: option_button_
                anchors {right: parent.right; verticalCenter: parent.verticalCenter; margins: 12 }
                color: "gray"; width: 40; height: 40; smooth: true
                radius: 8
                scale: ma_option.pressed ? 1.2 : 1

                Text {
                    anchors.centerIn: parent;
                    font.pixelSize: 48;
                    color: settings.g_primaryColor
                    text: "<"
                }

                MouseArea {
                    id: ma_option;
                    anchors.fill: parent;
                    onClicked: _gv.onOptions();
                }
            }

        }

        Joystick {
         id: _joystickLeft

         width: 200
         height: 200
         opacity: _gv.joystick_shown ? 1 : 0
         anchors { bottom: parent.bottom; left: parent.left; margins: 70}

        }

        UltrasonicView{
         id: _ultrasonic
         width: 250
         height: 250
         opacity: _gv.ultrasonic_shown ? 0.6 : 0
         anchors { bottom: parent.bottom; horizontalCenter: parent.horizontalCenter; margins: 70}

        }

        Joystick {
         id: _joystickRight

         width: 200
         height: 200
         opacity: _gv.joystick_shown ? 1 : 0
         anchors { bottom: parent.bottom; right: parent.right; margins: 70}

        }


        /* put this last to "steal" touch on the normal window when menu is shown */
        MouseArea {
            anchors.fill: parent
            enabled: _gv.menu_shown
            onClicked: _gv.onMenu();
        }

        MouseArea {
            anchors.fill: parent
            enabled: _gv.option_shown
            onClicked: _gv.onOptions();
        }

        MouseArea {
            anchors.fill: parent
            enabled: _gv.battery_shown
            onClicked: _gv.onBatteryView();
        }

        MouseArea {
            anchors.fill: parent
            enabled: _gv.bluetooth_shown
            onClicked: _gv.onBluetoothView();
        }
    }

    /* this rectangle contains the "menu" */
    Rectangle {
        id: _menu_view
        width: parent.width * 0.3; height: parent.height
        anchors { right: _normal_view.left; top: parent.top; bottom: parent.bottom; fill: parent}
        anchors.rightMargin: parent.width * 0.7
        color: settings.g_primaryColor;
        opacity: _gv.menu_shown ? 1 : 0

        Behavior on opacity { NumberAnimation { duration: __durrationTime } }

        /* this is my sample menu content (TODO: replace with your own)  */
        ListView {
            anchors { fill: parent; margins: 22 }
            model: MenuModel {}
            delegate: Item {
                height: 80; width: parent.width;
                Text {
                    id: nameField;
                    anchors { left: parent.left; leftMargin: 12; verticalCenter: parent.verticalCenter }
                    color: settings.g_textColor
                    font.pixelSize: 32
                    text: name
                }
                Column {
                    anchors { top: nameField.bottom; left: parent.left; leftMargin: 20; verticalCenter: parent.verticalCenter }
                    spacing: 5

                    Repeater {
                        //model: attributes
                        Text {
                            color: settings.g_textColor
                            font.pixelSize: 32
                            text: subName }
                    }
                }

                Rectangle {
                    height: 2; width: parent.width * 0.7;
                    color: settings.g_secondaryColor
                    anchors { horizontalCenter: parent.horizontalCenter; bottom: parent.bottom } }
            }
        }
    }

    Option {
        id: _option_view
        //x: parent.width -(parent.width * 0.9); y: 0
        width: parent.width * 0.9; height: parent.height
        anchors { left: _normal_view.right; top: parent.top; bottom: parent.bottom; fill: parent}
        anchors.leftMargin: parent.width * 0.1

        opacity: _gv.option_shown ? 1 : 0
        Behavior on opacity { NumberAnimation { duration: __durrationTime; easing.type: Easing.InQuint  } }
    }

    BatteryView {
        id: _battery_view
        //x: parent.width -(parent.width * 0.9); y: 0

        anchors { left: parent.right; top: parent.top; bottom: parent.bottom; fill: parent}
        anchors.rightMargin: parent.width * 0.1
        opacity: _gv.battery_shown ? 1 : 0
        Behavior on opacity { NumberAnimation { duration: __durrationTime } }
    }

    /* this functions toggles the menu and starts the animation */
    function onMenu()
    {
        _game_translate.x = _gv.menu_shown ? 0 : _normal_view.width * 0.3
        _gv.menu_shown = !_gv.menu_shown;
    }

    /* this functions toggles the menu and starts the animation */
    function onOptions()
    {
        _game_translate.x = _gv.option_shown ? 0 : -_gv.width * 0.9
        _gv.option_shown = !_gv.option_shown;
    }

    function onBatteryView()
    {
        _game_translate.x = _gv.battery_shown ? 0 : _gv.width * 0.9
        _gv.battery_shown = !_gv.battery_shown;
    }

    function onJoystick_shownChanged()
    {
        _gv.joystick_shown =  !_gv.joystick_shown
    }

    function onUltrasonic_shownChanged()
    {
        _gv.ultrasonic_shown = !_gv.ultrasonic_shown
    }

}






