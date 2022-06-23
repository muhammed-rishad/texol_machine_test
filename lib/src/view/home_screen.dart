import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:texol_machine_test/src/utilities/enums.dart';
import 'package:texol_machine_test/src/view/detail_screen.dart';
import 'package:texol_machine_test/src/viewModel/stock_market_provider.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, Color> nameToColor = {
    'green': Colors.green,
    'red': Colors.red,
  };

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      context.read<StockMarketProvider>().getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stock Scan Parser'),
      ),
      body: Consumer<StockMarketProvider>(builder: (context, provider, child) {
        if (provider.status == ProviderStatus.LOADED) {
          return ListView.separated(
            shrinkWrap: true,
            itemCount: provider.stockList.length,
            separatorBuilder: (context, index) {
              return Divider(
                color: Colors.white,
              );
            },
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailScreen(
                                provider.stockList[index],
                              )));
                },
                leading: Text(
                  '.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                title: Text(
                  provider.stockList[index].name ?? '',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  provider.stockList[index].tag ?? '',
                  style: TextStyle(
                      color: nameToColor[provider.stockList[index].color]),
                ),
              );
            },
          );
        } else if (provider.status == ProviderStatus.ERROR) {
          return Center(
            child: Text('Something error!!!!!!'),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
