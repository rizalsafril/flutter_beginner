import 'package:flutter/material.dart';
import 'package:flutter_beginner/login/login.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> _formKey = GlobalKey();
  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final morepassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          InkWell(
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Login()));
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 25),
              child: Row(
                children: [
                  Icon(Icons.arrow_back),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 50, 10, 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: username,
                    maxLength: 100,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Your Username",
                      labelText: "Username",
                      suffixIcon: Icon(Icons.verified_user_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: email,
                    maxLength: 100,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Your Email Adress",
                      labelText: "Email",
                      suffixIcon: Icon(Icons.email_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: password,
                    maxLength: 100,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Your Password",
                      labelText: "Password",
                      suffixIcon: Icon(Icons.lock_outline),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: morepassword,
                    maxLength: 100,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "More Password",
                      labelText: "Password",
                      suffixIcon: Icon(Icons.lock_outline),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                          child: Material(
                            color: Colors.green[900],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 5.0, bottom: 5.0),
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                color: Colors.green[900],
                                child: Text(
                                  "REGISTER",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
