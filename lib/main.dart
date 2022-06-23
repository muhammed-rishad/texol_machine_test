import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:texol_machine_test/src/utilities/constants.dart';
import 'package:texol_machine_test/src/view/home_screen.dart';
import 'package:texol_machine_test/src/viewModel/stock_market_provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<StockMarketProvider>(
      create: (_) => StockMarketProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Constants.APP_NAME,
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.black,
            colorScheme: ColorScheme.dark(),
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.blue,
            )),
        home: HomeScreen(),
      ),
    );
  }
}
