const kBanglaNumber = ['০', '১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯'];

const kEnglishNumber = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

const kGregEquivalentBanglaMonths = [
  "পৌষ",
  "মাঘ",
  "ফাল্গুন",
  "চৈত্র",
  "বৈশাখ",
  "জ্যৈষ্ঠ",
  "আষাঢ়",
  "শ্রাবণ",
  "ভাদ্র",
  "আশ্বিন",
  "কার্তিক",
  "অগ্রহায়ণ"
];

const kBanglaWeekdays = [
  "সোমবার",
  "মঙ্গলবার",
  "বুধবার",
  "বৃহস্পতিবার",
  "শুক্রবার",
  "শনিবার",
  "রবিবার"
];
const kGregEquivalentBanglaSeasons = [
  "শীত",
  "বসন্ত",
  "গ্রীষ্ম",
  "বর্ষা",
  "শরৎ",
  "হেমন্ত"
];

const kGregEquivalentLastDayOfBanglaMonths = [
  13,
  12,
  14,
  13,
  14,
  14,
  15,
  15,
  15,
  15,
  14,
  14
];

const kTotalDaysInBanglaMonths = [
  30,
  30,
  30,
  30,
  31,
  31,
  31,
  31,
  31,
  30,
  30,
  30
];

const kGregEquivalentLeapYearIndexInBanglaMonths = 2;

/// The main class which contains static API methods
/// ```dart
/// BanglaUtility.someMethod(params)
/// ```
class BanglaUtility {
  /// Returns Bangla equivalent of English digit
  /// ```dart
  /// BanglaUtility.englishToBanglaDigit(5) == '৫'
  /// ```
  static String englishToBanglaDigit({required int englishDigit}) {
    String englishDigitStr = englishDigit.toString();
    String banglaDigit = "";
    for (int i = 0; i < englishDigitStr.length; i++) {
      if (kEnglishNumber.contains(englishDigitStr[i])) {
        banglaDigit +=
            kBanglaNumber[kEnglishNumber.indexOf(englishDigitStr[i])];
      } else {
        banglaDigit += englishDigitStr[i];
      }
    }
    return banglaDigit;
  }

  /// Checks if given English year is a leap  year
  /// ```dart
  /// BanglaUtility.isLeapYear(2020) == true
  /// ```
  static bool isLeapYear({int? year}) {
    if (year == null) {
      DateTime now = DateTime.now();
      year = now.year;
    }
    if (year % 400 == 0) {
      return true;
    } else if (year % 4 == 0 && year % 100 != 0) {
      return true;
    } else {
      return false;
    }
  }

  /// Returns Bangla year for a given English date
  /// ```dart
  /// BanglaUtility.getBanglaYear(day:31, month:05, year: 2020) == '১৪২৭'
  /// ```
  static String getBanglaYear({int? day, int? month, int? year}) {
    if (day == null && month == null && year == null) {
      DateTime now = DateTime.now();

      day = now.day;
      month = now.month;
      year = now.year;
    }

    int banglaYear;
    if (month! > 3) {
      banglaYear = year! - 593;
    } else if (month == 3 && day! > 13) {
      banglaYear = year! - 593;
    } else {
      banglaYear = year! - 594;
    }
    return englishToBanglaDigit(englishDigit: banglaYear);
  }

  /// Returns Bangla weekday for a given English date
  /// ```dart
  /// BanglaUtility.getBanglaWeekday(day:31, month:05, year: 2020) == 'রবিবার'
  /// ```
  static String getBanglaWeekday({int? day, int? month, int? year}) {
    if (day == null && month == null && year == null) {
      DateTime now = DateTime.now();

      day = now.day;
      month = now.month;
      year = now.year;
    }
    DateTime date = DateTime(year!, month!, day!);
    String banglaWeekday = kBanglaWeekdays[date.weekday - 1];
    return banglaWeekday;
  }

  /// Returns map of Bangla weekday, day, month, month name, year, season for a given English date
  /// ```dart
  /// BanglaUtility.getBanglaDateMonthYearSeason(day:31, month:05, year: 2020) == {
  ///       "weekday": 'রবিবার',
  ///       "day": '১৭',
  ///       "month": '৫',
  ///       "monthName": 'জ্যৈষ্ঠ',
  ///       "year": '১৪২৭',
  ///       "season": 'গ্রীষ্ম'
  ///     }
  /// ```
  static Map<String, String> getBanglaDateMonthYearSeason(
      {int? day, int? month, int? year}) {
    int banglaDay;
    int banglaMonth;
    String banglaMonthName;
    String banglaYear;

    if (day == null && month == null && year == null) {
      DateTime now = DateTime.now();
      year = now.year;
      month = now.month;
      day = now.day;
    }
    String banglaWeekday = getBanglaWeekday(day: day, month: month, year: year);
    month = month! - 1;
    banglaYear = getBanglaYear(day: day, month: month, year: year);

    if (day! <= kGregEquivalentLastDayOfBanglaMonths[month]) {
      int totalDaysInCurrentBanglaMonth = kTotalDaysInBanglaMonths[month];
      if (month == kGregEquivalentLeapYearIndexInBanglaMonths &&
          isLeapYear(year: year)) {
        totalDaysInCurrentBanglaMonth += 1;
      }
      banglaDay = totalDaysInCurrentBanglaMonth +
          day -
          kGregEquivalentLastDayOfBanglaMonths[month];
      banglaMonth = month;
      banglaMonthName = kGregEquivalentBanglaMonths[banglaMonth];
    } else {
      banglaDay = day - kGregEquivalentLastDayOfBanglaMonths[month];
      banglaMonth = (month + 1) % 12;
      banglaMonthName = kGregEquivalentBanglaMonths[banglaMonth];
    }

    String banglaSeason = kGregEquivalentBanglaSeasons[banglaMonth ~/ 2];

    var banglaDateMonthYearSeason = {
      "weekday": banglaWeekday,
      "day": englishToBanglaDigit(englishDigit: banglaDay),
      "month": englishToBanglaDigit(englishDigit: banglaMonth),
      "monthName": banglaMonthName,
      "year": banglaYear,
      "season": banglaSeason
    };

    return banglaDateMonthYearSeason;
  }

  /// Returns Bangla day for a given English date
  /// ```dart
  /// BanglaUtility.getBanglaDay(day:31, month:05, year: 2020) == '১৭'
  /// ```
  static String? getBanglaDay({int? day, int? month, int? year}) {
    return getBanglaDateMonthYearSeason(
        day: day, month: month, year: year)['day'];
  }

  /// Returns Bangla month for a given English date
  /// ```dart
  /// BanglaUtility.getBanglaMonth(day:31, month:05, year: 2020) == '৫'
  /// ```
  static String? getBanglaMonth({int? day, int? month, int? year}) {
    return getBanglaDateMonthYearSeason(
        day: day, month: month, year: year)['month'];
  }

  /// Returns Bangla month name for a given English date
  /// ```dart
  /// BanglaUtility.getBanglaMonthName(day:31, month:05, year: 2020) == 'জ্যৈষ্ঠ'
  /// ```
  static String? getBanglaMonthName({int? day, int? month, int? year}) {
    return getBanglaDateMonthYearSeason(
        day: day, month: month, year: year)['monthName'];
  }

  /// Returns Bangla season for a given English date
  /// ```dart
  /// BanglaUtility.getBanglaSeason(day:31, month:05, year: 2020) == 'গ্রীষ্ম'
  /// ```
  static String? getBanglaSeason({int? day, int? month, int? year}) {
    return getBanglaDateMonthYearSeason(
        day: day, month: month, year: year)['season'];
  }

  /// Returns Bangla date for a given English date
  /// ```dart
  /// BanglaUtility.getBanglaDate(day:31, month:05, year: 2020) == '১৭-৫-১৪২৭'
  /// ```
  static String getBanglaDate({int? day, int? month, int? year}) {
    var bangla =
    getBanglaDateMonthYearSeason(day: day, month: month, year: year);

    return '${bangla['day']}-${bangla['month']}-${bangla['year']}';
  }
}
