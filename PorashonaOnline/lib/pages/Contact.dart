import 'dart:io';
import 'dart:math';
import 'dart:convert';
import 'package:bot_toast/bot_toast.dart';
import 'package:http/http.dart' as http;
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import './test.dart';
import '../api_urls.dart';

class ContactPage extends StatefulWidget {
  ContactPage({Key key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  List<Contact> contacts = [];
  final authcodeStorage = FlutterSecureStorage();
  String accessToken = '';
  List<String> jsonArray = [];
  @override
  void initState() {
    super.initState();
  }

  _getToken() async {
    String accessT = await authcodeStorage.read(key: "accessToken");
    print(accessT);
    setState(() {
      accessToken = accessT;
    });
  }

  getPermissions() async {
    if (await Permission.contacts.request().isGranted) {
      _getToken();
      getAllContacts();
    }
  }

  getAllContacts() async {
    List<Contact> _contacts = (await ContactsService.getContacts()).toList();
    print(_contacts.length);
    _contacts.forEach((contact) {
      // print(contact.displayName);
      // print(contact.phones.elementAt(0).value);
      ContactInfo c = new ContactInfo(
          name: contact.displayName,
          numbers: contact.phones != null && contact.phones.length > 0
              ? contact.phones.elementAt(0).value
              : '');
      String json = jsonEncode(c);

      setState(() {
        jsonArray.add(json);
      });
    });
    _postContacts(jsonArray);
  }

  _postContacts(List<String> jsonArray) async {
    print(this.accessToken);
    print(jsonArray);
    final http.Response response = await http.post(contact_url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'authorization': "Bearer " + this.accessToken,
          'Accept': 'application/json'
        },
        body: jsonEncode(jsonArray));

    print(response.statusCode);
    print(response.body.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Theme.of(context).backgroundColor,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 60,
          ),
          Image.asset('assets/images/contacts.png'),

          Text(
            "Contacts",
            style: Theme.of(context).textTheme.headline2,
          ),
          Text(
            "With access to your contacts, we will allow you to add mutual friends who are studying the same course.",
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
          // SizedBox(
          //   height: 20,
          // ),
          Container(
            width: 200,
            height: 60,
            margin: EdgeInsets.only(top: 60),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).primaryColor,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(112, 112, 112, 0.2),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ]),
            child: FlatButton(
              onPressed: () {
                getPermissions();
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Text(
                        "Allow",
                        style: Theme.of(context).textTheme.bodyText2,
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      // margin: EdgeInsets.symmetric(horizontal: 20),
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Theme.of(context).highlightColor,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(112, 112, 112, 0.2),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          FlatButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Test()),
              );
            },
            child: Text(
              "SKIP",
              style: Theme.of(context).textTheme.headline3,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    ));
  }
}

class ContactInfo {
  String name;
  String numbers;

  ContactInfo({this.name, this.numbers});
  ContactInfo.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        numbers = json['numbers'];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'numbers': numbers,
    };
  }
}
