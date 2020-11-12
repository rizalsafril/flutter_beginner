import 'package:flutter/material.dart';
import 'package:flutter_beginner/data/menu.dart';

class MyHome extends StatelessWidget {
  const MyHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = menu.map((Menu e) => Menu(item: e.item)).toList();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Row(
            children: [
              Expanded(
                child: Text(
                  "Flutter Beginner",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: ListView.separated(
              itemCount: items.length,
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
              // ignore: missing_return
              itemBuilder: (BuildContext context, int i) {
                switch (i) {
                  case 0:
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/usericon.png"),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                items[i].item,
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        )
                      ],
                    );

                    break;
                  case 3:
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(items[i].item,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    )),
                              )
                            ],
                          ),
                        ),
                        Divider(),
                      ],
                    );
                    break;
                  default:
                    return Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              items[i].item,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    );
                    break;
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
