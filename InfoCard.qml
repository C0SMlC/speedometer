import QtQuick 2.15

Item {
    id: root
    width: parent.width / 2 - 20
    height: parent.height / 2 - 10

    property int textSpacing: 10
    property int padding: 10

    Rectangle {
        anchors.fill: parent
        color: "transparent"
    }

    Column {
        anchors.fill: parent
        anchors.margins: root.padding
        spacing: root.textSpacing

        Text {
            id: infoCardText
            width: parent.width
            color: "white"
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: infoCardValue
            width: parent.width
            color: "white"
            font.pixelSize: 18
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.Wrap
            elide: Text.ElideRight
            maximumLineCount: 2
        }
    }

    function setText(text) {
        infoCardText.text = text
    }

    function setValue(value) {
        infoCardValue.text = value
    }
}
