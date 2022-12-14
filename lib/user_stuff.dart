import 'package:chat/home_screen.dart';
import 'package:chat/main.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:chat/all_api.dart';

class AddPage extends StatefulWidget {

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  void initState() {
    // TODO: implement initState
    userApiCall();
    super.initState();
  }
  Future<Null>refreshPage()async{
    await Future.delayed(Duration(seconds: 4));
    setState(() {
      userApiCall();
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
  print(userdata);
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text("List user stuff ("+userdata.length.toString()+")"),
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
              itemCount: userdata.length,
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
                          tileColor: Colors.teal,
                          title: Text("User Id : "+userdata[index]['username'].toString() ,style: TextStyle(color: Colors.white,fontSize: 20),),
                          subtitle: Text("User Type : "+userdata[index]['user_type'].toString(),style: TextStyle(color: Colors.white,)),
                          leading: Icon(Icons.manage_accounts,color: Colors.white),
                          // trailing: Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,),
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