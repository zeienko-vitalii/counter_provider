import 'package:counter_provider/presentation/appearence/styles/dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget loaderWidget() {
  return const Center(
    child: CupertinoActivityIndicator(),
  );
}

Widget error({String errorMsg}) {
  return Center(
    child: Text(
      errorMsg ?? 'Unexpected Error',
      style: TextStyle(fontSize: textSize_24, color: Colors.redAccent),
    ),
  );
}