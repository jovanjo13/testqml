import QtQuick 2.0
import QtQuick.Controls 1.4
import Testclass 1.0
import entrymodel 1.0


Item {
    TableView {
        x: 0
        y: 0
        width: 292
        height: 435



        id: myTable
        model: myModel


        TableViewColumn {
            role: "desc"; title: "Name"; width: 105

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
        /*ListElement {
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
*/
    }



    Calendar{
        x: 292
        y: 0
        width: 508
        height: 435
        onClicked: {
           tc.curDate = date
           //tc.setItems()
            //myModel.append({desc:"beides"})


            //get_ressources()
            //get_list()
            //new_entry()
            //add_component("persons")  //department persons


        }




        function get_ressources(){
            var url = tc.url
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
            var url = tc.url
            var req = new XMLHttpRequest();
            req.open("POST", url + "sql_get");
            req.setRequestHeader('Content-type','application/json');
            //req.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            req.onreadystatechange = function() {
              if (req.readyState == XMLHttpRequest.DONE) {
                // what you want to be done when request is successfull
                  console.log(req.responseText)
                  var res = JSON.parse(req.responseText)
                  console.log(res)
                  console.log(res[0].datefrom)

                  for(var i = 0; i < res.length; i++){
                      console.log(i)
                  }
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

        function new_entry(){
            var url = tc.url
            var req = new XMLHttpRequest();
            req.open("POST", url + "sql_post/entry");
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
            var e = {}
            e.firstName = "vorname"
            e.lastName = "nachname"
            e.resource = "res"
            e.section = "Software"
            e.description = "desc"
            e.datefrom = "2018-01-15 10:00:00"
            e.dateto = "2018-01-15 11:00:00"
            var str = JSON.stringify(e)
            console.log(str)
            req.send(str)
        }

        function add_component(component){
            var url = tc.url
            var req = new XMLHttpRequest();
            req.open("POST", url + "sql_post/" + component);
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
            var c = {}

            switch(component){
                case "resources":   c.resource = "asdf"
                                    break

                case "persons":      c.firstName = "fn"
                                     c.lastName = "lnnnn"
                                     c.section = "Software"
                                     break

                case "department":  c.section = "Irgendwas"
            }

            var str = JSON.stringify(c)
            console.log(str)
            req.send(str)
        }


    }

    Testclass{
        id: tc



    }
}

