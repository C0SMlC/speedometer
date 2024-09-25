import QtQuick 2.15
import QtQuick.Controls 2.15

Window {
    width: 1000
    height: 700
    visible: true
    title: qsTr("Vehicle Dashboard")
    color: "#16161a"

    InfoPanel {
        id: infoPanel
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.right: parent.right
        anchors.rightMargin: 20
        height: 100
    }

    SpeedoMeter {
        id: speedoMeter
        anchors.centerIn: parent
        value: 0
        maxValue: 300
    }

    ArrowComponent {
        id: leftArrow
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.leftMargin: 150
        anchors.bottomMargin: 100
    }

    ArrowComponent {
        id: rightArrow
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.rightMargin: 150
        anchors.bottomMargin: 100
        transform: Scale {
            origin.x: rightArrow.width / 2
            origin.y: rightArrow.height / 2
            xScale: -1
            yScale: 1
        }
    }

    Button {
        id: startStopButton
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 50
        width: 100
        height: 40
        text: speedTimer.running ? "Stop" : "Start"

        onClicked: {
            if (speedTimer.running) {
                speedTimer.stop()
                speedoMeter.value = 0
            } else {
                speedTimer.start()
            }
        }
    }

    Timer {
        id: speedTimer
        interval: 500
        running: false
        repeat: true
        onTriggered: {
            if (speedoMeter.value < speedoMeter.maxValue) {
                speedoMeter.value += 1
                speedoMeter.calculateBatteryDrain()
                infoPanel.updateBatteryLevel(speedoMeter.batteryDrained)
                infoPanel.updateDistanceTraveled(speedoMeter.distanceTravelled)
            } else {
                stop()
            }
        }
    }
}
