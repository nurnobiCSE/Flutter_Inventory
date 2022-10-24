import 'package:chat/all_api.dart';
import 'package:chat/home_screen.dart';
import 'package:chat/main.dart';
import 'package:flutter/material.dart';
import 'dart:io';


class ReturnPage extends StatefulWidget {
  @override
  State<ReturnPage> createState() => _ReturnPageState();
}

class _ReturnPageState extends State<ReturnPage> {
  @override
  Future<Null>refreshPage()async{
    await Future.delayed(Duration(seconds: 4));
    setState(() {
      returnApiCall();
    });
    return null;
  }
  @override
  Widget build(BuildContext context) {

returnApiCall();
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lime,
          title: Text("Return Product List"),
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(25.0)
            )
          ),
        ),
        body: RefreshIndicator(
          onRefresh: refreshPage,
          child: ListView.builder(
              itemCount: returndata.length,
              itemBuilder: (BuildContext context, int index){
                return Column(
                  children: [
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: ListTile(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                              topLeft:Radius.circular(50.0),
                              bottomRight: Radius.circular(50.0)
                          )),
                          tileColor: Colors.lime,
                          title: Text(returndata[index]['P_name'].toString() ,style: TextStyle(color: Colors.deepPurple,fontSize: 20),),
                          subtitle: Text(returndata[index]['P_code'].toString(),style: TextStyle(color: Colors.deepPurpleAccent,)),
                          leading: Icon(Icons.keyboard_return_rounded,color: Colors.white),
                          trailing: Text("quantity : "+returndata[index]['P_quantity'].toString()),
                          selected: false,
                          selectedTileColor: Colors.amberAccent,
                        ),
                      ),

                    ),
                  ],
                );
              }

          ),
        ),
      ),
    );

  }
}