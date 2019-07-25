import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  // const HomePage({Key key, @required this.user}) : super(key: key);
  // final FirebaseUser user;
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  build(context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Montserrat'),
      routes: <String, WidgetBuilder>{
        // '/signup': (BuildContext context) => new SignupPage()
      },
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text(
              // 'Home ${widget.user.email}',
              'Home'),
        ),
      ),
    );
  }
}
