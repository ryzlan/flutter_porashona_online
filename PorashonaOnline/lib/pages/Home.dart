import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final authcodeStorage = FlutterSecureStorage();
  String accessToken = '';
  @override
  void initState() {
    _getToken();
    super.initState();
  }

  _getToken() async {
    String accessToken = await authcodeStorage.read(key: "accessToken");
    setState(() {
      accessToken = accessToken;
    });
  }

  Future<bool> _exitApp(BuildContext context) async {
    if (this.accessToken.length < 1) {
      return new Future<bool>.value(true);
    } else {
      exit(0);
      return new Future<bool>.value(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () => _exitApp(context),
        child: Center(
          child: Container(
            child: Column(
              children: [
                Text(this.accessToken),
                RaisedButton(
                  onPressed: () {},
                  child: Text("Logout"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
