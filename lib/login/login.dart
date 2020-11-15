import 'package:flutter/material.dart';
import 'package:flutter_beginner/data/userservice/userservice.dart';
import 'package:flutter_beginner/login/loading.dart';
import 'package:flutter_beginner/login/register.dart';
import 'package:flutter_beginner/wrapper.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool loading = false;

  GlobalKey<FormState> _formKey = GlobalKey();
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : SafeArea(
            child: Scaffold(
              body: ListView(children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(10, 50, 10, 20),
                    child: Form(
                      key: _formKey,
                      child: Column(children: [
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(50),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/usericon.png"),
                                    fit: BoxFit.fill,
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                            controller: email,
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.mail_outline),
                              labelText: "Email",
                              hintText: "Your Email Address",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1),
                              ),
                            ),
                            // ignore: missing_return
                            validator: (val) {
                              if (val.isEmpty) {
                                return "Email should not empty";
                              }
                            }),
                        SizedBox(height: 15),
                        TextFormField(
                            controller: password,
                            obscureText: true,
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.lock_open_outlined),
                              labelText: "Password",
                              hintText: "Your Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1),
                              ),
                            ),
                            // ignore: missing_return
                            validator: (val) {
                              if (val.isEmpty) {
                                return "Password should not be empty";
                              }
                            }),
                        SizedBox(height: 25),
                        Row(
                          children: [
                            Expanded(
                                child: Material(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              color: Colors.green[900],
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  side: BorderSide(color: Colors.green[900]),
                                ),
                                child: Text("Sign In",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                onPressed: () {
                                  loginAccess();
                                },
                              ),
                            ))
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Register()));
                              },
                              child: Text(
                                "REGISTER",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.green[900],
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ]),
                    )),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        loginWithGoogle();
                      },
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(50),
                            image: DecorationImage(
                              image: AssetImage("assets/images/google.png"),
                              fit: BoxFit.fill,
                            )),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          );
  }

  ///Login function
  void loginAccess() async {
    if (_formKey.currentState.validate()) {
      setState(() => loading = true);
      dynamic result = await UserService()
          .loginWithEmailPassword(email: email.text, password: password.text);
      if (result != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Wrapper()));
      }
    }
  }

  ///Login with google
  void loginWithGoogle() async {
    setState(() => loading = true);
    await UserService().loginWithGoogle();
  }
}
