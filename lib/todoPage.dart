import 'package:flutter/material.dart';
import 'package:to_do_apps/style.dart';

class ToDoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ToDoPageView();
  }
}

class ToDoPageView extends State<ToDoPage> {
  var ToDoList = [];
  String items = "";

  AppInputOnChange(value){

    setState(() {
      items=value;
    });
  }

  AddItems(){
    setState(() {
      ToDoList.add({'items': items});
    });
  }

  RemoveItems(index){
    setState(() {
      ToDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do List'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
                flex: 10,
                child: Row(
                  children: [
                    Expanded(
                        flex: 80,
                        child: TextFormField(
                          onChanged: (value){
                            AppInputOnChange(value);
                          },
                          decoration: AppInputDecoration('List Items'),
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        flex: 20,
                        child: ElevatedButton(
                          onPressed: () {
                            AddItems();
                          },
                          child: Text('Add'),
                          style: AppButtonStyle(),
                        )),
                  ],
                )),
            Expanded(
                flex: 90,
                child: ListView.builder(
                    itemCount: ToDoList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: SizedBox50(
                          Row(
                            children: [
                              Expanded(flex: 80, child: Text(ToDoList[index]['items'].toString())),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  flex: 20,
                                  child: TextButton(
                                    onPressed: () {
                                      RemoveItems(index);
                                    },
                                    child: Icon(Icons.delete),
                                  )),
                            ],
                          ),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
