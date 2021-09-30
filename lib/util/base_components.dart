import 'package:flutter/material.dart';

import 'colors_util.dart';

import 'size_util.dart';
import 'words_util.dart';

class BaseComponents {
  // ButtonStyle style;
  Widget buttonUtil({
    String title = '${WordsUtil.submit}',
    Color background = ColorsUtil.blackColorBtn,
    Color titleColor = ColorsUtil.whiteColorBtn,
    Color radiusColor = ColorsUtil.blackColorBtn,
    Function handleOnPress
  }) {
    return ElevatedButton(
      onPressed: () => handleOnPress(),
      style: ElevatedButton.styleFrom(
          primary: background,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: radiusColor),
            borderRadius: BorderRadius.circular(SizeUtil.borderRadiusDefault),
          )),
      child: Padding(
        padding: const EdgeInsets.all(SizeUtil.padding16),
        child: Text(
          '$title',
          style: TextStyle(fontSize: 16, color: titleColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
