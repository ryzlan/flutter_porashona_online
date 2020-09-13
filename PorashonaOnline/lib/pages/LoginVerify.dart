import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:PorashonaOnline/api_urls.dart';
import 'package:PorashonaOnline/pages/Contact.dart';

class LoginVerify extends StatefulWidget {
  String phoneNumber;
  String isoCode;
  LoginVerify({Key key, this.phoneNumber, this.isoCode}) : super(key: key);

  @override
  _LoginVerifyState createState() => _LoginVerifyState();
}

class _LoginVerifyState extends State<LoginVerify> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var onTapRecognizer;

  TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType> errorController;
  bool hasError = false;
  String pinCode = "";
  bool isLoading = true;
  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }

  _verifyLogin(String pinCode) async {
    String number = "0" + widget.phoneNumber;
    String iso = widget.isoCode;

    final http.Response response = await http.post(verify_url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            {'phone': number, 'phone_country': iso, 'password': pinCode}));

    print(response.statusCode);
    if (response.statusCode > 250) {
      BotToast.showSimpleNotification(
          backgroundColor: Theme.of(context).colorScheme.onError,
          title: "There was a Error, Please Enter the Correct PinCode",
          duration: Duration(seconds: 5));
      setState(() {
        isLoading = true;
      });
    } else {
      setState(() {
        isLoading = true;
      });
      print(json.decode(response.body)['access_token']);
      BotToast.showSimpleNotification(
          backgroundColor: Theme.of(context).backgroundColor,
          title: json.decode(response.body)['access_token'],
          duration: Duration(seconds: 5));
      sleep(Duration(seconds: 2));
      _storeInMemory(json.decode(response.body)['access_token']);
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ContactPage()),
      );
    }
  }

  _storeInMemory(String accessToken) async {
    final authCodeStorage = FlutterSecureStorage();
    await authCodeStorage.write(key: 'accessToken', value: accessToken);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          elevation: 0.0,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Theme.of(context).primaryColor,
                size: 24.0,
              ),
              onPressed: () {
                Navigator.pop(
                  context,
                );
              }),
          centerTitle: true,
          backgroundColor: Theme.of(context).backgroundColor,
          title: Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              "Verification",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        ),
        body: Container(
          color: Theme.of(context).backgroundColor,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "We texted you a code to verify your phone number",
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
              // SizedBox(
              //   height: 20,
              // ),
              Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Form(
                      key: formKey,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                height: 80,
                                width: double.infinity,
                                // decoration: BoxDecoration(
                                //   color: Theme.of(context).backgroundColor,
                                //   borderRadius: BorderRadius.circular(12),
                                //   boxShadow: [
                                //     BoxShadow(
                                //       color: Color.fromRGBO(112, 112, 112, 0.2),
                                //       spreadRadius: 2,
                                //       blurRadius: 2,
                                //       offset: Offset(
                                //           0, 2), // changes position of shadow
                                //     ),
                                //   ],
                                // ),
                                child: PinCodeTextField(
                                    autoDismissKeyboard: true,
                                    appContext: context,
                                    pastedTextStyle:
                                        Theme.of(context).textTheme.headline1,
                                    length: 4,
                                    textInputType: TextInputType.number,
                                    obsecureText: false,
                                    animationType: AnimationType.fade,
                                    pinTheme: PinTheme(
                                      shape: PinCodeFieldShape.box,
                                      borderRadius: BorderRadius.circular(15),
                                      borderWidth: 1.5,
                                      fieldHeight: 65,
                                      fieldWidth: 65,
                                      activeColor: Colors.white,
                                      selectedColor:
                                          Color.fromRGBO(135, 80, 213, 0.6),
                                      inactiveColor:
                                          Color.fromRGBO(112, 112, 112, 0.6),
                                      disabledColor: Colors.blue,
                                      activeFillColor: Colors.white,
                                      selectedFillColor: Colors.white,
                                      inactiveFillColor: Colors.white,
                                    ),
                                    animationDuration:
                                        Duration(milliseconds: 300),
                                    backgroundColor:
                                        Theme.of(context).backgroundColor,
                                    enableActiveFill: true,
                                    errorAnimationController: errorController,
                                    controller: textEditingController,
                                    onCompleted: (v) {
                                      print("Completed");
                                    },
                                    // onTap: () {
                                    //   print("Pressed");
                                    // },
                                    onChanged: (value) {
                                      print(value);
                                      setState(() {
                                        pinCode = value;
                                      });
                                    })),
                            Container(
                              margin: EdgeInsets.only(top: 60),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "I did not recieve a code",
                                    style: Theme.of(context).textTheme.caption,
                                    textAlign: TextAlign.center,
                                  ),
                                  FlatButton(
                                    onPressed: () {},
                                    child: Text(
                                      "RESEND",
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 60,
                              margin: EdgeInsets.only(top: 60),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Theme.of(context).primaryColor,
                              ),
                              child: FlatButton(
                                onPressed: () {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  if (this.pinCode.isEmpty) {
                                    BotToast.showSimpleNotification(
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .onError,
                                        title: "Pin-Code Cannot be Empty",
                                        duration: Duration(seconds: 5));
                                    setState(() {
                                      isLoading = true;
                                    });
                                  } else if (this.pinCode.length < 3) {
                                    BotToast.showSimpleNotification(
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .onError,
                                        title:
                                            "PinCode Cannot be less than 4 Characters",
                                        duration: Duration(seconds: 3));
                                    setState(() {
                                      isLoading = true;
                                    });
                                  } else {
                                    _verifyLogin(this.pinCode);
                                  }
                                },
                                child: isLoading
                                    ? Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 30),
                                              child: Text(
                                                "CONTINUE",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2,
                                                textAlign: TextAlign.end,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 20),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5, vertical: 5),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                color: Theme.of(context)
                                                    .highlightColor,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color.fromRGBO(
                                                        112, 112, 112, 0.2),
                                                    spreadRadius: 2,
                                                    blurRadius: 2,
                                                    offset: Offset(0,
                                                        2), // changes position of shadow
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
                                      )
                                    : CircularProgressIndicator(
                                        backgroundColor:
                                            Theme.of(context).backgroundColor,
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
