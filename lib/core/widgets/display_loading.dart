import 'package:flutter/material.dart';

import 'custom_loading2.dart';

displayLoading(BuildContext context, {bool canPop = false}) {
  showDialog(context: context, builder: (_) => CutomLoading2(canPop: canPop));
}
