import 'package:bit_coin_ticker/Model/bitcoinmodel.dart';
import 'package:bit_coin_ticker/screens/coin_data.dart';
import 'package:bit_coin_ticker/services/getservices.dart';
import 'package:flutter/material.dart';

class CurrentChanges extends StatefulWidget {
  @override
  _CurrentChangesState createState() => _CurrentChangesState();
}

class _CurrentChangesState extends State<CurrentChanges> {
  String dropdownValue = 'USD';
  GetNetworkService service=new GetNetworkService();
  BitcoinModel bitcoinModel = BitcoinModel();
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
              child: Card(
                color: Colors.lightBlueAccent,
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                  child: Text(
                    "1 BTC =${bitcoinModel.last.round().toString()} $dropdownValue",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
             Container(
              height: 100.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30.0),
              color: Colors.lightBlue,
              child: _androidDropdown(),
            ),
          ],
      ),
    );
  }

   DropdownButton<String> _androidDropdown() {

    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currencylist) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: dropdownValue,
      items: dropdownItems,
       onChanged: (value) async{
       var response=await   service.getservice(value);

       setState(() {
         dropdownValue = value;
         bitcoinModel.last = response.last;
         print(value);
       });
      },
   );
  }
}