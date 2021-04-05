# badi_date

A library to convert Dart DateTime to Badi date and back.


## Usage Example

```dart
import 'package:badi_date/badi_date.dart';

final date1 = BadiDate(day: 1, month: 1, year: 178);
final date2 = BadiDate.fromDate(DateTime.now());

final DateTime start = date1.startDateTime;
final DateTime end = date1.endDateTime;
final BahaiHolyDayEnum holyDay = date1.holyDay;
final bool = date2.isPeriodOfFast;
final bool = date2.isAyyamIHa;
final BadiDate nextHolyDay = date2.nextHolyDate;

```
