import 'package:flutter/material.dart';
import 'dart:ui';


class MainScreen extends StatefulWidget{
  MainState createState() => MainState();
}

class MainState extends State<MainScreen>{

  TextEditingController amountcontroller = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: <Widget>[
          //Background stuff start
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image:AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover
              ),
            ),
            child:BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2.0,sigmaY: 2.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0)
                ),
              ),
            ),
          ),
          //Background stuff end
          Center(
            child: Container(
              height: 350,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(6.0)
              ),
              child: Row(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                      fillColor: Colors.white
                    ),
                    controller: amountcontroller,
                    onChanged: (text) {
                      debugPrint(amountcontroller.text);
                    },
                  ),

                ],
              ),
            ),
          )
        
      ])
    );
  }
}