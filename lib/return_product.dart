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
  Widget build(BuildContext context) {

    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lime,
          title: Text("Return Product"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 25.0,right: 20.0,bottom: 25.0,left: 10.0),
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 40.0,bottom: 10.0,right: 20.0),
                  child: Container(
                    height: 120,
                    width: 120,
                    // color: Colors.amberAccent,
                    child: Image.asset("assets/images-removebg-preview.png",),
                  ),
                )
              ),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    labelText: 'Product Name',
                    hintText: '',
                    icon: Icon(Icons.production_quantity_limits,color: Colors.lime,)
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 30.0)),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    labelText: 'Product Code',
                    hintText: '',
                    icon: Icon(Icons.radar_rounded,color: Colors.lime,)
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 30.0)),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    labelText: 'Number of quantity',
                    hintText: '',
                    icon: Icon(Icons.add_box_outlined,color: Colors.lime,)
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 30.0)),
              GestureDetector(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage())
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 40.0,right: 5.0),
                  child: Center(
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                          color: Colors.lime,
                          borderRadius: BorderRadius.circular(50.0)
                      ),

                      child: Center(
                        child: Text(
                          "Save Return",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );

  }
}