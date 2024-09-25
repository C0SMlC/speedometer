import QtQuick

Canvas {
    id: canvas
    width: 50
    height: 50
    property color arrowColorOn: "orange"
    property color arrowColorOff: "#72757e"
    property color currentColor: arrowColorOff
    property bool arrowClicked: false

    onPaint: {
        var ctx = getContext("2d");
        ctx.reset();
        ctx.beginPath();
        ctx.moveTo(0, height / 2);
        ctx.lineTo(width * 0.8, 0);
        ctx.lineTo(width * 0.8, height * 0.3);
        ctx.lineTo(width, height * 0.3);
        ctx.lineTo(width, height * 0.7);
        ctx.lineTo(width * 0.8, height * 0.7);
        ctx.lineTo(width * 0.8, height);
        ctx.closePath();
        ctx.fillStyle = currentColor;
        ctx.fill();
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            canvas.arrowClicked = !canvas.arrowClicked;
            if (canvas.arrowClicked) {
                blinkTimer.start();
            } else {
                blinkTimer.stop();
                canvas.currentColor = canvas.arrowColorOff;
                canvas.requestPaint();
            }
        }
    }

    Timer {
        id: blinkTimer
        interval: 500
        repeat: true
        onTriggered: {
            canvas.currentColor = (canvas.currentColor === canvas.arrowColorOn) ? canvas.arrowColorOff : canvas.arrowColorOn;
            canvas.requestPaint();
        }
    }
}
