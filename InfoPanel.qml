import QtQuick

Rectangle {
    property real battery : 100
    property real distanceTravelled : 0

    id: infoPanel
    width: parent.width
    height: 100
    color: "#72757e"

    InfoCard {
        id: batteryLevel
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.margins: 10
    }

    InfoCard {
        id: distanceTraveled
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.margins: 10
    }

    Component.onCompleted: {
        batteryLevel.setText("Battery Level")
        distanceTraveled.setText("Distance Traveled")

        batteryLevel.setValue(100)
        distanceTraveled.setValue(0)
    }

    function updateBatteryLevel(level) {
        battery -= level;
        batteryLevel.setValue(battery)
    }

    function updateDistanceTraveled(distance) {
        distanceTravelled += distance
        distanceTraveled.setValue(distanceTravelled)
    }
}
