import 'package:flutter/material.dart';
import 'package:flutter_beginner/data/menu.dart';
import 'package:flutter_beginner/home/dashboard.dart';
import 'package:flutter_beginner/home/profile.dart';

class MyHome extends StatefulWidget {
  MyHome({Key key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final items = menu.map((Menu e) => Menu(item: e.item, icon: e.icon)).toList();

  int _currentIndex;

  @override
  Widget build(BuildContext context) {
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
        drawer: _showingDrawer(context, items),
        body: Stack(
          children: [
            Offstage(
              offstage: _currentIndex != 1,
              child: TickerMode(
                enabled: _currentIndex == 1,
                child: Dashboard(),
              ),
            ),
            Offstage(
              offstage: _currentIndex != 2,
              child: TickerMode(
                enabled: _currentIndex == 2,
                child: Profile(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///This is a drawer
  Widget _showingDrawer(BuildContext context, List items) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 5, 5, 5),
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
                                image: AssetImage("assets/images/usericon.png"),
                                fit: BoxFit.fill)),
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Expanded(
                          flex: 9,
                          child: Text(
                            items[i].item,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Icon(items[i].icon, size: 20),
                        )
                      ],
                    )
                  ],
                );

                break;
              case 3:
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 9,
                              child: Text(items[i].item,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            Expanded(
                              flex: 1,
                              child: Icon(items[i].icon, size: 20),
                            )
                          ],
                        ),
                      ),
                    ),
                    Divider(),
                  ],
                );
                break;
              default:
                return InkWell(
                  onTap: () {
                    switch (i) {
                      case 1:
                        setState(() => _currentIndex = 1);
                        Navigator.pop(context);
                        break;
                      case 2:
                        setState(() => _currentIndex = 2);
                        Navigator.pop(context);
                        break;
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 9,
                          child: Text(
                            items[i].item,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Icon(items[i].icon, size: 20),
                        )
                      ],
                    ),
                  ),
                );
                break;
            }
          },
        ),
      ),
    );
  }
}
