import QtQuick 2.0
import QtQuick.Controls 1.4
import Testclass 1.0

Item {
    TableView {
        x: 0
        y: 0
        width: 292
        height: 435


        id: myTable
        model: myModel


        TableViewColumn {
            role: "desc"; title: "Desc"; width: 105

        }

        TableViewColumn {
            role: "res"; title: "Ress"; width: 65
        }

        TableViewColumn {
            role: "tfrom"; title: "From"; width: 60
        }
        TableViewColumn {
            role: "tto"; title: "To"; width: 60
        }
    }

    ListModel {
        id: myModel
        ListElement {
            desc : "Besprechung"
            res :   "Raum 1"
            dfrom : "12.01.2018"
            tfrom : "11:00"
            tto :   "12:00"
            dto :   "12.01.2018"

        }

        ListElement {
            desc : "Gestaltung"
            res :   "Raum 2"
            dfrom : "12.01.2018"
            tfrom : "14:00"
            tto :   "14:30"
            dto :   "12.01.2018"

        }

    }

    Calendar{
        x: 292
        y: 0
        width: 508
        height: 435
        onClicked: {
           tc.curDate = date
           //text1.text = tc.curDate
           tc.http()
        }
    }

    Testclass{
        id: tc


    }
}
