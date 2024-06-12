import 'regular_exception.dart';
import 'remove_symbole.dart';

validations({required String value, required String type}) {
  String val = value.trim();

  // String val = val.replaceAll(RegExp(r'[\s\W]+$'), '');
  val = removeSymbols(value);
  // for (var i in RegularExceptions.disallowedSymbols) {
  //   if (val.endsWith(i) || val.endsWith(' ')) {
  //     val = val.replaceAll(i, '');
  //     // return 'خطا في المدخلات';
  //   }
  // }

  if (val.isEmpty) {
    return 'هذا الحقل مطلوب';
  }
  for (var i in RegularExceptions.disallowedSymbols) {
    if (val.startsWith(i)) {
      return 'خطا في المدخلات';
    }
  }

  switch (type) {
    case 'email':
      if (val.contains(' ')) return 'البريد لايمكن يحتوي على مسافات';
      for (int i = 0; i < RegularExceptions.disallowedSymbols.length - 4; i++) {
        if (val.contains(RegularExceptions.disallowedSymbols[i])) {
          return 'خطا في البريد الإلكتروني';
        }
      }
      if (!val.contains('@')) return 'خطا في البريد الإلكتروني';

      if (RegExp(RegularExceptions.noArabic).hasMatch(val)) {
        return 'البريد الإلكتروني يجب ان لايحتوي على حرف عربي';
      }
    case 'username':
      if (val.contains(' ')) {
        return 'إسم المستخدم يجب ان لا يحتوي على مسافات';
      }

      for (var i in RegularExceptions.disallowedSymbols) {
        if (val.startsWith(i) || val.endsWith(i)) {
          return 'خطا في إسم المستخدم';
        }
      }
      for (int i = 0; i < RegularExceptions.disallowedSymbols.length - 4; i++) {
        if (val.contains(RegularExceptions.disallowedSymbols[i])) {
          return 'خطا في إسم المستخدم';
        }
      }

      if (RegExp(RegularExceptions.noArabic).hasMatch(val)) {
        return 'إسم المستخدم يجب ان لايحتوي على حرف عربي';
      }

      if (RegExp(RegularExceptions.userNameException).hasMatch(val)) {
        return 'خطا في إسم المستخدم';
      }

    case 'password':
      // if (val.length <= 8) return 'كلمة المرور يجب تكون اكبر من 7';
      // if (val.length > 16) return 'كلمة المرور يجب ان تكون اصغر من 17';
      if (val.contains(' ')) return 'كلمة المرور يجب ان لاتحتوي على مسافات';

      for (var i in RegularExceptions.disallowedSymbols) {
        if (val.contains(i)) return 'كلمة المرور يجب ان لا تحتوي على رمز ';
      }

      if (RegExp(RegularExceptions.noArabic).hasMatch(val)) {
        return 'كلمة المرور يجب ان لاتحتوي على حرف عربي';
      }
    // case 'name':

    case 'phone':
      if (!RegExp(RegularExceptions.phone).hasMatch(val)) {
        return 'يجب ان يكون رقما فقط';
      }
      if (val.length < 5) return 'يجب ان يكون اكبر من 4 ارقام';
  }
}
