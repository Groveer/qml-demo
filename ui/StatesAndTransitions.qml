import QtQuick
import QtQuick.Controls

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("qml-demo")

    Item {
        id: container
        anchors.fill: parent

        Rectangle {
            id: rect
            color: "red"
            width: 120
            height: 120

            TapHandler {
                onTapped: container.state === '' ? container.state = 'other' : container.state = ''
            }
        }
        states: [
            // This adds a second state to the container where the rectangle is farther to the right

            State { name: "other"

                PropertyChanges {
                    target: rect
                    x: 300
                    y: 200
                }
            }
        ]
        transitions: [
            // This adds a transition that defaults to applying to all state changes

            Transition {

                // This applies a default NumberAnimation to any changes a state change makes to x or y properties
                NumberAnimation { properties: "x,y" }
            }
        ]
    }

}
