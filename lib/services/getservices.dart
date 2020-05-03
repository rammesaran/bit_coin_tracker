import 'package:bit_coin_ticker/Model/bitcoinmodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class GetNetworkService {
  Future<BitcoinModel> getservice(String currency) async {

    final apiurl =
        'https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC$currency';
    final apikey = 'ZjdhNTQwMTYyZmMyNGJjOGJhOTI1NWZlOGEyOTFiODQ';

    http.Response response = await http.get(
      apiurl,
      headers: {"x-ba-key": apikey},
    );
    final int statuscode = response.statusCode;
    if (statuscode < 200 || statuscode > 400 || json == null) {
      throw Exception("error occured");
    }
    BitcoinModel valueMap = BitcoinModel.fromJson(jsonDecode(response.body));
    return valueMap;
  }
}
