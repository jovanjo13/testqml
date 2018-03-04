import QtQuick 2.0
import QtQuick.Controls 1.4

Item {
    TableView {
        x: 8
        y: 70
        width: 233
        height: 371
        model: Entrymodel {

        }

    }

    Calendar{
        x: 257
        y: 70
        width: 535
        height: 371
        onClicked: {
            text1.text = date

        }


    }

    Text {
        id: text1
        x: 8
        y: 8
        width: 136
        height: 56
        text: qsTr("Text")
        font.pixelSize: 12
    }
}
