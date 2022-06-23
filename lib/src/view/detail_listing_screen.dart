import 'package:flutter/material.dart';

class ListingScreen extends StatelessWidget {
  ListingScreen({required this.item});

  final item;
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(item.runtimeType);
    if (item.runtimeType == int) {
      _textEditingController.text = item.toString();
    }
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: item.runtimeType == int
            ? Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "RSI",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Set Parameters",
                      style: TextStyle(fontSize: 17),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      color: Colors.white,
                      child: ListTile(
                        leading: Text(
                          'Period',
                          style: TextStyle(color: Colors.black),
                        ),
                        title: TextField(
                          controller: _textEditingController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Username',
                          ),
                        ),
                        subtitle: Divider(
                          color: Colors.black,
                          thickness: 1,
                        ),
                      ),
                    )
                  ],
                ),
              )
            : Padding(
                padding: EdgeInsets.all(15),
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (ctx, index) {
                      return Text(item[index].toString());
                    },
                    separatorBuilder: (ctx, index) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Divider(
                            color: Colors.white,
                            thickness: 1,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      );
                    },
                    itemCount: item.length),
              ),
      ),
    );
  }
}
