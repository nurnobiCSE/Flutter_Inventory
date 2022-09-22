import 'package:chat/home_screen.dart';
import 'package:chat/main.dart';
import 'package:flutter/material.dart';
import 'dart:io';
class SalePage extends StatefulWidget {

  @override
  State<SalePage> createState() => _SalePageState();
}

class _SalePageState extends State<SalePage> {
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text("Sales Product"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 25.0,right: 20.0,bottom: 25.0,left: 10.0),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    labelText: 'Product Name',
                    hintText: '',
                    icon: Icon(Icons.production_quantity_limits,color: Colors.teal,)
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 30.0)),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    labelText: 'Product Code',
                    hintText: '',
                    icon: Icon(Icons.radar_rounded,color: Colors.teal,)
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 30.0)),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    labelText: 'Product Price',
                    hintText: '',
                    icon: Icon(Icons.attach_money_sharp,color: Colors.teal,)
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 30.0)),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    labelText: 'Number of quantity',
                    hintText: '',
                    icon: Icon(Icons.add_box_outlined,color: Colors.teal,)
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 30.0)),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    labelText: 'Total price',
                    hintText: '',
                    icon: Icon(Icons.money_rounded,color: Colors.teal,)
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
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(50.0)
                      ),
                      child: Center(
                        child: Text(
                          "Add Sales",
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