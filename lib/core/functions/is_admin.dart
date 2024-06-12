import '../../helper/cached_helper.dart';

bool isAdmin() {
  return CacheHelper.getData(key: 'admin');
}
//   if () return true;
//   return false;
// }
