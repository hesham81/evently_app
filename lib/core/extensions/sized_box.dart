import 'package:flutter/widgets.dart';

extension gapSpace on num
{
  Widget get hSpace => SizedBox(width: this.toDouble(),);
  Widget get vSpace => SizedBox(height: this.toDouble(),);
}