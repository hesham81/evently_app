import '/core/extensions/dimensions.dart';
import 'package:flutter/widgets.dart';

extension gapSpace on num {
  Widget get verSpace => SizedBox(
        width: this.toDouble().width,
      );

  Widget get horSpace => SizedBox(
        height: this.toDouble().height,
      );
}
