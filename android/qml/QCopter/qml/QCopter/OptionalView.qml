import QtQuick 2.0

Item {

    Settings {
        id: settings
    }

    Rectangle {
        id: rectangle1
        color: settings.g_primaryColor
        radius: 20
        border.color: settings.g_secondaryColor
        border.width: 6
        anchors.rightMargin: 70
        anchors.leftMargin: 70
        anchors.bottomMargin: 70
        anchors.topMargin: 30
        anchors.fill: parent
    }

}
