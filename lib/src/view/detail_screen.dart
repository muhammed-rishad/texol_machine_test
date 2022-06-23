import 'package:flutter/material.dart';
import 'package:texol_machine_test/src/model/stock.dart';
import 'package:texol_machine_test/src/utilities/colors.dart';

import 'detail_listing_screen.dart';


class DetailScreen extends StatelessWidget {
  DetailScreen(this.stock);

  final Stock stock;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              color: Colours.titlePurple,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(stock.name!),
                  Text(
                    stock.tag!,
                    style: TextStyle(
                        color:
                            stock.color == 'green' ? Colors.green : Colors.red),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListView.separated(
                shrinkWrap: true,
                itemCount: stock.criteria.length,
                separatorBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text('and'),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                },
                itemBuilder: (context, index) {
                  String _text = stock.criteria[index].text;
                  print(_text);
                  print(stock.criteria[index].text);
                  if (stock.criteria[index].valuesMap.isNotEmpty) {
                    String _tempText = '';
                    List<String> _tempStringArray = [];
                    int count = 1;
                    stock.criteria[index].valuesMap.forEach((key, value) {
                      if (_tempText.isEmpty) {
                        _tempText = _text;
                      }
                      var temp = _tempText.split(key);
                      _tempStringArray.add(temp[0]);
                      _tempStringArray.add(key);
                      if (temp.length > 1 &&
                          temp[1].isNotEmpty &&
                          count < stock.criteria[index].valuesMap.length) {
                        _tempText = temp[1];
                      } else if (temp.length > 1) {
                        _tempStringArray.add(temp[1]);
                      }
                      count++;
                    });
                    return Row(
                      children: [
                        for (int i = 0; i < _tempStringArray.length; i++)
                          stock.criteria[index].valuesMap
                                  .containsKey(_tempStringArray[i])
                              ? InkWell(
                                  child: Text(
                                    _tempStringArray[i],
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (ctx) => ListingScreen(
                                            item:
                                                stock.criteria[index].valuesMap[
                                                    _tempStringArray[i]]),
                                      ),
                                    );
                                  },
                                )
                              : Text(_tempStringArray[i])
                      ],
                    );
                  } else
                    return Text(_text);
                })
          ],
        ),
      ),
    );
  }
}
