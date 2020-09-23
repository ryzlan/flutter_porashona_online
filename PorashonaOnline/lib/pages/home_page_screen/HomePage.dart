import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List colors = [
    Colors.black,
    Color.fromRGBO(255, 181, 182, 1),
    Colors.black,
    Color.fromRGBO(255, 181, 182, 1)
  ];
  final List header = [
    'Running Brain Game',
    'Natural Running',
    'Running Brain Game',
    'Natural Running'
  ];
  final List subs = [
    '2.418 players',
    '1.264 players',
    '2.418 players',
    '1.264 players'
  ];
  final List images = [
    'assets/images/play/play1.png',
    'assets/images/play/play2.png',
    'assets/images/play/play1.png',
    'assets/images/play/play2.png'
  ];
  final List blogImages = [
    'assets/images/play/play1.png',
    'assets/images/play/play2.png',
    'assets/images/play/play1.png',
    'assets/images/play/play2.png'
  ];

  final List subjects = [
    'Biology Basics',
    'Cosmology',
    'Biology Basics',
    'Cosmology'
  ];
  final List subHeading = [
    'Biology & The' + '\n' + 'Scientific Method',
    'Earth Geological' + '\n' + '& Climatic HHistory',
    'Biology & The' + '\n' + 'Scientific Method',
    'Earth Geological' + '\n' + '& Climatic HHistory'
  ];

  final List lessons = [
    '4 of 8 lessons',
    '2 of 13 lessons',
    '4 of 8 lessons',
    '2 of 13 lessons'
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          // alignment: Alignment.center,
          child: ListView(
            shrinkWrap: true,
            children: [
              SizedBox(
                height: 100,
              ),
              Text(
                "Study",
                style: Theme.of(context).textTheme.headline2,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 250,
                alignment: Alignment.center,
                child: Text(
                  "Choose your end-goal, and we will help you make sure you ace at it!",
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              _cardWidget(),
              SizedBox(
                height: 50,
              ),
              _rowIconsWidget(),
              SizedBox(
                height: 50,
              ),
              _noteWidget(),
              SizedBox(
                height: 80,
              ),
              Text(
                "Facebook Live",
                style: Theme.of(context).textTheme.headline2,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 30,
              ),
              _liveFeedWidget(),
              SizedBox(
                height: 30,
              ),
              Text(
                "Play",
                style: Theme.of(context).textTheme.headline2,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 20,
              ),
              _playListWidget(),
              SizedBox(
                height: 30,
              ),
              Text(
                "Blog",
                style: Theme.of(context).textTheme.headline2,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 20,
              ),
              _blogListWidget()
            ],
          ),
        ),
      ),
    );
  }

  _cardWidget() {
    return FlatButton(
      onPressed: () {},
      child: Container(
        // margin: EdgeInsets.only(top: 60),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).primaryColorDark,
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(112, 112, 112, 0.2),
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ]),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).primaryColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 2,
                      child: Image.asset(
                        'assets/images/home.png',
                        fit: BoxFit.fill,
                      )),
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.only(left: 15),
                      alignment: Alignment.centerLeft,
                      //padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "43rd BCS Exam ",
                            style: Theme.of(context).textTheme.subtitle1,
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            "1500+ Users ",
                            style: Theme.of(context).textTheme.subtitle2,
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: RaisedButton.icon(
                    elevation: 0,
                    padding: EdgeInsets.all(0),
                    onPressed: () {},
                    label: Text(
                      '6000 Questions',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'HKBold',
                          fontSize: 9.0),
                    ),
                    icon: Icon(
                      Icons.question_answer,
                      color: Theme.of(context).primaryColor,
                      size: 12,
                    ),
                    textColor: Colors.white,
                    color: Colors.transparent,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: RaisedButton.icon(
                    elevation: 0,
                    padding: EdgeInsets.all(0),
                    onPressed: () {},
                    label: Text(
                      '400 Articles',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'HKBold',
                          fontSize: 9.0),
                    ),
                    icon: Icon(
                      Icons.ac_unit,
                      color: Theme.of(context).primaryColor,
                      size: 12,
                    ),
                    textColor: Colors.white,
                    color: Colors.transparent,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: RaisedButton.icon(
                    elevation: 0,
                    padding: EdgeInsets.all(0),
                    onPressed: () {},
                    label: Text(
                      '200+ Quizzes',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'HKBold',
                          fontSize: 9.0),
                    ),
                    icon: Icon(
                      Icons.watch_later,
                      color: Theme.of(context).primaryColor,
                      size: 12,
                    ),
                    textColor: Colors.white,
                    color: Colors.transparent,
                  ),
                ),
              ],
            )
          ],
        ),
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

  _noteWidget() {
    return Container(
      height: 150,
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).primaryColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('BCS' + '\n' + 'Coaching',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.subtitle1),
                    Text('Lorem ipsum dolor sit amet, consetetur sadipscing.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.subtitle2)
                  ],
                ),
              )),
          // Spacer(),
          Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Theme.of(context).primaryColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        // margin: EdgeInsets.symmetric(horizontal: 20),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Color.fromRGBO(151, 151, 151, .4),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Color.fromRGBO(112, 112, 112, .5),
                          ),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 20,
                          ),
                        )),
                    Text('Notes' + '\n' + '& Tricks',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.subtitle1),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  _liveFeedWidget() {
    return Column(
      children: [
        Text(
          'Friday 21st to Saturday 22nd . 2 Classes',
          style: Theme.of(context).textTheme.bodyText1,
          textAlign: TextAlign.start,
        ),
        SizedBox(
          height: 20,
        ),
        _liveFeedItem('Mohi Sir: BCS Mathematics',
            'Until recently, the prevailing view assum…'),
        _liveFeedItem('Salam Sir: BCS Analytical',
            'Until recently, the prevailing view assum…'),
        Text(
          'Sunday 23rd to Thrusday 27th . 3 Schedulled Classes',
          style: Theme.of(context).textTheme.bodyText1,
          textAlign: TextAlign.start,
        ),
        _liveFeedItem('Mohi Sir: BCS Mathematics',
            'Until recently, the prevailing view assum…'),
        _liveFeedItem('Salam Sir: BCS Analytical',
            'Until recently, the prevailing view assum…'),
        _liveFeedItem('Mohi Sir: BCS Mathematics',
            'Until recently, the prevailing view assum…'),
        _liveFeedItem('Salam Sir: BCS Analytical',
            'Until recently, the prevailing view assum…'),
      ],
    );
  }

  _liveFeedItem(String subject, String details) {
    return Container(
      height: 70,
      margin: EdgeInsets.symmetric(vertical: 15),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color.fromRGBO(112, 112, 112, .08),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              // height: 50,
              // width: 50,
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'MON',
                    style: TextStyle(
                        color: Color.fromRGBO(108, 123, 138, 1),
                        fontFamily: 'HKLight',
                        fontSize: 10,
                        fontWeight: FontWeight.normal),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '10',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'HKBold',
                        fontSize: 20,
                        fontWeight: FontWeight.normal),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mohi Sir: BCS Mathematics',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'HKBold',
                      fontSize: 11,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                Text(
                  'Until recently, the prevailing view assum…',
                  style: TextStyle(
                      color: Color.fromRGBO(108, 123, 138, 1),
                      fontFamily: 'HKRegular',
                      fontSize: 11,
                      fontWeight: FontWeight.normal),
                  textAlign: TextAlign.left,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _playListWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
      height: MediaQuery.of(context).size.height * 0.30,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: header.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(right: 10),
              width: MediaQuery.of(context).size.width * 0.8,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: colors[index],
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(
                      images[index],
                      fit: BoxFit.fill,
                    ),
                    Text(
                      header[index],
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'HKBold',
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.school,
                          color: Colors.white,
                          size: 30,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          subs[index],
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'HKRegular',
                              fontSize: 15,
                              fontWeight: FontWeight.normal),
                        )
                      ],
                    )
                  ]),
            );
          }),
    );
  }

  _blogListWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
      height: MediaQuery.of(context).size.height * 0.40,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: header.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(right: 10),
              width: MediaQuery.of(context).size.width * 0.8,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: colors[index],
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(
                      images[index],
                      fit: BoxFit.fill,
                    ),
                    Text(
                      header[index],
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'HKBold',
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.school,
                          color: Colors.white,
                          size: 30,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          subs[index],
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'HKRegular',
                              fontSize: 15,
                              fontWeight: FontWeight.normal),
                        )
                      ],
                    )
                  ]),
            );
          }),
    );
  }
}
