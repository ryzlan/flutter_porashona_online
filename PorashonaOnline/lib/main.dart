import 'package:flutter/material.dart';
import './pages/LoginScreen.dart';
import 'package:bot_toast/bot_toast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      debugShowCheckedModeBanner: false,
      title: 'Porashona Online',
      theme: ThemeData(
        backgroundColor: Colors.white,
        primaryColor: Color.fromRGBO(135, 80, 213, 1),
        highlightColor: Color.fromRGBO(73, 65, 109, 1),
        accentColor: Color.fromRGBO(52, 67, 86, 1),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.teal,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Color.fromRGBO(135, 80, 213, 1),
        ),
        colorScheme: ColorScheme.light(
            primary: Colors.white,
            onPrimary: Colors.white,
            primaryVariant: Colors.white38,
            secondary: Colors.red,
            onError: Color.fromRGBO(255, 204, 204, 1)),
        cardTheme: CardTheme(
          color: Colors.teal,
        ),
        iconTheme: IconThemeData(
          color: Colors.white54,
        ),
        textTheme: TextTheme(
            headline1: TextStyle(
                color: Color.fromRGBO(52, 67, 86, 1),
                fontFamily: 'HKRegular',
                fontSize: 24.0,
                fontWeight: FontWeight.w200),
            headline2: TextStyle(
                color: Color.fromRGBO(52, 67, 86, 1),
                fontFamily: 'HKRegular',
                fontSize: 26.0,
                fontWeight: FontWeight.w400),
            headline3: TextStyle(
                color: Color.fromRGBO(112, 112, 112, 0.8),
                fontFamily: 'HKBold',
                fontSize: 22.0,
                fontWeight: FontWeight.w600),
            headline5: TextStyle(
                color: Color.fromRGBO(135, 80, 213, 1),
                fontFamily: 'HKRegular',
                fontSize: 20,
                fontWeight: FontWeight.bold),
            headline6: TextStyle(
                color: Color.fromRGBO(52, 67, 86, 0.4),
                fontFamily: 'HKRegular',
                fontSize: 22.0,
                fontWeight: FontWeight.normal),
            bodyText1: TextStyle(
                color: Color.fromRGBO(52, 67, 86, 0.7),
                fontFamily: 'HKRegular',
                fontSize: 22.0,
                fontWeight: FontWeight.w200),
            bodyText2: TextStyle(
                color: Colors.white,
                fontFamily: 'HKRegular',
                fontSize: 21.0,
                fontWeight: FontWeight.normal),
            caption: TextStyle(
                color: Colors.black,
                fontFamily: 'HKRegular',
                fontSize: 18.0,
                fontWeight: FontWeight.normal)),
      ),
      home: LoginScreen(),
    );
  }
}
