import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Indent extends StatelessWidget {
  const Indent({Key key, this.start = 0, this.top = 0, this.end = 0, this.bottom = 0}) : super(key: key);
  final double start, top, end, bottom;

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsetsDirectional.only(
          start: start?.w,
          top: top?.h,
          end: end?.w,
          bottom: bottom?.h,
        ),
      );
}