
import 'dart:async';

import 'package:bit_coin_ticker/Model/bitcoinmodel.dart';
import 'package:bit_coin_ticker/screens/coin_data.dart';
import 'package:bit_coin_ticker/services/getservices.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  StreamController _postsController;

  GetNetworkService service = GetNetworkService();
  BitcoinModel bitcoinModel = BitcoinModel();
 
  loadPosts(String c) async {
    service.getservice(c).then((res) async {
      _postsController.add(res);
      return res;
    });
  }
  @override
  void initState() {
        _postsController =  StreamController();
      loadPosts('USD');
    super.initState();

  }
@override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('🤑 Coin Ticker'),
      ),
      body: StreamBuilder(
        stream: _postsController.stream,
        builder: (BuildContext context, snapshot){
          if(snapshot.hasError) print(snapshot.error);
        return snapshot.hasData ? ModelData(bitcoinModel: snapshot.data) :  Center(child: CircularProgressIndicator());
        }
      ),
    );
  }
}

class ModelData extends StatefulWidget {

    final BitcoinModel bitcoinModel;
    ModelData({this.bitcoinModel});

    

  @override
  _ModelDataState createState() => _ModelDataState();
}

class _ModelDataState extends State<ModelData> {
  String dropdownValue = 'USD';
  GetNetworkService service=new GetNetworkService();


  DropdownButton<String> androidDropdown() {

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
         widget.bitcoinModel.last = response.last;
         print(value);
       });
      },
   );
  }

  
  int value;
  @override
  Widget build(BuildContext context) {
    
    return Column(
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
                    "1 BTC =${widget.bitcoinModel.last.round().toString()} USD",
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
              child: androidDropdown(),
            ),
          ],
        );
  }
}