import QtQuick 2.0
import Qt.labs.settings 1.0

Settings {
    id: root

    /*general settings */
    property int g_width: 1280
    property int g_height: 800

    property color g_roomColor: "black"
    property color g_primaryColor: "#303030"
    property color g_secondaryColor: "gray"
    property color g_textColor: "white"

    /*ultrasonic settings*/
    property int us_width: 200
    property int us_height: 200

    property int us_minValue: 0
    property int us_maxValue: 255
    property int us_border: 1



}
