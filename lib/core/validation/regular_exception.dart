abstract class RegularExceptions {
  static String userNameException = 'r^[_-]';

  static const String passwordException =
      'r^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?!.* ).{8,16}';

  static String musetNotHasSpace = r'^[^\s]+$';
  static String musetContintNumber = r'^(?=.*[0-9])';
  static String musetContintLowerChar = r'^(?=.*[a-z])';
  static String musetContintUperChar = r'^(?=.*[A-Z])';
  static String symbols = r'^[^!@#$%^&*()_+=\[\]{};://|,.<>//?]';
  static String noArabic = r'^[أ-ي]';
  static String ip =
      r'^((25[0-5]|(2[0-4]|1\d|[1-9]|)\d)\.){3}(25[0-5]|(2[0-4]|1\d|[1-9]|)\d)$';
  static String noEnglish = r'^[a-z]';
  static String phone = r'^[0-9]*$';
  static List<String> disallowedSymbols = [
    '!',
    '#',
    '%',
    '^',
    '&',
    '*',
    '(',
    '،',
    ',',
    ')',
    '+',
    '=',
    '[',
    ']',
    '{',
    '}',
    ';',
    ':',
    "'",
    '\\',
    '|',
    ',',
    '<',
    '>',
    '/',
    '?',
    '؟',
    '\$',
    '@',
    '_',
    '-',
    '.',
  ];
}
