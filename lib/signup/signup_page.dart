import 'package:flutter/material.dart';
import 'package:login_app/home/home_page.dart';
import '../login/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// main() {
//   runApp(SignupPage());
// }
class SignupPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignupPageState();
  }
}

class SignupPageState extends State<SignupPage> {
  String email;
  String password;
  String username;

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Firestore firestore = new Firestore();

  void signup(String email, String password) async {
    FirebaseUser user = await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    Object userData = {'email': email, 'username': username, 'uid': user.uid};

    Future<DocumentReference> data =
        firestore.collection('users').add(userData);

    if (data != null) {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
    }
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
                'Sign-Up',
                style: TextStyle(fontFamily: 'Montserrat', fontSize: 50.0),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                    onChanged: (String value) {
                      setState(() {
                        username = value;
                      });
                    },
                  ),
                  SizedBox(height: 40.0),
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
                        ;
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
                  SizedBox(height: 30.0),
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
                            signup(email, password);
                          });
                        },
                        child: Center(
                          child: Text('Register',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ),
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
                  'Already Registered?',
                  style: TextStyle(fontFamily: 'Montserrat'),
                ),
                SizedBox(
                  width: 5.0,
                ),
                InkWell(
                  onTap: () {
                    // Navigator.of(context).pushNamed('/signup');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => LoginPage()));
                  },
                  child: Text('Login',
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
