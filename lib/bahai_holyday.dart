enum BahaiHolyDayEnum {
  /// Naw-Ruz
  NAW_RUZ,

  /// 1st day of Ridvan
  RIDVAN1ST,

  /// 9th day of Ridvan
  RIDVAN9TH,

  /// 12th day of Ridvan
  RIDVAN12TH,

  /// Decleration of the Bab
  DECLEARTION_OF_THE_BAB,

  /// Ascension of Baha'u'llah
  ASCENSION_OF_BAHAULLAH,

  /// Martyrdom of the Bab
  MARTYRDOM_OF_THE_BAB,

  /// Birth of the Bab
  BIRTH_OF_THE_BAB,

  /// Birth of Baha'u'llah
  BIRTH_OF_BAHAULLAH,

  /// Day of the Covenant (not a holy day)
  DAY_OF_THE_COVENANT,

  /// Ascension of Abdu'l-Baha (not a holy day)
  ASCENSION_OF_ABDUL_BAHA,
}

class BahaiHolyDay {
  final int _dayOfYear;
  final BahaiHolyDayEnum type;

  const BahaiHolyDay(this._dayOfYear, this.type);

  int getDayOfTheYear({int dayOfYearBirthOfBab}) {
    if (type == BahaiHolyDayEnum.BIRTH_OF_THE_BAB) {
      return dayOfYearBirthOfBab ?? _dayOfYear;
    } else if (type == BahaiHolyDayEnum.BIRTH_OF_BAHAULLAH &&
        dayOfYearBirthOfBab != null) {
      return dayOfYearBirthOfBab + 1;
    }
    return _dayOfYear;
  }
}

const List<BahaiHolyDay> bahaiHolyDays = [
  /// Naw-Ruz
  BahaiHolyDay(1, BahaiHolyDayEnum.NAW_RUZ),

  /// 1st day of Ridvan
  BahaiHolyDay(32, BahaiHolyDayEnum.RIDVAN1ST),

  /// 9th day of Ridvan
  BahaiHolyDay(40, BahaiHolyDayEnum.RIDVAN9TH),

  /// 12th day of Ridvan
  BahaiHolyDay(43, BahaiHolyDayEnum.RIDVAN12TH),

  /// Decleration of the Bab
  BahaiHolyDay(65, BahaiHolyDayEnum.DECLEARTION_OF_THE_BAB),

  /// Ascension of Baha'u'llah
  BahaiHolyDay(70, BahaiHolyDayEnum.ASCENSION_OF_BAHAULLAH),

  /// Martyrdom of the Bab
  BahaiHolyDay(112, BahaiHolyDayEnum.MARTYRDOM_OF_THE_BAB),

  /// Birth of the Bab
  BahaiHolyDay(214, BahaiHolyDayEnum.BIRTH_OF_THE_BAB),

  /// Birth of Baha'u'llah
  BahaiHolyDay(237, BahaiHolyDayEnum.BIRTH_OF_BAHAULLAH),

  /// Day of the Covenant (not a holy day)
  BahaiHolyDay(251, BahaiHolyDayEnum.DAY_OF_THE_COVENANT),

  /// Ascension of Abdu'l-Baha (not a holy day)
  BahaiHolyDay(253, BahaiHolyDayEnum.ASCENSION_OF_ABDUL_BAHA),
];
