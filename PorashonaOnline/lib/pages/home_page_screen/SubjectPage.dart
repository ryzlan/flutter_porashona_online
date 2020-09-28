import 'package:flutter/material.dart';

class SubjectPage extends StatefulWidget {
  SubjectPage({Key key}) : super(key: key);

  @override
  _SubjectPageState createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(shrinkWrap: true, children: [
          SizedBox(
            height: 30,
          ),
          Container(
            width: 100,
            child: Text(
              "Bangla Language & Literature",
              style: TextStyle(
                  color: Color.fromRGBO(52, 67, 86, 1),
                  fontFamily: 'HKBold',
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.40,
              alignment: Alignment.center,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color.fromRGBO(235, 234, 252, 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color.fromRGBO(107, 102, 228, 0.3),
                    ),
                    child: Icon(
                      Icons.comment,
                      color: Color.fromRGBO(63, 56, 221, 1),
                      size: 20,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 5),
                    child: Text(
                      'Saved Questions',
                      style: TextStyle(
                          color: Color.fromRGBO(73, 65, 109, 1),
                          fontFamily: 'HKBold',
                          fontSize: 13.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _rowIconsWidget(),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Scores",
              style: Theme.of(context).textTheme.headline2,
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _scoreCardWidget(),
          SizedBox(
            height: 20,
          ),
        ]),
      ),
    );
  }

  _rowIconsWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _iconWidgets("Daily" + '\n' + "Quiz", 'assets/images/icons/icon2.png'),
        _iconWidgets(
            "Personalized" + '\n' + "Quiz", 'assets/images/icons/icon3.png'),
        _iconWidgets("Mock" + '\n' + "Exams", 'assets/images/icons/icon1.png')
      ],
    );
  }

  _iconWidgets(String text, String icon) {
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            //padding: EdgeInsets.symmetric(vertical: 10),
            height: 50,
            child: Image.asset(
              icon,
              fit: BoxFit.fill,
            ),
          ),
          Text(
            text,
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'HKBold',
                fontSize: 16.0,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  _scoreCardWidget() {
    final score = Container(
      height: MediaQuery.of(context).size.height * 0.30,
      margin: EdgeInsets.only(top: 15, bottom: 15, right: 20),
      width: MediaQuery.of(context).size.width * 0.45,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).primaryColor,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(180, 180, 180, 1),
              spreadRadius: 1,
              blurRadius: 20,
              offset: Offset(2, 5), // changes position of shadow
            ),
          ]),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Container(
                  // margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color.fromRGBO(255, 255, 255, .2),
                  ),
                  child: Icon(
                    Icons.rate_review,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ],
            ),
            Text(
              '1200',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'HKRegular',
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Your Score',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'HKRegular',
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ]),
    );

    final visitors = Container(
      height: MediaQuery.of(context).size.height * 0.30,
      margin: EdgeInsets.only(top: 15, bottom: 15, right: 20),
      width: MediaQuery.of(context).size.width * 0.45,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(180, 180, 180, 0.16),
              spreadRadius: 1,
              blurRadius: 20,
              offset: Offset(2, 5), // changes position of shadow
            ),
          ]),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Container(
                  // margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color.fromRGBO(135, 80, 213, .2),
                  ),
                  child: Icon(
                    Icons.verified_user,
                    color: Theme.of(context).primaryColor,
                    size: 20,
                  ),
                ),
                RaisedButton.icon(
                  elevation: 0,
                  padding: EdgeInsets.zero,
                  color: Colors.transparent,
                  onPressed: () {},
                  label: Text(
                    '10 %',
                    style: TextStyle(
                        color: Color.fromRGBO(30, 31, 32, 1),
                        fontFamily: 'HKRegular',
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0),
                  ),
                  icon: Icon(
                    Icons.arrow_drop_up,
                    color: Color.fromRGBO(119, 194, 133, 1),
                    size: 15,
                  ),
                )
              ],
            ),
            Text(
              '2,642',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromRGBO(30, 31, 32, 1),
                  fontFamily: 'HKRegular',
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Total Visitors',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromRGBO(143, 146, 161, 1),
                  fontFamily: 'HKRegular',
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ]),
    );

    final time = Container(
      margin: EdgeInsets.only(top: 15, bottom: 15, right: 20),
      height: MediaQuery.of(context).size.height * 0.30,
      width: MediaQuery.of(context).size.width * 0.45,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(180, 180, 180, 0.16),
              spreadRadius: 1,
              blurRadius: 20,
              offset: Offset(2, 5), // changes position of shadow
            ),
          ]),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Container(
                  // margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color.fromRGBO(135, 80, 213, .2),
                  ),
                  child: Icon(
                    Icons.timer,
                    color: Theme.of(context).primaryColor,
                    size: 20,
                  ),
                ),
                RaisedButton.icon(
                  elevation: 0,
                  padding: EdgeInsets.zero,
                  color: Colors.transparent,
                  onPressed: () {},
                  label: Text(
                    '3 %',
                    style: TextStyle(
                        color: Color.fromRGBO(30, 31, 32, 1),
                        fontFamily: 'HKRegular',
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0),
                  ),
                  icon: Icon(
                    Icons.arrow_drop_up,
                    color: Color.fromRGBO(119, 194, 133, 1),
                    size: 15,
                  ),
                )
              ],
            ),
            Text(
              '3.21',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromRGBO(30, 31, 32, 1),
                  fontFamily: 'HKRegular',
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Avg Time Speed',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromRGBO(143, 146, 161, 1),
                  fontFamily: 'HKRegular',
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ]),
    );

    return Container(
      margin: EdgeInsets.only(left: 15),
      padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
      height: MediaQuery.of(context).size.height * 0.40,
      child: ListView(
          scrollDirection: Axis.horizontal, children: [score, visitors, time]),
    );
  }
}
