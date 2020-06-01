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

class BanglaUtility {
  static String englishToBanglaDigit({int englishDigit}) {
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

  static bool isLeapYear({int year}) {
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

  static String getBanglaYear({int day, int month, int year}) {
    if (day == null && month == null && year == null) {
      DateTime now = DateTime.now();

      day = now.day;
      month = now.month;
      year = now.year;
    }

    int banglaYear;
    if (month > 3) {
      banglaYear = year - 593;
    } else if (month == 3 && day > 13) {
      banglaYear = year - 593;
    } else {
      banglaYear = year - 594;
    }
    return englishToBanglaDigit(englishDigit: banglaYear);
  }

  static String getBanglaWeekday({int day, int month, int year}) {
    if (day == null && month == null && year == null) {
      DateTime now = DateTime.now();

      day = now.day;
      month = now.month;
      year = now.year;
    }
    DateTime date = DateTime(year, month, day);
    String banglaWeekday = kBanglaWeekdays[date.weekday - 1];
    return banglaWeekday;
  }

  static Map<String, String> getBanglaDateMonthYearSeason(
      {int day, int month, int year}) {
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
    month = month - 1;
    banglaYear = getBanglaYear(day: day, month: month, year: year);

    if (day <= kGregEquivalentLastDayOfBanglaMonths[month]) {
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

  static String getBanglaDay({int day, int month, int year}) {
    return getBanglaDateMonthYearSeason(
        day: day, month: month, year: year)['day'];
  }

  static String getBanglaMonth({int day, int month, int year}) {
    return getBanglaDateMonthYearSeason(
        day: day, month: month, year: year)['month'];
  }

  static String getBanglaMonthName({int day, int month, int year}) {
    return getBanglaDateMonthYearSeason(
        day: day, month: month, year: year)['monthName'];
  }

  static String getBanglaSeason({int day, int month, int year}) {
    return getBanglaDateMonthYearSeason(
        day: day, month: month, year: year)['season'];
  }

  static String getBanglaDate({int day, int month, int year}) {
    var bangla =
        getBanglaDateMonthYearSeason(day: day, month: month, year: year);

    return '${bangla['day']}-${bangla['month']}-${bangla['year']}';
  }
}
