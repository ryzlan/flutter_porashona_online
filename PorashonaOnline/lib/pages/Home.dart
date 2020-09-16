import 'dart:io';
import 'dart:convert';
import '../api_urls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:bot_toast/bot_toast.dart';

class Home extends StatefulWidget {
  List<String> jsonArray;
  Home({Key key, this.jsonArray}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final authcodeStorage = FlutterSecureStorage();
  String accessToken = '';
  @override
  void initState() {
    _getToken().then((value) {
      if (widget.jsonArray.length > 0) {
        _postContacts(widget.jsonArray);
        print('after contacts');
      }
    });
    super.initState();
  }

  _postContacts(List<String> jsonArray) async {
    print('called post contacts');
    try {
      final http.Response response = await http.post(contact_url,
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'authorization': "Bearer " + this.accessToken,
            'Accept': 'application/json'
          },
          body: jsonEncode(jsonArray));
      print(response.statusCode);
      if (response.statusCode < 250) {
        print('sucessfully send contact information');
      } else {
        BotToast.showSimpleNotification(
            backgroundColor: Theme.of(context).backgroundColor,
            title:
                'Error occured while Communication with Server with StatusCode : ${response.statusCode}',
            duration: Duration(seconds: 5));
      }
    } on HttpException catch (error) {
      BotToast.showSimpleNotification(
          backgroundColor: Theme.of(context).backgroundColor,
          title: 'Network Error',
          duration: Duration(seconds: 5));
      throw error;
    }
  }

  Future<String> _getToken() async {
    print('calld toekn');
    String _accessToken = await authcodeStorage.read(key: "accessToken");
    setState(() {
      accessToken = _accessToken;
    });
    return _accessToken;
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
      appBar: AppBar(
        centerTitle: true,
        title: Text('HOme'),
      ),
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
