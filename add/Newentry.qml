import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

Item {
    id: item1

    Text {
        x: 24
        y: 173
        width: 158
        height: 24
        id: text_res
        text : "Select ressource"
    }

    Column {
        id: col
        x: 24
        y: 211

        RadioButton{
            checked: true
            text: "Raum 1"
            onClicked: {


            }

        }

        RadioButton{
            text: "Raum 2"
            onClicked: {

            }
        }

        RadioButton{
            text: "Firmenauto"
            onClicked: {

            }
        }
    }

    Text {
        id : text_desc
        x: 24
        y: 21
        width: 146
        height: 30
        text: "Description"
    }

    TextArea {
        id: textArea
        x: 24
        y: 57
        width: 278
        height: 95
        text: qsTr("Here is the description you can edit\nOr something")
    }
    ColumnLayout {
        x: 403
        y: 21
        width: 200
        height: 407

        Text {
            x: 24
            y: 171
            width: 138
            height: 29
            text :  "From"
        }

        Row {
            TextField {
                id: fromtf_d
                text: "12"
                width: 40
            }

            Text{
                text: "_"
                topPadding: 5

            }

            TextField {
                id: fromtf_m
                text: "01"
                width: 40
            }

            Text{
                text: "_"
                font.pointSize: 15

            }

            TextField {
                id: fromtf_y
                text: "18"
                width: 40
            }

            Text{
                text: "|"
                topPadding: 10
            }

            TextField {
                id: fromtf_h
                text: "10"
                width: 40
            }

            Text {
                text: ":"
                topPadding: 11
            }

            TextField {
                id: fromtf_min
                text: "00"
                width: 40
            }

        }

        Text {
            x: 24
            y: 238
            width: 132
            height: 30
            text :  "To"
        }

        Row {
            TextField {
                id: totf_d
                text: "12"
                width: 40
            }

            Text{
                text: "_"
                topPadding: 5

            }

            TextField {
                id: totf_m
                text: "01"
                width: 40
            }

            Text{
                text: "_"
                font.pointSize: 15

            }

            TextField {
                id: totf_y
                text: "18"
                width: 40
            }

            Text{
                text: "|"
                topPadding: 10
            }

            TextField {
                id: totf_h
                text: "09"
                width: 40
            }

            Text {
                text: ":"
                topPadding: 11
            }

            TextField {
                id: totf_min
                text: "00"
                width: 40
            }

        }


        Text {
            x: 24
            y: 293
            width: 164
            height: 30
            text : "First name"
        }

        TextField {
            x: 24
            y: 432

        }

        Text {
            x: 24
            y: 395
            width: 156
            height: 28
            text : "Last name"
        }

        TextField {
            id: textField
            x: 24
            y: 329

        }


    }

    Button {
        id: button
        x: 656
        y: 378
        text: qsTr("Save")
    }


}
