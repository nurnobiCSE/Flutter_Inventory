import 'dart:convert';

import 'package:chat/home_screen.dart';
import 'package:chat/main.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:http/http.dart' as http;
import 'package:chat/all_api.dart';

class SalePage extends StatefulWidget {

  @override
  State<SalePage> createState() => _SalePageState();
}

class _SalePageState extends State<SalePage> {
  _SalePageState(){
    _selectedValue = categories[0];
  }
  final categorySelected = "";
  final categories =  [
    "Beauty",
    "Computerized",
    "IT-Parts",
    "Mobile",
    "Grocery",
    "Food",
    "Furniture",
    "Shoes",
    "Frames",
    "Jewellery",
  ];
  String? _selectedValue = "";
  var name = TextEditingController();
  var code = TextEditingController();
  var price = TextEditingController();
  var qnt = TextEditingController();
  var _total = TextEditingController();
  var totalPrice = "";
  int total =0;
  insert()async{
    var res = http.post(Uri.parse("https://nurnobi.pythonanywhere.com/api/saleproduct/"),
    body:jsonEncode(<String, String> {
      "name":name.text,"code":code.text,"category":_selectedValue.toString(),"price":price.text,"qnt":qnt.text
    }),
      headers: <String, String>{
      "Content-Type":"application/json"
      }
    );
  }
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text("Sales Product"),
          centerTitle: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(25.0)
              )
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 20.0,right: 20.0,bottom: 15.0,left: 10.0),
          child: Column(
            children: [
              TextFormField(
                validator: (value){
                  if(value == null){
                    return "required all field";
                  }
                },
                controller: name,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    labelText: 'Product Name',
                    hintText: '',
                    icon: Icon(Icons.production_quantity_limits,color: Colors.teal,)
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 20.0)),
              TextFormField(
                controller: code,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    labelText: 'Product Code',
                    hintText: '',
                    icon: Icon(Icons.radar_rounded,color: Colors.teal,)
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 20.0,)),
              SizedBox(
                  // height: 60.0,
                  width: MediaQuery.of(context).size.width /1,
                  child: DropdownButtonFormField(
                    value: _selectedValue,
                    items: categories.map((e) =>
                        DropdownMenuItem(
                          child: Center(child: Text(e,style: TextStyle(color: Colors.black87),)),
                          value: e,
                        )
                    ).toList(),
                    onChanged:(newValue){
                      setState(() {
                        _selectedValue = newValue!;
                      });
                    },
                    decoration: InputDecoration(
                      label: Text("Choice Category--"),
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.only(left: 10.0,top: 5.0,bottom: 10.0),
                      icon: Icon(Icons.category_outlined,color: Colors.teal,)
                    ),
                  ),
                ),
              Padding(padding: EdgeInsets.only(bottom: 20.0)),
              TextFormField(
                controller: price,

                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    labelText: 'Product Price',
                    hintText: '',
                    icon: Icon(Icons.attach_money_sharp,color: Colors.teal,)
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 20.0)),
              TextFormField(
                controller: qnt,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    labelText: 'Number of quantity',
                    hintText: '',
                    icon: Icon(Icons.add_box_outlined,color: Colors.teal,)
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 20.0)),
              TextFormField(
                readOnly: true,
                controller: _total,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    labelText: 'Total price',
                    hintText: '',
                    icon: Icon(Icons.money_rounded,color: Colors.teal,)
                ),
              ),
              GestureDetector(
                onTap: (){
                    total = int.parse(price.text) * int.parse(qnt.text);
                    print(":::::::::::::::::::::::::::::::::::::: $total");
                    _total.text =total.toString();
                },
                child: Container(
                  height: 35.0,
                  width: 140,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: Center(child: Text("GetTotal price",style: TextStyle(color:Colors.orange),))
                ),

              ),
              Padding(padding: EdgeInsets.only(bottom: 20.0)),
              GestureDetector(
                onTap: (){
                  if(name.text ==null || name.text.isEmpty || code.text.isEmpty || price.text.isEmpty || qnt.text.isEmpty || _total.text.isEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("all field are required!",style: TextStyle(color: Colors.orange),),
                          duration: Duration(seconds: 3),
                        )
                    );
                  }else{
                    insert();
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("New Sale Added!",style: TextStyle(color: Colors.orange),),
                          duration: Duration(seconds: 3),
                        )
                    );
                    print("t:::::::::::::::::  $_selectedValue");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage())
                    );
                  }


                },
                child: Padding(
                  padding: EdgeInsets.only(left: 65.0,right: 45.0),
                  child: Center(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(50.0)
                      ),
                      child: Center(
                        child: Text(
                          "Add Sales",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
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
