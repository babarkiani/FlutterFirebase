import 'package:flutter/material.dart';
import 'package:login_app/home/home_page.dart';
import 'package:login_app/signup/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

// main() {
//   runApp(LoginPage());
// }
class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  String email;
  String password;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  login(String email, String password) async {
    FirebaseUser user = await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((onValue) async {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('uid', onValue.uid);
    });
    if (user == null) {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => HomePage()));
    }

    // builder: (BuildContext context) => HomePage(user: user)));
    /* SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('uid', user.uid);

    print(prefs.getString('uid')); */

    return user;
  }

  build(context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Montserrat'),
      routes: <String, WidgetBuilder>{
        // '/signup': (BuildContext context) => new SignupPage()
      },
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        // appBar: AppBar(
        //   title: Text(
        //     'Login',
        //   ),
        // ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
              child: Text(
                'Welcome',
                style: TextStyle(fontFamily: 'Montserrat', fontSize: 50.0),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                    onChanged: (String value) {
                      setState(() {
                        email = value.trim();
                      });
                    },
                  ),
                  SizedBox(height: 40.0),
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                    obscureText: true,
                    onChanged: (String value) {
                      setState(() {
                        password = value;
                      });
                    },
                  ),
                  SizedBox(height: 1.0),
                  // Container(
                  //   alignment: Alignment(1.0, 0.0),
                  //   padding: EdgeInsets.only(top: 15.0, left: 20.0),
                  //   child: InkWell(
                  //     child: Text(
                  //       'Forgot Password',
                  //       style: TextStyle(
                  //           color: Colors.green,
                  //           fontFamily: 'Montserrat',
                  //           fontWeight: FontWeight.bold,
                  //           decoration: TextDecoration.underline),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 40.0),
                  Container(
                    height: 40.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.greenAccent,
                      color: Colors.green,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            login(email, password);
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (BuildContext context) =>
                            //             HomePage(user : user)));
                          });
                        },
                        child: Center(
                          child: Text('LOGIN',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    height: 40.0,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 1.0),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: ImageIcon(AssetImage('')),
                          ),
                          Center(
                            child: Text(
                              'Log in with facebook',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    height: 40.0,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 1.0),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: ImageIcon(AssetImage('')),
                          ),
                          Center(
                            child: Text(
                              'Log in with Google',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'New here?',
                  style: TextStyle(fontFamily: 'Montserrat'),
                ),
                SizedBox(
                  width: 5.0,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => SignupPage()));
                  },
                  child: Text('Register',
                      style: TextStyle(
                          color: Colors.green,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
