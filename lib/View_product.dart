import 'package:chat/home_screen.dart';
import 'package:chat/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
class ViewPage extends StatefulWidget {

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  var click = true;
  List product = [
    {"name":"A-product","model":"model-a"},
    {"name":"B-product","model":"model-b"},
    {"name":"C-product","model":"model-c"},
    {"name":"D-product","model":"model-d"},
    {"name":"E-product","model":"model-e"},
    {"name":"F-product","model":"model-f"},
    {"name":"G-product","model":"model-g"},
    {"name":"H-product","model":"model-h"},
    {"name":"I-product","model":"model-i"},
    {"name":"J-product","model":"model-j"},
  ];
  @override
  Widget build(BuildContext context) {
  var tileTap = false;
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text("View Product"),
          centerTitle: true,
        ),
        body:ListView.builder(
          itemCount: product.length,
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
                      tileColor: Colors.pink,
                      title: Text(product[index]['name'] ,style: TextStyle(color: Colors.white,fontSize: 20),),
                      subtitle: Text(product[index]['model'],style: TextStyle(color: Colors.white,)),
                      leading: Icon(Icons.add_shopping_cart_outlined,color: Colors.white),
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
    );

  }
}