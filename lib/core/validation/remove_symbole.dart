import 'regular_exception.dart';

String removeSymbols(String value) {
  String val = value.trim();
  // String val = val.replaceAll(RegExp(r'[\s\W]+$'), '');

  for (var i in RegularExceptions.disallowedSymbols) {
    if (val.endsWith(i) || val.endsWith(' ')) {
      // val = val.replaceAll(RegExp(r'[\s\W]+$'), '');
//
      String newVal = val.replaceAll(i, '');
      return newVal.trim();
      // return 'خطا في المدخلات';
    }
  }

  return val.trim();
}
