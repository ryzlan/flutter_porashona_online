import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class SubjectListPage extends StatefulWidget {
  SubjectListPage({Key key}) : super(key: key);

  @override
  _SubjectListPageState createState() => _SubjectListPageState();
}

class _SubjectListPageState extends State<SubjectListPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              "BCS Examination",
              style: TextStyle(
                  color: Color.fromRGBO(34, 33, 52, 1),
                  fontFamily: 'HKBold',
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              "45th Preliminary - Nov 2020",
              style: TextStyle(
                  color: Color.fromRGBO(138, 146, 159, 1),
                  fontFamily: 'HKBold',
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15,
            ),
            _columnIconWidget(),
            SizedBox(
              height: 15,
            ),
            _subjectsListWidget(),
            SizedBox(
              height: 15,
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
      )),
    );
  }

  _columnIconWidget() {
    return Container(
      // alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _iconWidgets("Daily Quiz", 'assets/images/icons/icon2.png',
              '25 FRIENDS PLAYED TODAY'),
          _iconWidgets("Personalized Quiz", 'assets/images/icons/icon3.png'),
          _iconWidgets(
              "Real Mock Exams", 'assets/images/icons/icon1.png', '200 Online')
        ],
      ),
    );
  }

  _iconWidgets(String text, String icon, [String stats]) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10, right: 10, bottom: 10),
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
          ),
          stats != null
              ? Container(
                  margin: EdgeInsets.only(left: 10),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color.fromRGBO(247, 245, 251, 1),
                  ),
                  child: Text(
                    stats,
                    style: TextStyle(
                        color: Color.fromRGBO(73, 65, 109, 1),
                        fontFamily: 'HKRegular',
                        fontSize: 11.0,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                )
              : SizedBox(
                  width: 1,
                )
        ],
      ),
    );
  }

  _subjectsListWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _subject('Bangla Language & Literature (35)'),
        _subject('English Language & Literature (35)'),
        _subject('Bangladesh Affairs (30)'),
        _subject('International Affairs (30)'),
        _subject('Geography (10)'),
      ],
    );
  }

  _subject(String title) {
    final arrowButton = new Container(
      height: 80,
      width: MediaQuery.of(context).size.width * 0.85,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 15),
      decoration: new BoxDecoration(
          color: Color.fromRGBO(244, 246, 249, 1),
          // shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(217, 217, 217, 0.2),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            width: 140,
            // height: 30,
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromRGBO(19, 19, 19, 1),
                  fontFamily: 'HKRegular',
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(flex: 1, child: _rowIconWidgets())
        ],
      ),
    );

    final planetCard = new Positioned(
      right: -15,
      top: 25,
      child: Container(
        //margin: EdgeInsets.symmetric(vertical: 16),
        alignment: FractionalOffset.topCenter,
        child: Container(
          width: 30,
          height: 30,
          // padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Theme.of(context).primaryColor,
          ),
          child: Icon(
            Icons.arrow_forward,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
    );

    return Container(
      // margin: const EdgeInsets.symmetric(vertical: 16.0),

      child: new Stack(
        fit: StackFit.loose,
        overflow: Overflow.visible,
        children: [
          arrowButton,
          planetCard,
        ],
      ),
    );
  }

  _rowIconWidgets() {
    return Row(
      // mainAxisSize: MainAxisSize.min,

      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RaisedButton.icon(
          elevation: 0,
          padding: EdgeInsets.all(0),
          onPressed: () {},
          label: Text(
            '6000 Questions',
            style: TextStyle(
                color: Color.fromRGBO(19, 19, 19, .6),
                fontFamily: 'HKBold',
                fontSize: 9.0),
          ),
          icon: Icon(
            Icons.question_answer,
            color: Theme.of(context).primaryColor,
            size: 15,
          ),
          textColor: Colors.white,
          color: Colors.transparent,
        ),
        RaisedButton.icon(
          elevation: 0,
          padding: EdgeInsets.all(0),
          onPressed: () {},
          label: Text(
            '400 Articles',
            style: TextStyle(
                color: Color.fromRGBO(19, 19, 19, .6),
                fontFamily: 'HKBold',
                fontSize: 9.0),
          ),
          icon: Icon(
            Icons.event_note,
            color: Theme.of(context).primaryColor,
            size: 15,
          ),
          textColor: Colors.white,
          color: Colors.transparent,
        ),
        RaisedButton.icon(
          elevation: 0,
          padding: EdgeInsets.all(0),
          onPressed: () {},
          label: Text(
            '200+ Quizzes',
            style: TextStyle(
                color: Color.fromRGBO(19, 19, 19, .6),
                fontFamily: 'HKBold',
                fontSize: 9.0),
          ),
          icon: Icon(
            Icons.watch,
            color: Theme.of(context).primaryColor,
            size: 15,
          ),
          textColor: Colors.white,
          color: Colors.transparent,
        ),
      ],
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
      height: MediaQuery.of(context).size.height * 0.50,
      padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: subjects.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(right: 10),

              width: MediaQuery.of(context).size.width * 0.8,
              // padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(112, 112, 112, 0.08),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: Offset(4, 2), // changes position of shadow
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
