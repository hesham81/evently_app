import 'package:flutter/cupertino.dart';

import '../../main.dart';

extension Dimensions on num {
  double get height => MediaQuery.of(navigatorKey.currentContext!).size.height*this;
  double get width => MediaQuery.of(navigatorKey.currentContext!).size.width*this;
  double maxFinite() => double.maxFinite;
}