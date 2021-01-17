import 'package:meta/meta.dart';

class YearSpecifics {
  final int year;
  final bool leapday;
  final bool nawRuzOnMarch21;
  final int birthOfBab;

  const YearSpecifics(
      {@required this.year,
      @required this.birthOfBab,
      this.leapday = false,
      this.nawRuzOnMarch21 = false});
}

const yearSpecifics = {
  172: YearSpecifics(year: 172, birthOfBab: 238, nawRuzOnMarch21: true),
  173: YearSpecifics(year: 173, birthOfBab: 227),
  174: YearSpecifics(year: 174, birthOfBab: 216, leapday: true),
  175: YearSpecifics(year: 175, birthOfBab: 234, nawRuzOnMarch21: true),
  176: YearSpecifics(year: 176, birthOfBab: 223, nawRuzOnMarch21: true),
  177: YearSpecifics(year: 177, birthOfBab: 213),
  178: YearSpecifics(year: 178, birthOfBab: 232, leapday: true),
  179: YearSpecifics(year: 179, birthOfBab: 220, nawRuzOnMarch21: true),
  180: YearSpecifics(year: 180, birthOfBab: 210, nawRuzOnMarch21: true),
  181: YearSpecifics(year: 181, birthOfBab: 228),
  182: YearSpecifics(year: 182, birthOfBab: 217, leapday: true),
  183: YearSpecifics(year: 183, birthOfBab: 235, nawRuzOnMarch21: true),
  184: YearSpecifics(year: 184, birthOfBab: 224, nawRuzOnMarch21: true),
  185: YearSpecifics(year: 185, birthOfBab: 214),
  186: YearSpecifics(year: 186, birthOfBab: 233),
  187: YearSpecifics(year: 187, birthOfBab: 223, leapday: true),
  188: YearSpecifics(year: 188, birthOfBab: 211, nawRuzOnMarch21: true),
  189: YearSpecifics(year: 189, birthOfBab: 230),
  190: YearSpecifics(year: 190, birthOfBab: 238),
  191: YearSpecifics(year: 191, birthOfBab: 238, leapday: true),
  192: YearSpecifics(year: 192, birthOfBab: 226, nawRuzOnMarch21: true),
  193: YearSpecifics(year: 193, birthOfBab: 215),
  194: YearSpecifics(year: 194, birthOfBab: 234),
  195: YearSpecifics(year: 195, birthOfBab: 224, leapday: true),
  196: YearSpecifics(year: 196, birthOfBab: 213, nawRuzOnMarch21: true),
  197: YearSpecifics(year: 197, birthOfBab: 232),
  198: YearSpecifics(year: 198, birthOfBab: 221),
  199: YearSpecifics(year: 199, birthOfBab: 210, leapday: true),
  200: YearSpecifics(year: 200, birthOfBab: 228, nawRuzOnMarch21: true),
  201: YearSpecifics(year: 201, birthOfBab: 217),
  202: YearSpecifics(year: 202, birthOfBab: 236),
  203: YearSpecifics(year: 203, birthOfBab: 225, leapday: true),
  204: YearSpecifics(year: 204, birthOfBab: 214, nawRuzOnMarch21: true),
  205: YearSpecifics(year: 205, birthOfBab: 233),
  206: YearSpecifics(year: 206, birthOfBab: 223),
  207: YearSpecifics(year: 207, birthOfBab: 212, leapday: true),
  208: YearSpecifics(year: 208, birthOfBab: 230, nawRuzOnMarch21: true),
  209: YearSpecifics(year: 209, birthOfBab: 219),
  210: YearSpecifics(year: 210, birthOfBab: 237),
  211: YearSpecifics(year: 211, birthOfBab: 227, leapday: true),
  212: YearSpecifics(year: 212, birthOfBab: 215, nawRuzOnMarch21: true),
  213: YearSpecifics(year: 213, birthOfBab: 234),
  214: YearSpecifics(year: 214, birthOfBab: 224),
  215: YearSpecifics(year: 215, birthOfBab: 213),
  216: YearSpecifics(year: 216, birthOfBab: 232, leapday: true),
  217: YearSpecifics(year: 217, birthOfBab: 220),
  218: YearSpecifics(year: 218, birthOfBab: 209),
  219: YearSpecifics(year: 219, birthOfBab: 228),
  220: YearSpecifics(year: 220, birthOfBab: 218, leapday: true),
  221: YearSpecifics(year: 221, birthOfBab: 236),
};
