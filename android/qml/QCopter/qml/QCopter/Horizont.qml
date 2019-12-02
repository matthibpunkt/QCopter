import QtQuick 2.0

Rectangle {
    id: _root
    width: 1280
    height: 800
    border.width: 0

    Rectangle {
        id: _sky
        width: parent.width; height: parent.height/2
        anchors {top: parent.top; right:parent.right; left: parent.left}
        gradient: Gradient {
            GradientStop {
                position: .3
                color: "#3982ef"
            }
            
            GradientStop {
                position: 1
                color: "#c9eefe"
            }
        }
    }

    Rectangle {
        id: _ground
        width: parent.width; height: parent.height * .5
        anchors {top: _sky.bottom; right:parent.right; left: parent.left}
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#63e642"
            }

            GradientStop {
                position: .7
                color: "#1d4929"
            }
        }
    }




}
