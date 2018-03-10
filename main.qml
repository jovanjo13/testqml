import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import "qrc:/add/"

ApplicationWindow {
    id: aw
    visible: true
    width: 800
    height: 480
    title: qsTr("Reservierungssystem")

    header:TabBar {
        id: bar
        width: parent.width
        currentIndex: 0


        TabButton {
            text: qsTr("Home")
            onClicked: {
                slay.currentIndex = 0

            }

        }
        TabButton {
            text: qsTr("New Entry")
            onClicked: {
                slay.currentIndex = 1

            }
        }
        TabButton {
            text: qsTr("Add")
            onClicked: {
                slay.currentIndex = 2
            }

        }
    }

    Text{
        id: t
    }

    StackLayout{
        id: slay
        currentIndex: 0
        anchors.fill:   parent


        Home {

        }

        Newentry{

        }

        Add{

        }
    }



/*
    ColumnLayout {
        id: home
        x: 0
        y: 50
        width: 800
        height: 475




        TextField {
            id: textField
            x: 21
            y: 71

        }

        Text {
            id: text1
            x: 253
            y: 71
            width: 200
            height: 41
            text: qsTr("Text")
            font.pixelSize: 12
        }

        Button {
            id: button
            x: 21
            y: 126
            text: qsTr("Button")
            onClicked: {
                text1.text = textField.text
            }
        }

        Column {
            id : columns
            x: 21
            y: 198

            RadioButton{
                checked: true
                text: "eins"

            }

            RadioButton{
                text: "zwei"

            }

            RadioButton{
                text: "drei"

            }
        }

        Loader { id: pageLoader }

        Button {
            id: button_add
            x: 21
            y: 345
            text: qsTr("ADD")
            onClicked: {
                pageLoader.source = "add.qml"

            }
        }
    }


*/


}
