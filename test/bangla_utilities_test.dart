import 'package:flutter_test/flutter_test.dart';

import 'package:bangla_utilities/bangla_utilities.dart';

void main() {
  test('adds one to input values', () {
    expect(BanglaUtility.englishToBanglaDigit(englishDigit: 1), '১');
    expect(BanglaUtility.isLeapYear(year: 2020), true);
    expect(BanglaUtility.isLeapYear(year: 2010), false);
    expect(
        BanglaUtility.getBanglaDateMonthYearSeason(
            day: 31, month: 5, year: 2020),
        {
          'weekday': 'রবিবার',
          'day': '১৭',
          'month': '৫',
          'monthName': 'জ্যৈষ্ঠ',
          'year': '১৪২৭',
          'season': 'গ্রীষ্ম'
        });
    expect(BanglaUtility.getBanglaDate(day: 31, month: 5, year: 2020),
        '১৭-৫-১৪২৭');
    expect(BanglaUtility.getBanglaDay(day: 31, month: 5, year: 2020), '১৭');
    expect(BanglaUtility.getBanglaMonth(day: 31, month: 5, year: 2020), '৫');
    expect(BanglaUtility.getBanglaMonthName(day: 31, month: 5, year: 2020),
        'জ্যৈষ্ঠ');
    expect(BanglaUtility.getBanglaWeekday(day: 31, month: 5, year: 2020),
        'রবিবার');
    expect(BanglaUtility.getBanglaSeason(day: 31, month: 5, year: 2020),
        'গ্রীষ্ম');
    expect(BanglaUtility.getBanglaYear(day: 31, month: 5, year: 2020), '১৪২৭');
  });
}
