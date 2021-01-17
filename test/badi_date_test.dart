import 'package:badi_date/badi_date.dart';
import 'package:badi_date/bahai_holyday.dart';
import 'package:test/test.dart';

void main() {
  group('throws errors', () {
    test('Throws for invalid day and month', () {
      expect(() => BadiDate(year: 1, month: -1, day: 1), throwsArgumentError);
      expect(() => BadiDate(year: 1, month: 20, day: 1), throwsArgumentError);
      expect(() => BadiDate(year: 1, month: 1, day: 0), throwsArgumentError);
      expect(() => BadiDate(year: 1, month: 1, day: 20), throwsArgumentError);
      expect(() => BadiDate(year: 1, month: 1, day: 4, ayyamIHa: true),
          throwsArgumentError);
    });

    test('Throws unsupported years', () {
      expect(
          () => BadiDate(year: 222, month: 1, day: 1), throwsUnsupportedError);
      expect(() => BadiDate.fromDate(DateTime(2065, 3, 22)),
          throwsUnsupportedError);
    });
  });

  group('date today', () {
    final badiDate = BadiDate(day: 6, month: 16, year: 177);
    test('year, month, day', () {
      final expected = DateTime(2021, 1, 4);
      expect(badiDate.startDateTime.year, equals(expected.year));
      expect(badiDate.startDateTime.month, equals(expected.month));
      expect(badiDate.endDateTime.day, equals(expected.day));
    });

    test('after sunset', () {
      final expected = DateTime(2021, 1, 3);
      expect(badiDate.startDateTime.year, equals(expected.year));
      expect(badiDate.startDateTime.month, equals(expected.month));
      expect(badiDate.startDateTime.day, equals(expected.day));
    });

    test('year in Vahid, Vahid, Kull-i-shay', () {
      expect(badiDate.kullIShay, equals(1));
      expect(badiDate.vahid, equals(10));
      expect(badiDate.yearInVahid, equals(6));
    });

    test('feast, fast, Ayyam-i-ha, Holy day', () {
      expect(badiDate.isAyyamIHa, equals(false));
      expect(badiDate.isFeastDay, equals(false));
      expect(badiDate.isPeriodOfFast, equals(false));
      expect(badiDate.holyDay, equals(null));
    });

    test('next feast, next holy day, day of the year', () {
      expect(badiDate.nextHolyDate.hashCode, equals(178001));
      expect(BadiDate(year: 178, month: 1, day: 1).hashCode, equals(178001));

      expect(
          badiDate.nextHolyDate, equals(BadiDate(year: 178, month: 1, day: 1)));
      expect(badiDate.getNextFeast(),
          equals(BadiDate(year: 177, month: 17, day: 1)));
      expect(badiDate.dayOfYear, equals(291));
    });

    test('last AyyamIHa day', () {
      expect(badiDate.lastAyyamIHaDayOfYear.endDateTime,
          equals(DateTime(2021, 2, 28, 18)));
      expect(badiDate.lastAyyamIHaDayOfYear.startDateTime,
          equals(DateTime(2021, 2, 27, 18)));
    });
  });

  group('naw ruz', () {
    test('naw ruz in gregorian date', () {
      for (int i = 1; i < 175; i++) {
        final date = BadiDate(day: 1, month: 1, year: i);
        expect(date.holyDay, equals(BahaiHolyDayEnum.NAW_RUZ));
        expect(date.startDateTime.month, equals(3));
        expect(date.startDateTime.year, equals(i + 1843));
        if (i < 173) {
          expect(date.endDateTime.day, equals(21), reason: 'Year $i');
          expect(BadiDate.getDayOfNawRuz(i), equals(21), reason: 'Year $i');
        } else {
          expect(date.endDateTime.day, equals(20), reason: 'Year $i');
          expect(BadiDate.getDayOfNawRuz(i), equals(20), reason: 'Year $i');
        }
      }
    });
  });

  group('feasts and holy days', () {
    final badiDate = BadiDate(day: 1, month: 19, year: 177);
    test('calculates the feasts', () {
      expect(badiDate.endDateTime, equals(DateTime(2021, 3, 1, 18)));
      BadiDate date = badiDate.getNextFeast();
      expect(date.endDateTime, equals(DateTime(2021, 3, 20, 18)));
      date = date.getNextFeast();
      expect(date.endDateTime, equals(DateTime(2021, 4, 8, 18)));
      date = date.getNextFeast();
      expect(date.endDateTime, equals(DateTime(2021, 4, 27, 18)));
      date = date.getNextFeast();
      expect(date.endDateTime, equals(DateTime(2021, 5, 16, 18)));
      date = date.getNextFeast();
      expect(date.endDateTime, equals(DateTime(2021, 6, 4, 18)));
      date = date.getNextFeast();
      expect(date.endDateTime, equals(DateTime(2021, 6, 23, 18)));
      date = date.getNextFeast();
      expect(date.endDateTime, equals(DateTime(2021, 7, 12, 18)));
      date = date.getNextFeast();
      expect(date.endDateTime, equals(DateTime(2021, 7, 31, 18)));
      date = date.getNextFeast();
      expect(date.endDateTime, equals(DateTime(2021, 8, 19, 18)));
      date = date.getNextFeast();
      expect(date.endDateTime, equals(DateTime(2021, 9, 7, 18)));
      date = date.getNextFeast();
      expect(date.endDateTime, equals(DateTime(2021, 9, 26, 18)));
      date = date.getNextFeast();
      expect(date.endDateTime, equals(DateTime(2021, 10, 15, 18)));
      date = date.getNextFeast();
      expect(date.endDateTime, equals(DateTime(2021, 11, 3, 18)));
      date = date.getNextFeast();
      expect(date.endDateTime, equals(DateTime(2021, 11, 22, 18)));
      date = date.getNextFeast();
      expect(date.endDateTime, equals(DateTime(2021, 12, 11, 18)));
      date = date.getNextFeast();
      expect(date.endDateTime, equals(DateTime(2021, 12, 30, 18)));
      date = date.getNextFeast();
      expect(date.endDateTime, equals(DateTime(2022, 1, 18, 18)));
      date = date.getNextFeast();
      expect(date.endDateTime, equals(DateTime(2022, 2, 6, 18)));
      date = date.getNextFeast();
      expect(date.endDateTime, equals(DateTime(2022, 3, 2, 18)));
      date = date.getNextFeast();
      expect(date.endDateTime, equals(DateTime(2022, 3, 21, 18)));
    });

    test('calculates the holy days', () {
      BadiDate date = badiDate.nextHolyDate;
      expect(date.endDateTime, equals(DateTime(2021, 3, 20, 18)));
      expect(date.holyDay, equals(BahaiHolyDayEnum.NAW_RUZ));

      date = date.nextHolyDate;
      expect(date.endDateTime, equals(DateTime(2021, 4, 20, 18)));
      expect(date.holyDay, equals(BahaiHolyDayEnum.RIDVAN1ST));

      date = date.nextHolyDate;
      expect(date.endDateTime, equals(DateTime(2021, 4, 28, 18)));
      expect(date.holyDay, equals(BahaiHolyDayEnum.RIDVAN9TH));

      date = date.nextHolyDate;
      expect(date.endDateTime, equals(DateTime(2021, 5, 1, 18)));
      expect(date.holyDay, equals(BahaiHolyDayEnum.RIDVAN12TH));

      date = date.nextHolyDate;
      expect(date.endDateTime, equals(DateTime(2021, 5, 23, 18)));
      expect(date.holyDay, equals(BahaiHolyDayEnum.DECLEARTION_OF_THE_BAB));

      date = date.nextHolyDate;
      expect(date.endDateTime, equals(DateTime(2021, 5, 28, 18)));
      expect(date.holyDay, equals(BahaiHolyDayEnum.ASCENSION_OF_BAHAULLAH));

      date = date.nextHolyDate;
      expect(date.endDateTime, equals(DateTime(2021, 7, 9, 18)));
      expect(date.holyDay, equals(BahaiHolyDayEnum.MARTYRDOM_OF_THE_BAB));

      date = date.nextHolyDate;
      expect(date.endDateTime, equals(DateTime(2021, 11, 6, 18)));
      expect(date.holyDay, equals(BahaiHolyDayEnum.BIRTH_OF_THE_BAB));

      date = date.nextHolyDate;
      expect(date.endDateTime, equals(DateTime(2021, 11, 7, 18)));
      expect(date.holyDay, equals(BahaiHolyDayEnum.BIRTH_OF_BAHAULLAH));

      date = date.nextHolyDate;
      expect(date.endDateTime, equals(DateTime(2021, 11, 25, 18)));
      expect(date.holyDay, equals(BahaiHolyDayEnum.DAY_OF_THE_COVENANT));

      date = date.nextHolyDate;
      expect(date.endDateTime, equals(DateTime(2021, 11, 27, 18)));
      expect(date.holyDay, equals(BahaiHolyDayEnum.ASCENSION_OF_ABDUL_BAHA));
    });
  });

  group('corner cases', () {
    test('round trip naw ruz', () {
      var date = DateTime(2021, 3, 19, 20);
      var badiDate = BadiDate.fromDate(date);
      expect(badiDate.startDateTime, DateTime(2021, 3, 19, 18));
      expect(badiDate.endDateTime, DateTime(2021, 3, 20, 18));
      expect(badiDate.month, 1);
      expect(badiDate.day, 1);
      expect(badiDate.year, 178);

      date = DateTime(2021, 3, 19, 16);
      badiDate = BadiDate.fromDate(date);
      expect(badiDate.startDateTime, DateTime(2021, 3, 18, 18));
      expect(badiDate.endDateTime, DateTime(2021, 3, 19, 18));
      expect(badiDate.month, 19);
      expect(badiDate.day, 19);
      expect(badiDate.year, 177);

      date = DateTime(2021, 3, 20, 16);
      badiDate = BadiDate.fromDate(date);
      expect(badiDate.startDateTime, DateTime(2021, 3, 19, 18));
      expect(badiDate.endDateTime, DateTime(2021, 3, 20, 18));
      expect(badiDate.month, 1);
      expect(badiDate.day, 1);
      expect(badiDate.year, 178);
    });

    test('new years eve', () {
      var date = DateTime(2020, 12, 31, 16);
      var badiDate = BadiDate.fromDate(date);
      expect(badiDate.startDateTime, DateTime(2020, 12, 30, 18));
      expect(badiDate.endDateTime, DateTime(2020, 12, 31, 18));
      expect(badiDate.day, 2);
      expect(badiDate.month, 16);
      expect(badiDate.year, 177);

      date = DateTime(2020, 12, 31, 20);
      badiDate = BadiDate.fromDate(date);
      expect(badiDate.startDateTime, DateTime(2020, 12, 31, 18));
      expect(badiDate.endDateTime, DateTime(2021, 1, 1, 18));
      expect(badiDate.day, 3);
      expect(badiDate.month, 16);
      expect(badiDate.year, 177);

      date = DateTime(2021, 1, 1, 16);
      badiDate = BadiDate.fromDate(date);
      expect(badiDate.startDateTime, DateTime(2020, 12, 31, 18));
      expect(badiDate.endDateTime, DateTime(2021, 1, 1, 18));
      expect(badiDate.day, 3);
      expect(badiDate.month, 16);
      expect(badiDate.year, 177);
    });

    test('leap day', () {
      var date = DateTime(2020, 2, 29);
      var badiDate = BadiDate.fromDate(date);
      expect(badiDate.isAyyamIHa, true);
      expect(badiDate.isPeriodOfFast, false);
      expect(badiDate.day, 4);

      date = DateTime(2020, 3, 1);
      badiDate = BadiDate.fromDate(date);
      expect(badiDate.isAyyamIHa, false);
      expect(badiDate.isPeriodOfFast, true);
      expect(badiDate.day, 1);

      date = DateTime(2021, 2, 28);
      badiDate = BadiDate.fromDate(date);
      expect(badiDate.isAyyamIHa, true);
      expect(badiDate.isPeriodOfFast, false);
      expect(badiDate.day, 4);

      date = DateTime(2021, 3, 1);
      badiDate = BadiDate.fromDate(date);
      expect(badiDate.isAyyamIHa, false);
      expect(badiDate.isPeriodOfFast, true);
      expect(badiDate.day, 1);
    });
  });

  group("sunset calculation", () {
    test("handles pols and nonsense values", () {
      final expected = DateTime(2021, 1, 17, 18);
      expect(BadiDate(day: 1, month: 17, year: 177).startDateTime,
          equals(expected));
      expect(
          BadiDate(day: 1, month: 17, year: 177, latitude: 53.6).startDateTime,
          equals(expected));
      expect(
          BadiDate(day: 1, month: 17, year: 177, longitude: 10.0).startDateTime,
          equals(expected));
      expect(
          BadiDate(
                  day: 1,
                  month: 17,
                  year: 177,
                  longitude: 190.0,
                  latitude: 53.6)
              .startDateTime,
          equals(expected));
      expect(
          BadiDate(
                  day: 1,
                  month: 17,
                  year: 177,
                  longitude: -190.0,
                  latitude: 53.6)
              .startDateTime,
          equals(expected));
      expect(
          BadiDate(
                  day: 1, month: 17, year: 177, longitude: 10.0, latitude: 66.6)
              .startDateTime,
          equals(expected));
      expect(
          BadiDate(
                  day: 1,
                  month: 17,
                  year: 177,
                  longitude: 10.0,
                  latitude: -66.6)
              .startDateTime,
          equals(expected));
    });

    // This test only works if your local time is CET or CEST
    test("calculates sunset", () {
      final expected = DateTime(2021, 1, 17, 16, 34);
      expect(
          BadiDate(
                  day: 1, month: 17, year: 177, longitude: 10.0, latitude: 53.6)
              .startDateTime,
          equals(expected));
    });

    // This test only works if your local time is CET or CEST
    test("handles daylight saving", () {
      final expected = DateTime(2021, 6, 23, 21, 55);
      expect(
          BadiDate(day: 1, month: 6, year: 178, longitude: 10.0, latitude: 53.6)
              .endDateTime,
          equals(expected));
    });
  });
}
