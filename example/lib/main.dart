import 'package:bangla_utilities/bangla_utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Bangla Utilities Plugin example app'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Bangla date of 31st May 2020: '),
                  //
                  //
                  //day, month and year is optional parameter! Uses provide values or current date if not provided!
                  Text(
                      '${BanglaUtility.getBanglaDate(day: 31, month: 05, year: 2020)}'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Bangla Month Name: '),
                  Text(
                      '${BanglaUtility.getBanglaMonthName(day: 31, month: 05, year: 2020)}'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Bangla Weekday: '),
                  Text(
                      '${BanglaUtility.getBanglaWeekday(day: 31, month: 05, year: 2020)}'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Bangla Season: '),
                  Text(
                      '${BanglaUtility.getBanglaSeason(day: 31, month: 05, year: 2020)}'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('1234 in Bangla: '),
                  //
                  //
                  //englishDigit is a Required parameter or else returns null
                  Text(
                      '${BanglaUtility.englishToBanglaDigit(englishDigit: 1234)}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
