import QtQuick
import QtQuick.Controls

Window {
    visible: true
    width: 800
    height: 640
    title: "my test windows"

    Rectangle {
        id: rect

        width: 100
        height: 100
        color: "red"

        MouseArea {
            anchors.fill: parent
            onClicked: {
                console.log("clicked");
            }
        }

    }

}
