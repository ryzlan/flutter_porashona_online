import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

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
    'assets/images/blogs/blog1.png',
    'assets/images/blogs/blog2.png',
    'assets/images/blogs/blog1.png',
    'assets/images/blogs/blog2.png'
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
                height: 30,
              ),
              Text(
                "Study",
                style: TextStyle(
                    color: Color.fromRGBO(34, 33, 52, 1),
                    fontFamily: 'HKBold',
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Container(
                width: 250,
                alignment: Alignment.center,
                child: Text(
                  'Try our Daily Quizzes with hundreds of' +
                      '\n' +
                      'competitors to know your chances!',
                  style: TextStyle(
                      color: Color.fromRGBO(138, 146, 159, 1),
                      fontFamily: 'HKRegular',
                      fontSize: 15.0,
                      fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              _rowIconsWidget(),
              SizedBox(
                height: 20,
              ),
              _noteWidget(),
              SizedBox(
                height: 20,
              ),
              Text(
                "Facebook Live",
                style: Theme.of(context).textTheme.headline2,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 20,
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
              _blogListWidget(context),
              SizedBox(
                height: 50,
              )
            ],
          ),
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
                    RichText(
                        text: TextSpan(
                            text: '43',
                            style: Theme.of(context).textTheme.subtitle1,
                            children: [
                          TextSpan(
                              text: 'rd',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'HKBold',
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              )),
                          TextSpan(
                              text: ' BSC',
                              style: Theme.of(context).textTheme.subtitle1)
                        ])),
                    Text(
                        '41st BCS Preliminary Subject' +
                            '\n' +
                            'Final Crash Course',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'HKRegular',
                            fontSize: 12.0,
                            fontWeight: FontWeight.normal))
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
                          borderRadius: BorderRadius.circular(12),
                          color: Color.fromRGBO(255, 255, 255, .1),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Color.fromRGBO(255, 255, 255, .3),
                          ),
                          child: Icon(
                            Icons.note_add,
                            color: Colors.transparent,
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
            text: TextSpan(
                text: 'Friday 21st to Saturday 22nd .',
                style: TextStyle(
                    color: Color.fromRGBO(59, 59, 77, 1),
                    fontFamily: 'HKBold',
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold),
                children: [
              TextSpan(
                  text: ' 2 Classes',
                  style: TextStyle(
                      color: Color.fromRGBO(108, 123, 138, 1),
                      fontFamily: 'HKRegular',
                      fontSize: 10.0,
                      fontWeight: FontWeight.normal))
            ])),
        SizedBox(
          height: 20,
        ),
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
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color.fromRGBO(244, 246, 249, 1),
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
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
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
                  'Until recently, the prevailing view assus...',
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
              margin: EdgeInsets.only(right: 20),
              width: MediaQuery.of(context).size.width * 0.75,
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
                      height: MediaQuery.of(context).size.height * 0.15,
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

  _blogListWidget(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.60,
      //MediaQuery.of(context).size.height * 0.70,
      padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: subjects.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(top: 10, bottom: 20, right: 10),
              width: MediaQuery.of(context).size.width * 0.8,
              // padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(60, 128, 209, 0.09),
                      spreadRadius: 1,
                      blurRadius: 19,
                      offset: Offset(0, 12), // changes position of shadow
                    ),
                  ]),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(16)),
                      child: Image.asset(
                        blogImages[index],
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      // alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            subjects[index],
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromRGBO(84, 104, 255, 1),
                                fontFamily: 'HKRegular',
                                fontSize: 14,
                                fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            subHeading[index],
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromRGBO(52, 67, 86, 1),
                                fontFamily: 'HKBold',
                                fontSize: 20,
                                fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 4,
                                child: Text(
                                  lessons[index],
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color.fromRGBO(52, 67, 86, 1),
                                      fontFamily: 'HKRegular',
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                              Spacer(
                                flex: 1,
                              ),
                              Expanded(
                                flex: 1,
                                child: LinearPercentIndicator(
                                  lineHeight: 8.0,
                                  percent: 0.4,
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  backgroundColor:
                                      Color.fromRGBO(151, 151, 151, 0.3),
                                  progressColor: Color.fromRGBO(0, 217, 205, 1),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ]),
            );
          }),
    );
  }
}
