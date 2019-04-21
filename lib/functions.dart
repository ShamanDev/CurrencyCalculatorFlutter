import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:convert';
import 'package:http/http.dart' as http;



class MainScreen extends StatefulWidget{
  MainState createState() => MainState();
}

class MainState extends State<MainScreen>{
  TextEditingController amountcontroller = TextEditingController();
  static var _currencieswithshortcuts = {'Bulgarian Lev':'BGN', 'New Zeland Dollar':'NZD', 'Israeli New Shekel':'ILS', 'Russian Ruble':'RUB', 'Canadian Dollar':'CAD', 'American Dollar':'USD', 'Philippine Peso':'PHP', 'Swiss Franc': 'CHF', 'South African Rand':'ZAR', 'Australian Dollar':'AUD', 'Japanese Yen':'JPY', 'Turkish Lira':'TRY', 'Hong Kong Dollar':'HKD', 'Malaysian Ringgit':'MYR', 'Thai Baht':'THB', 'Croatian Kuna':'HRK', 'Norwegian Krone':'NOK', 'Indonesian Rupiah':'IDR', 'Danish Krone':'DKK', 'Czech Koruna':'CZK', 'Hungarian Forint':'HUF', 'British Pound Sterling':'GBP', 'Mexican Peso': 'MXN', 'South Korean Won':'KRW', 'Icelandic Króna': 'ISK', 'Singapore Dollar': 'SGD', 'Brazilian Real': 'BRL', 'Poland Złoty':'PLN', 'Indian Rupee':'INR', 'Romanian Leu':'RON', 'Chinese Yuan':'CNY', 'Swedish Krona':'SEK', 'Euro':'EUR'};
  static var _shortcutswithcurrencies = {'BGN': 'Bulgarian Lev', 'NZD': 'New Zeland Dollar', 'ILS': 'Israeli New Shekel', 'RUB': 'Russian Ruble', 'CAD': 'Canadian Dollar', 'USD': 'American Dollar', 'PHP': 'Philippine Peso', 'CHF': 'Swiss Franc', 'ZAR': 'South African Rand', 'AUD': 'Australian Dollar', 'JPY': 'Japanese Yen', 'TRY': 'Turkish Lira', 'HKD': 'Hong Kong Dollar', 'MYR': 'Malaysian Ringgit', 'THB': 'Thai Baht', 'HRK': 'Croatian Kuna', 'NOK': 'Norwegian Krone', 'IDR': 'Indonesian Rupiah', 'DKK': 'Danish Krone', 'CZK': 'Czech Koruna', 'HUF': 'Hungarian Forint', 'GBP': 'British Pound Sterling', 'MXN': 'Mexican Peso', 'KRW': 'South Korean Won', 'ISK': 'Icelandic Króna', 'SGD': 'Singapore Dollar', 'BRL': 'Brazilian Real', 'PLN': 'Poland Złoty', 'INR': 'Indian Rupee', 'RON': 'Romanian Leu', 'CNY': 'Chinese Yuan', 'SEK': 'Swedish Krona', 'EUR': 'Euro'};
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
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
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
                    },
                  )),
                //Amount input finish
              Padding(
                padding: EdgeInsets.only(top:100, left: 99),
                child:Text("From", style: TextStyle(color: Colors.white),),
              ),

              Padding(
              padding: EdgeInsets.only(top: 120, left: 35),
              child:Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: Colors.black
                ),
                child:DropdownButton<String>(
                items:_currenciesnames.map((String value){
                  return DropdownMenuItem<String>(
                    value: value,
                    child:Text(value, style: TextStyle(color: Colors.white),),
                    );
                }).toList(),
              
                onChanged: (String value){
                  setState(() {
                    this._from = _currencieswithshortcuts[value];
                  });
                },

                value: _shortcutswithcurrencies[_from],
              
              ))),


              Padding(
                padding: EdgeInsets.only(top:180, left: 109),
                child:Text("To", style: TextStyle(color: Colors.white, fontFamily: 'Merriweather'),),
              ),


              Padding(
              padding: EdgeInsets.only(top: 200, left: 35),
              child:Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: Colors.black
                ),
                child:DropdownButton<String>(
                items:_currenciesnames.map((String value){
                  return DropdownMenuItem<String>(
                    value: value,
                    child:Text(value, style: TextStyle(color: Colors.white),),
                    );
                }).toList(),
              
                onChanged: (String value){
                  setState(() {
                    this._to = _currencieswithshortcuts[value];
                  });
                },

                value: _shortcutswithcurrencies[_to],
              
              ))),
              Padding(
                padding: EdgeInsets.only(top: 260, left:65),
                  child: RaisedButton(
                    color: Colors.red,
                    textColor: Colors.white,
                    child: Text("Calculate", textScaleFactor: 1.4),
                    onPressed: (){
                      setState(() {
                       return calculateandshow(context,amountcontroller.text, _from, _to);
                      });
                    },
                  ),
                ),
                ],
              )
            ),
          )
        
      ])
    );
  }

  void calculateandshow(BuildContext context,amount,from,to) async{

    String url = 'https://api.exchangeratesapi.io/latest?symbols='+'$to'+'&base='+'$from';
    final _response = await http.get(url);
    var _responsebody = json.decode(_response.body);
    double _rate = _responsebody['rates']['$to'];

    double _amounttodouble = double.parse('$amount');
    var _finalcalculation = _amounttodouble*_rate; // Remember to convert it to double for further calculations
    _finalcalculation = _finalcalculation.toStringAsPrecision(2)

    var _message = '$amount'+' '+ '$from' + ' => '+ '$_finalcalculation' + ' $to ';

    var alertDialog = AlertDialog(
      title: Text("Calculated succesfully", style: TextStyle(fontSize: 10.0),),
      content: Text(_message),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) => alertDialog
    );
  }
}
