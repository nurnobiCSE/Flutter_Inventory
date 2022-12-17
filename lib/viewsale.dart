import 'package:chat/all_api.dart';
import 'package:chat/home_screen.dart';
import 'package:chat/main.dart';
import 'package:flutter/material.dart';
import 'dart:io';


class ViewSalePage extends StatefulWidget {
  @override
  State<ViewSalePage> createState() => _ViewSalePageState();
}

class _ViewSalePageState extends State<ViewSalePage> {
  @override
  Future<Null>refreshPage()async{
    await Future.delayed(Duration(seconds: 5));
    setState(() {
      saleApiCall();
    });
    return null;
  }
  @override
  Widget build(BuildContext context) {

    saleApiCall();
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.tealAccent,
          title: Text("Sales Product List ("+saledata.length.toString()+")",style: TextStyle(color: Colors.purple),),
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
              itemCount: saledata.length,
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
                          title: Text(saledata[index]['name'].toString() ,style: TextStyle(color: Colors.white,fontSize: 20),),
                          subtitle: Text("Code: "+saledata[index]['code'].toString(),style: TextStyle(color: Colors.white70,)),
                          leading: Icon(Icons.keyboard_return_rounded,color: Colors.white),
                          trailing: Text("quantity : "+saledata[index]['qnt'].toString(),style: TextStyle(color: Colors.orangeAccent),),
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