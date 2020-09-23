import 'dart:convert';
import 'dart:io';
import 'package:PorashonaOnline/pages/LoginVerify.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:libphonenumber/libphonenumber.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:PorashonaOnline/api_urls.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  bool isLoading = true;
  String initialCountry = 'BD';
  PhoneNumber phone_number =
      new PhoneNumber(countryCode: null, countryISOCode: null, number: null);

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  _callAuthenticationApi(PhoneNumber phoneNumber) async {
    final http.Response response = await http.post(login_url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'phone': phoneNumber.number,
          'phone_country': phoneNumber.countryISOCode
        }));
    print(response.statusCode);
    if (response.statusCode > 250) {
      BotToast.showSimpleNotification(
          backgroundColor: Theme.of(context).colorScheme.onError,
          title: "There was a Error, Please Check the Mobile Number",
          duration: Duration(seconds: 5));
      setState(() {
        isLoading = false;
      });
    } else {
      BotToast.showSimpleNotification(
          backgroundColor: Theme.of(context).backgroundColor,
          title: json.decode(response.body)['message'],
          duration: Duration(seconds: 5));
      //send to next page
      setState(() {
        isLoading = true;
      });
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => LoginVerify(
                phoneNumber: phoneNumber.number,
                isoCode: phoneNumber.countryISOCode)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(hintColor: Color(0xff3D3D45)),
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Theme.of(context).primaryColor,
                  size: 24.0,
                ),
                onPressed: () {
                  exit(0);
                }),
            centerTitle: true,
            backgroundColor: Theme.of(context).backgroundColor,
            title: Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                "Let's get Started!",
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
                  "Enter your mobile number to enable 2-step verification.",
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
                                height: 60,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).backgroundColor,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromRGBO(112, 112, 112, 0.2),
                                      spreadRadius: 1,
                                      blurRadius: 3,
                                      offset: Offset(
                                          0, 2), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: IntlPhoneField(
                                  style: Theme.of(context).textTheme.headline1,
                                  showDropdownIcon: false,
                                  textAlign: TextAlign.left,
                                  decoration: InputDecoration(
                                    enabledBorder: InputBorder.none,
                                    hintText: '|  Mobile Number',
                                    counterText: '',
                                    hintStyle:
                                        Theme.of(context).textTheme.headline6,
                                    border: InputBorder.none,
                                  ),
                                  initialCountryCode: 'BD',
                                  onChanged: (phone) {
                                    print(phone.completeNumber);
                                    setState(() {
                                      phone_number = PhoneNumber(
                                          number: phone.number,
                                          countryISOCode: phone.countryISOCode,
                                          countryCode: phone.countryCode);
                                    });
                                  },
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 60,
                                margin: EdgeInsets.only(top: 150),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Theme.of(context).primaryColor,
                                ),
                                child: FlatButton(
                                  onPressed: () async {
                                    setState(() {
                                      isLoading = false;
                                    });

                                    if (this.phone_number.number.length < 10) {
                                      BotToast.showSimpleNotification(
                                          backgroundColor: Theme.of(context)
                                              .colorScheme
                                              .onError,
                                          title:
                                              "Please Check if the Number is Correct!",
                                          duration: Duration(seconds: 3));
                                      setState(() {
                                        isLoading = true;
                                      });
                                    } else if (this
                                        .phone_number
                                        .countryCode
                                        .isEmpty) {
                                      BotToast.showSimpleNotification(
                                          backgroundColor: Theme.of(context)
                                              .colorScheme
                                              .onError,
                                          title:
                                              "Please Select a Country Code!",
                                          duration: Duration(seconds: 3));
                                      setState(() {
                                        isLoading = true;
                                      });
                                    } else if (!await PhoneNumberUtil
                                        .isValidPhoneNumber(
                                            phoneNumber:
                                                phone_number.completeNumber,
                                            isoCode:
                                                phone_number.countryISOCode)) {
                                      BotToast.showSimpleNotification(
                                          backgroundColor: Theme.of(context)
                                              .colorScheme
                                              .onError,
                                          title: "Please Enter A valid Number!",
                                          duration: Duration(seconds: 3));
                                      setState(() {
                                        isLoading = true;
                                      });
                                    } else {
                                      _callAuthenticationApi(this.phone_number);
                                    }
                                  },
                                  child: this.isLoading
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
          ),
        ));
  }
}
