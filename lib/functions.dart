import 'package:flutter/material.dart';
import 'dart:ui';


class MainScreen extends StatefulWidget{
  MainState createState() => MainState();
}

class MainState extends State<MainScreen>{
  TextEditingController amountcontroller = TextEditingController();
  static var _currencieswithshortcuts = {'Bulgarian Lev':'BGN', 'New Zeland Dollar':'NZD', 'Israeli New Shekel':'ILS', 'Russian Ruble':'RUB', 'Canadian Dollar':'CAD', 'American Dollar':'USD', 'Philippine Peso':'PHP', 'Swiss Franc': 'CHF', 'South African Rand':'ZAR', 'Australian Dollar':'AUD', 'Japanese Yen':'JPY', 'Turkish Lira':'TRY', 'Hong Kong Dollar':'HKD', 'Malaysian Ringgit':'MYR', 'Thai Baht':'THB', 'Croatian Kuna':'HRK', 'Norwegian Krone':'NOK', 'Indonesian Rupiah':'IDR', 'Danish Krone':'DKK', 'Czech Koruna':'CZK', 'Hungarian Forint':'HUF', 'British Pound Sterling':'GBP', 'Mexican Peso': 'MXN', 'South Korean Won':'KRW', 'Icelandic Króna': 'ISK', 'Singapore Dollar': 'SGD', 'Brazilian Real': 'BRL', 'Poland Złoty':'PLN', 'Indian Rupee':'INR', 'Romanian Leu':'RON', 'Chinese Yuan':'CNY', 'Swedish Krona':'SEK', 'Euro':'EUR'};
  static var _currenciesnames = _currencieswithshortcuts.keys;
  var _from = 'EUR';
  var _to = 'USD';
  
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
            //The black rectangle start

            child: Container(
              height: 330,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(4.0)
              ),

            //Black rectangle end
            
              child: Stack(
                children: <Widget>[

                //Amount input start
                  Padding(
                  padding: EdgeInsets.only(top: 25,left: 5, right: 5),
                  child:TextField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(height: 0.3, fontSize: 18.0, color: Colors.white),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: Colors.red)),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: Colors.white)),
                      labelText: 'Amount',
                      labelStyle: TextStyle(color: Colors.white),
                      suffixText: _from,
                      suffixStyle: TextStyle(color: Colors.white)
                    ),
                    controller: amountcontroller,
                    onChanged: (text) {
                      debugPrint(amountcontroller.text);
                    },
                  )),
                //Amount input finish
              Padding(
                padding: EdgeInsets.only(top:110, left: 99),
                child:Text("From", style: TextStyle(color: Colors.white),),
              ),

              Padding(
              padding: EdgeInsets.only(top: 120, left: 35),
              child:DropdownButton<String>(
                items:_currenciesnames.map((String value){
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),

                  );
                }).toList(),
              
                onChanged: (String value){
                  setState(() {
                    this._from = _currencieswithshortcuts[value];
                    debugPrint(this._from);
                  });
                },

                value: _currencieswithshortcuts[_from],

              )),


              Padding(
                padding: EdgeInsets.only(top:180, left: 109),
                child:Text("To", style: TextStyle(color: Colors.white),),
              ),


              Padding(
              padding: EdgeInsets.only(top: 200, left: 35),
              child:DropdownButton<String>(
                items:_currenciesnames.map((String value){
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),

                  );
                }).toList(),
              
                onChanged: (String value){
                  setState(() {
                    this._to = _currencieswithshortcuts[value];
                    debugPrint(this._to);
                  });
                },

                value: _currencieswithshortcuts[_to],

              )),
  
                ],
              )
            ),
          )
        
      ])
    );
  }
}
