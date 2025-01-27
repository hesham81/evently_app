import 'package:evently/core/extensions/dimensions.dart';
import 'package:flutter/cupertino.dart';

extension paddingOnNumbers on Widget {
  Widget verPadding(double value) => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: value.width,
        ),
        child: this,
      );

  Widget horPadding(double value) => Padding(
        padding: EdgeInsets.symmetric(vertical: value.height),
        child: this,
      );

  Widget allPadding(double value) => Padding(
        padding: EdgeInsets.all(value),
        child: this,
      );
}
