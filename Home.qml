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

        ListElement {

            desc :  "Beides"
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
           tc.setItems()
           //text1.text = tc.curDate
           //tc.http()
           var l = tc.list.toString()
           myModel.set(0,{

                           desc :   l,
                           res :   "Raum 2",
                           dfrom : "12.01.2018",
                           tfrom : "14:00",




                       })
            //get_ressources()
            get_list()



        }



        function get_ressources(){
            var url = "http://10.8.250.21:30000/"
            var req = new XMLHttpRequest();
            req.open("GET", url + "sql_get/resources");
            req.onreadystatechange = function() {
              if (req.readyState == XMLHttpRequest.DONE) {
                // what you want to be done when request is successfull
                  console.log(req.responseText)
              }
            }
            req.onerror = function(){
              // what you want to be done when request failed
            }
            req.send()
        }

        function get_list(){
            var url = "http://10.8.250.21:30000/"
            var req = new XMLHttpRequest();
            req.open("POST", url + "sql_get");
            req.setRequestHeader('Content-type','application/json');
            //req.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            req.onreadystatechange = function() {
              if (req.readyState == XMLHttpRequest.DONE) {
                // what you want to be done when request is successfull
                  console.log(req.responseText)
              }
            }
            req.onerror = function(){
              // what you want to be done when request failed
            }
            //console.log(req.toString())
            var d = {}
            d.date = tc.dateToString(tc.curDate)
            var str = JSON.stringify(d)
            console.log(str)
            req.send(str)
        }


    }

    Testclass{
        id: tc



    }
}

