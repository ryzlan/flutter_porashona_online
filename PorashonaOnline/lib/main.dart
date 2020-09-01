import 'package:flutter/material.dart';
import './pages/LoginScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Porashona Online',
      theme: ThemeData(
        backgroundColor: Colors.white,
        primaryColor: Color.fromRGBO(135, 80, 213, 1),
        highlightColor: Color.fromRGBO(73, 65, 109, 1),
        accentColor: Color.fromRGBO(52, 67, 86, 1),
        scaffoldBackgroundColor: Colors.teal,
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
        ),
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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
