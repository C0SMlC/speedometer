import QtQuick
import QtQuick.Shapes

Item {
    id: root
    width: 300
    height: 300
    property real value: 0
    property real minValue: 0
    property real maxValue: 300
    property string unit: "km/h"
    property real batteryDrained : 0
    property real distanceTravelled : 0

    Rectangle {
        anchors.fill: parent
        color: "black"
        radius: width / 2
    }

    Shape {
        anchors.fill: parent
        ShapePath {
            strokeWidth: 20
            strokeColor: "#333333"
            fillColor: "transparent"
            capStyle: ShapePath.RoundCap
            PathAngleArc {
                centerX: root.width / 2
                centerY: root.height / 2
                radiusX: root.width / 2 - 20
                radiusY: root.height / 2 - 20
                startAngle: -220
                sweepAngle: 260
            }
        }
    }

    Canvas {
        id: needle
        anchors.fill: parent
        rotation: -130 + (root.value - root.minValue) / (root.maxValue - root.minValue) * 260
        onPaint: {
            var ctx = getContext("2d");
            ctx.reset();
            ctx.beginPath();
            ctx.moveTo(width / 2, height / 2);
            ctx.lineTo(width / 2 - 5, height / 2 - 10);
            ctx.lineTo(width / 2, 20);
            ctx.lineTo(width / 2 + 5, height / 2 - 10);
            ctx.closePath();
            ctx.fillStyle = "red";
            ctx.fill();
        }
    }

    Rectangle {
        id: knob
        height: 30
        width: 30
        color: "#444444"
        x: root.width / 2 - 15
        y: root.height / 2 - 15
        radius: 15
    }

    Text {
        anchors.centerIn: parent
        font.pixelSize: 40
        text: Math.round(root.value)
        color: "white"
        anchors.verticalCenterOffset: 40
    }

    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.verticalCenter
        anchors.topMargin: 60
        font.pixelSize: 20
        text: root.unit
        color: "white"
    }

    Behavior on value {
        NumberAnimation {
            duration: 100
        }
    }

    function calculateBatteryDrain(){
        let batteryLeft = parseInt(value * 100 / 300)
        let distance = parseInt(value * 0.8)

        batteryDrained = batteryLeft
        distanceTravelled = distance
    }
}
