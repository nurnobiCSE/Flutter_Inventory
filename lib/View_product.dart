import 'package:chat/home_screen.dart';
import 'package:chat/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:chat/all_api.dart';


class ViewPage extends StatefulWidget {
  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  @override
  void initState() {
    // TODO: implement initState
    productAddApiCall();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
  var tileTap = false;
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text("View Product List"),
          centerTitle: true,
        ),
        body:ListView.builder(
          itemCount:data_loading? 1:data.length,
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
                      tileColor:  data_loading ? Colors.black:Colors.pink,
                      title: Text(data_loading ?"Server Problem":(data !=null?  data[index]['P_name'].toString():"wrong") ,style: TextStyle(color: Colors.white,fontSize: 20),),
                      subtitle: Text(data_loading ?"Loading..........":(data !=null ?data[index]['P_code'].toString():"wrong"),style: TextStyle(color: Colors.white,)),
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