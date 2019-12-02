import QtQuick 2.0

Rectangle {
    id: _root
    width: 100
    height: 400
    color: "#00000000"

    property string headertext: ""
    property int maximum: +1
    property int minimum: -1
    property int value: 0

    Rectangle {
        id: _statusarea
        x: 43
        y: 39
        width: 49
        height: 360
        color: "#2f2d2d"
        radius: 6
        opacity: 0.3


        Text {
            id: text1
            x: -14
            y: 0
            text: maximum
            transformOrigin: Item.Right
            anchors.right: _statusarea.left
            anchors.rightMargin: 6
            font.pixelSize: 15
        }

        Text {
            id: text2
            x: -20
            y: parent.height - height
            text: minimum
            transformOrigin: Item.Right
            anchors.right: _statusarea.left
            anchors.rightMargin: 6
            font.pixelSize: 15
        }

        Text {
            id: text3
            x: -12
            y:parent.height*0.5 - height/2
            height: 18
            text: qsTr("0")
            transformOrigin: Item.Right
            anchors.right: _statusarea.left
            anchors.rightMargin: 4
            font.pixelSize: 15
        }

        Text {
            id: text4
            x: -28
            y: parent.height*0.375 - height/2
            text: maximum*0.25
            transformOrigin: Item.Right
            anchors.right: _statusarea.left
            anchors.rightMargin: 6
            font.pixelSize: 12
        }

        Text {
            id: text5
            x: -28
            y: parent.height*0.125 - height/2
            text: maximum * 0.75
            transformOrigin: Item.Right
            anchors.right: _statusarea.left
            anchors.rightMargin: 6
            font.pixelSize: 12
        }

        Text {
            id: text6
            x: -33
            y: parent.height*0.625 - height/2
            text: minimum *0.25
            transformOrigin: Item.Right
            anchors.right: _statusarea.left
            anchors.rightMargin: 6
            font.pixelSize: 12
        }

        Text {
            id: text7
            x: -32
            y: parent.height*0.875 - height/2
            text: minimum*0.75
            transformOrigin: Item.Right
            anchors.right: _statusarea.left
            anchors.rightMargin: 6
            font.pixelSize: 12
        }

        Text {
            id: text8
            x: -22
            y: parent.height*0.25 - height/2
            text: maximum * 0.5
            transformOrigin: Item.Right
            anchors.right: _statusarea.left
            anchors.rightMargin: 6
            font.pixelSize: 12
        }

        Text {
            id: text9
            x: -26
            y: parent.height*0.75 - height/2
            text: minimum *0.5
            transformOrigin: Item.Right
            anchors.right: _statusarea.left
            anchors.rightMargin: 6
            font.pixelSize: 12
        }

        Text {
            id: _headertext
            x: 7
            y: -33
            color: "#000000"
            text: headertext
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 20
    }
    Rectangle {
        id: _slider

        property int xDest: ( parent.height * ( value - minimum ) ) / ( maximum - minimum ) + (height *0.5)

        x: 0
        y: parent.height - xDest
        width: 49
        height: 8
        radius: 6
        border.width: 2
        smooth: true
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#82818d"
            }

            GradientStop {
                position: 1
                color: "#2f2c2c"
            }
        }

        Behavior on y {
            SmoothedAnimation {
                easing.type: Easing.Linear
                duration: 100
            }
        }
    }
    }
}
