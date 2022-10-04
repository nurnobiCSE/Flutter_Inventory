import 'package:chat/View_product.dart';
import 'package:chat/user_stuff.dart';
import 'package:chat/add_sale.dart';
import 'package:chat/main.dart';
import 'package:chat/return_product.dart';
import 'package:flutter/material.dart';
import 'dart:io';
class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isShown = true;
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.deepOrangeAccent,
          centerTitle: true,
          title: Text("Inventory Management"),
        ),

        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/logo.png",
                      height: 300,
                      width: 300,
                    )
                  ],
                ),
                height: MediaQuery.of(context).size.height / 4.5,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    // border: Border.all(width: 1.0),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(60.0),
                        bottomRight: Radius.circular(60.0))),
              ),
              // SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(15),
                        color: Colors.white
                    ),
                    child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawMaterialButton(
                              onPressed: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => AddPage())
                                );
                              },
                              elevation: 2,
                              fillColor: Colors.deepPurple,
                              child: Icon(
                                Icons.manage_accounts,
                                color: Colors.white,
                                size: 40.0,
                              ),
                              padding: EdgeInsets.all(15.0),
                              shape: CircleBorder(),
                            ),
                            SizedBox(height: 5.0,),
                            Text("View Stuff user")
                          ],
                        )
                    ),
                    height: MediaQuery.of(context).size.height/5,
                    width: MediaQuery.of(context).size.width /2.7,
                    // color: Colors.white,
                    margin:EdgeInsets.only(
                      top: 7.0,
                    ),
                  ),
                  SizedBox(width: 10.0,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawMaterialButton(
                              onPressed: (){
                                Navigator.push(context,
                                MaterialPageRoute(builder: (context) => ReturnPage())
                                );
                              },
                              elevation: 2,
                              fillColor: Colors.lime,
                              child: Icon(
                                Icons.backpack_sharp,
                                color: Colors.white,
                                size: 40.0,
                              ),
                              padding: EdgeInsets.all(15.0),
                              shape: CircleBorder(),
                            ),
                            SizedBox(height: 5.0,),
                            Text("View Return\n    Product")
                          ],
                        )
                    ),
                    height: MediaQuery.of(context).size.height/5,
                    width: MediaQuery.of(context).size.width /2.7,
                    margin:EdgeInsets.only(
                      top: 7.0,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawMaterialButton(
                              onPressed: (){
                                Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => ViewPage())
                                );
                              },
                              elevation: 2,
                              fillColor: Colors.pink,
                              child: Icon(
                                Icons.view_quilt_outlined,
                                color: Colors.white,
                                size: 40.0,
                              ),
                              padding: EdgeInsets.all(15.0),
                              shape: CircleBorder(),
                            ),
                            SizedBox(height: 5.0,),
                            Text("View Product")
                          ],
                        )
                    ),
                    height: MediaQuery.of(context).size.height/5,
                    width: MediaQuery.of(context).size.width /2.7,
                    margin:EdgeInsets.only(
                      top: 7.0,
                    ),
                  ),
                  SizedBox(width: 10.0,),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color:Colors.white
                    ),
                    child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawMaterialButton(
                              onPressed: (){
                                Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => SalePage())
                                );
                              },
                              splashColor: Colors.blueAccent,
                              elevation: 2,
                              fillColor: Colors.teal,
                              child: Icon(
                                Icons.attach_money_sharp,
                                color: Colors.white,
                                size: 40.0,
                              ),
                              padding: EdgeInsets.all(15.0),
                              shape: CircleBorder(),
                            ),
                            SizedBox(height: 5.0,),
                            Text("Add Sales")
                          ],
                        )
                    ),
                    height: MediaQuery.of(context).size.height/5,
                    width: MediaQuery.of(context).size.width /2.7,

                    margin:EdgeInsets.only(
                      top: 7.0,
                    ),
                  )
                ],
              ),
              SizedBox(height:30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height /10,
                    width: MediaQuery.of(context).size.width / 3,
                    // color:Colors.red,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      color: Colors.deepOrange,
                      onPressed: (){
                        showDialog(context: context, builder: (context){
                          return AlertDialog(
                            backgroundColor: Colors.white,
                            title: Text("Confirmation",style: TextStyle(color: Colors.blueGrey,fontSize: 24,fontWeight: FontWeight.bold),),
                            content: Text("LogOut ?",style: TextStyle(color: Colors.pink),),
                            actions: [
                              TextButton(onPressed: (){
                                // setState((){
                                //   _isShown = false;
                                // });
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => LoginPage())
                                );
                              }
                                  , child: Text("YES",style: TextStyle(color: Colors.pink,fontWeight: FontWeight.bold),)
                              ),
                              TextButton(
                                  onPressed:(){
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("NO"))
                            ],
                          );
                        });
                      },

                      child: Icon(Icons.exit_to_app,color: Colors.white,size: 45.0,),
                    ),
                  )
                ],
              ),

            ],
          ),
        ),

      ),
    );

  }
}