import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3


Item {
    id: add

    Column {
        id: col
        x: 8
        y: 34

        RadioButton{
            checked: true
            text: "Ressource"
            onClicked: {
                text1.text = "Ressource"
                text1.visible = true
                textField1.visible = true
                text2.visible = false
                textField2.visible = false
                text3.visible = false
                textField3.visible = false

            }

        }

        RadioButton{
            text: "Person"
            onClicked: {
                text1.text = "First name"
                text1.visible = true
                textField1.visible = true
                text2.text = "Last name"
                text2.visible = true
                textField2.visible = true
                text3.text = "Department"
                text3.visible = true
                textField3.visible = true
            }
        }

        RadioButton{
            text: "Department"
            onClicked: {
                text1.text = "Department"
                text1.visible = true
                textField1.visible = true
                text2.visible = false
                textField2.visible = false
                text3.visible = false
                textField3.visible = false
            }
        }
    }

    Text {
        id: text2
        x: 11
        y: 170
        width: 124
        height: 21
        text: qsTr("Ressource")
        font.pixelSize: 12
    }

    TextField {
        id: textField2
        x: 206
        y: 161

    }

    Text {
        id: text1
        x: 11
        y: 240
        width: 129
        height: 21
        font.pixelSize: 12
        visible: false
    }

    TextField {
        id: textField1
        x: 206
        y: 230
        visible: false
    }



    Text {
        id: text3
        x: 11
        y: 318
        width: 129
        height: 19
        visible: false
        font.pixelSize: 12
    }

    TextField {
        id: textField3
        x: 206
        y: 308
        visible: false
    }

    Button {
        id: button
        x: 628
        y: 373
        text: qsTr("Save")
        onClicked: {
            //To do JS Code
            console.log(textField3.text)
        }
    }

}



