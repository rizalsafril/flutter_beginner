import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beginner/data/userservice/userservice.dart';
import 'package:flutter_beginner/home/home.dart';
import 'package:flutter_beginner/login/login.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: UserService().user,
        // ignore: missing_return
        builder: (BuildContext context, AsyncSnapshot<User> data) {
          switch (data.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.none:
              return Login();
              break;
            case ConnectionState.active:
              User user = data.data;
              if (user == null) {
                return Login();
              }
              return MyHome();
              break;
            case ConnectionState.done:
              return Center(
                child: Text(
                  "User already logged in",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              );
              break;
          }
        });
  }
}
