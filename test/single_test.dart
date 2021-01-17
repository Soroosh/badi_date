import 'package:badi_date/badi_date.dart';
import 'package:test/test.dart';

void main() {
  test('it', () {
    var date = DateTime(2021, 1, 17, 18);
    var badiDate = BadiDate.fromDate(date, longitude: 10.0, latitude: 53.6);
    expect(badiDate.startDateTime, DateTime(2021, 1, 17, 16, 34));
    expect(badiDate.endDateTime, DateTime(2021, 1, 18, 16, 36));
  });
}
