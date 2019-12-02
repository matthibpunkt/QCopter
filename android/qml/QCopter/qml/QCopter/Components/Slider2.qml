import QtQuick 2.0

Item {
    id: root
    width: 200
    height: 112



    property real valueMin: 0.3
    property real valueMax: 0.7
    property real maximum: 1
    property real minimum: 0
    property string unit: "%"
    property int xMin: handle1.width - 4
    property int xMax: width - handle2.width - 4
    property alias text: sliderText.text

    onValueMinChanged: updatePos1();
    onValueMaxChanged: updatePos2();
    onXMinChanged: updatePos1();
    onXMaxChanged: updatePos2();
    onMinimumChanged: updatePos1();
    onMaximumChanged: updatePos2();

    function updatePos1() {
        if (maximum > minimum) {
            var pos = 2 + (valueMin - minimum) * root.xMax / (maximum - minimum);
            pos = Math.min(pos, width - handle1.width - 2);
            pos = Math.max(pos, 2);
            handle1.x = pos;
        } else {
            handle1.x = 2;
        }
    }
    function updatePos2() {
        if (maximum > minimum) {
            var pos = 2 + (valueMax - minimum) * root.xMax / (maximum - minimum);
            pos = Math.min(pos, width - handle2.width - 2);
            pos = Math.max(pos, 2);
            handle2.x = pos;
        } else {
            handle2.x = 2;
        }
    }

    Rectangle {
        id: backgroundBar
        anchors.fill: parent
        anchors.topMargin: 40
        anchors.bottomMargin: 40
        border.width: 1
        border.color: "white"
        opacity: 0.2
        gradient: Gradient {
            GradientStop { position: 0.0; color: "lightgray" }
            GradientStop { position: 1.0; color: "gray" }
        }
    }

    Rectangle {
        id: filler
        anchors.left: handle1.horizontalCenter
        anchors.right: handle2.horizontalCenter
        anchors.top: backgroundBar.top
        anchors.bottom: backgroundBar.bottom
        border.width: 1
        border.color: "#202020"
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#f0f0f0" }
            GradientStop { position: 1.0; color: "#404040" }
        }
    }

    Item {
        id: handle1
        width: 80
        height: parent.height
        Image {
            anchors.centerIn: parent
            source: "images/handle.png"
        }
        Image {
            id: handle1Highlight
            anchors.centerIn: parent
            source: "images/toggle.png"
            opacity: mouse1Area.pressed ? 0.6 : 0
            Behavior on opacity {
                NumberAnimation { duration: 200 }
            }
        }
        MouseArea {
            id: mouse1Area
            anchors.fill: parent
            anchors.margins: -20
            drag.target: parent
            drag.axis: Drag.XAxis
            drag.minimumX: 2
            drag.maximumX: root.xMax+2
            onPositionChanged: {
                valueMin = (maximum - minimum) * (handle1.x-2) / root.xMax + minimum;
            }
        }
    }

    Item {
        id: handle2
        width: 80
        height: parent.height
        Image {
            anchors.centerIn: parent
            source: "images/handle.png"
        }
        Image {
            id: handle2Highlight
            anchors.centerIn: parent
            source: "images/toggle.png"
            opacity: mouse2Area.pressed ? 0.6 : 0
            Behavior on opacity {
                NumberAnimation { duration: 200 }
            }
        }
        MouseArea {
            id: mouse2Area
            anchors.fill: parent
            anchors.margins: -20
            drag.target: parent
            drag.axis: Drag.XAxis
            drag.minimumX: 2
            drag.maximumX: root.xMax+2
            onPositionChanged: {
                valueMax = (maximum - minimum) * (handle2.x-2) / root.xMax + minimum;
            }
        }
    }

    Text {
        id: valueMinText
        anchors { left: parent.left}
        font.pixelSize: 28
        style: Text.Outline
        text: (root.valueMin*100).toFixed(0) + root.unit
        styleColor: "white"
        color: "black"
        opacity: 0.4
    }

    Text {
        id: valueMaxText
        anchors { right: parent.right  }
        font.pixelSize: 28
        style: Text.Outline
        text: (root.valueMax*100).toFixed(0) + root.unit
        styleColor: "white"
        color: "black"
        opacity: 0.4
    }

    Text {
        id: sliderText
        anchors.centerIn: parent
        font.pixelSize: 28
        style: Text.Outline
        styleColor: "white"
        color: "black"
        opacity: 0.4
    }
}
