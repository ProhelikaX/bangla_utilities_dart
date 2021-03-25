const KBanglaSeasons = ['গ্রীষ্ম', 'বর্ষা', 'শরৎ', 'হেমন্ত', 'শীত', 'বসন্ত'];

const KBanglaWeekDays = [
  "রবিবার",
  "সোমবার",
  "মঙ্গলবার",
  "বুধবার",
  "বৃহস্পতিবার",
  "শুক্রবার",
  "শনিবার"
];

const KBanglaMonths = [
  'বৈশাখ',
  'জ্যৈষ্ঠ',
  'আষাঢ়',
  'শ্রাবণ',
  'ভাদ্র',
  'আশ্বিন',
  'কার্তিক',
  'অগ্রহায়ণ',
  'পৌষ',
  'মাঘ',
  'ফাল্গুন',
  'চৈত্র'
];

class BanglaUtility {
  /// Bangla day: ১
  var day = "";

  /// Bangla week: সোমবার
  var week = "";

  /// Bangla month:  আষাঢ়
  var month = "";

  /// Bangla year: ১৪২৭
  var year = "";

  /// Bangla season: শরৎ
  var season = "";

  /// Bangla full date: ৮ চৈত্র, ১৪২৭
  var banglaDate = "";

  DateTime? dateTime = null;

  var _totalDaysInMonth = [31, 31, 31, 31, 31, 31, 30, 30, 30, 30, 30, 30];

  // Get the current Bangla Date
  BanglaUtility.now() {
    dateTime = DateTime.now();
    _toBanglaDate();
  }

  // Get Bangla date from a given date
  BanglaUtility.fromDate(
      {required int day, required int month, required int year}) {
    dateTime = DateTime.utc(year, month, day);
    _toBanglaDate();
  }

  _toBanglaDate() {
    var year = dateTime!.year;
    var month = dateTime!.month;
    var day = dateTime!.day;

    if (_isLeapYear(year)) {
      _totalDaysInMonth[10] = 30;
    } else {
      _totalDaysInMonth[10] = 29;
    }
    int banglaYear =
    (month < 4 || (month == 4 && day < 14)) ? year - 594 : year - 593;

    int calculateYear =
    (month < 4 || (month == 4 && day < 14)) ? year - 1 : year;

    var difference = (DateTime.utc(year, month, day)
        .difference(DateTime.utc(calculateYear, 04, 13)))
        .inDays
        .floor();

    var banglaMonthIndex = 0;

    for (var i = 0; i < _totalDaysInMonth.length; i++) {
      if (difference <= _totalDaysInMonth[i]) {
        banglaMonthIndex = i;
        break;
      }
      difference -= _totalDaysInMonth[i];
    }

    var banglaDate = difference.toString();
    this.day = _toBangla(banglaDate);
    var banglaWeekIndex = dateTime!.weekday;
    this.week = KBanglaWeekDays[banglaWeekIndex + 1];
    this.month = KBanglaMonths[banglaMonthIndex];
    this.season = KBanglaSeasons[(banglaMonthIndex / 2).floor()];
    this.year = _toBangla(banglaYear.toString());
    this.banglaDate = "${this.day} ${this.month} ${this.year}";
  }

  bool _isLeapYear(int year) =>
      ((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0);

  String _toBangla(String text) {
    return text
        .replaceAll("0", "০")
        .replaceAll("1", "১")
        .replaceAll("2", "২")
        .replaceAll("3", "৩")
        .replaceAll("4", "৪")
        .replaceAll("5", "৫")
        .replaceAll("6", "৬")
        .replaceAll("7", "৭")
        .replaceAll("8", "৮")
        .replaceAll("9", "৯");
  }
}
