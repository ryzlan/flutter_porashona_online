import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import './LoginVerify.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'BD';
  PhoneNumber number = PhoneNumber(isoCode: 'BD');

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
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
                onPressed: () {}),
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
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: Offset(
                                          0, 2), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: IntlPhoneField(
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
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) => LoginVerify()),
                                    );
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 30),
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
