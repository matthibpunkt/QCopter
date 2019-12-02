import QtQuick 2.0

Item {
    id: root
    width: 112
    height: 112

    property bool checked: false
    property alias icon: buttonIcon.source
    property alias text: buttonText.text
    property alias textSize: buttonText.font.pixelSize

    signal toggled

    Image {
        id: handle
        anchors.verticalCenter: parent.verticalCenter
        source: "images/handle.png"
    }

    Image {
        id: toggle
        anchors.centerIn: parent
        source: "images/toggle.png"
        opacity: checked ? 0.6 : 0
        Behavior on opacity {
            NumberAnimation { duration: 200 }
        }
    }


    Image {
        id: buttonIcon
        anchors.centerIn: parent
    }

    Text {
        id: buttonText
        anchors.centerIn: parent
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            checked = !checked
            root.toggled();
        }
    }
}
