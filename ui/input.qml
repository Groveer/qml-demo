import QtQuick
import QtQuick.Controls

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("qml-demo")

Rectangle {
    width: 200
    height: 100
    color: "red"

    Text {
        anchors.centerIn: parent
        text: "Hello, World!"
    }

    TapHandler {
        onTapped: parent.color = "blue"
    }

    focus: true
    Keys.onPressed: {
        if (event.key === Qt.Key_Return) {
            color = "green";
            event.accepted = true;
        }
    }
}
}
