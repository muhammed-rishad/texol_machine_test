import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:texol_machine_test/src/model/stock.dart';
import 'package:texol_machine_test/src/utilities/constants.dart';
import 'package:texol_machine_test/src/utilities/enums.dart';


class StockMarketProvider extends ChangeNotifier {
  List<Stock> stockList = [];
  ProviderStatus status = ProviderStatus.IDLE;

  ///fetch data from api
  getData() async {
    try {
      stockList.clear();
      status = ProviderStatus.LOADING;
      notifyListeners();
      final response = await http.get(
          Uri.parse("${Constants.API_BASE_URL}b/6297363b402a5b3802181620"));

      if (response.statusCode == Constants.SUCCESS_CODE) {
        List items = json.decode(response.body);
        for (final element in items) {
          stockList.add(Stock.fromJson(element));
        }
        status = ProviderStatus.LOADED;
        notifyListeners();
      } else {
        status = ProviderStatus.ERROR;
        notifyListeners();
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('error is' + e.toString());
      status = ProviderStatus.ERROR;
      notifyListeners();
    }
  }
}
