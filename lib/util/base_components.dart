import 'package:flutter/material.dart';

import 'colors_util.dart';

import 'size_util.dart';
import 'words_util.dart';

class BaseComponents {
  Widget buttonUtil(
      {String title = '${WordsUtil.submit}',
      Color background = ColorsUtil.blackColorBtn,
      Color titleColor = ColorsUtil.whiteColorBtn,
      Color radiusColor = ColorsUtil.blackColorBtn,
      Function handleOnPress}) {
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
          style: TextStyle(
              fontSize: 16, color: titleColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget textFromFieldUtil(
      {@required TextEditingController controller,
      double paddingSize = SizeUtil.padding8,
      String hintText,
      String labelText,
        bool isObscureText = false,
      Color focusedBorderColor = ColorsUtil.blackColorBtn,
      Color enabledBorderColor = ColorsUtil.blackColorBtn,
        TextInputAction textInputAction,
        IconButton iconButtonSuffixIcon,
      Function(String) validate}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: SizeUtil.padding8),
      child: TextFormField(
        controller: controller,
        textInputAction: textInputAction,
        obscureText: isObscureText,
        decoration: new InputDecoration(
          suffixIcon: iconButtonSuffixIcon != null ? iconButtonSuffixIcon: null,

          hintText: '$hintText',
          labelText: '$labelText *',
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorsUtil.blackColorBtn, width: 2.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorsUtil.blackColorBtn, width: 2.0),
          ),
        ),
        onSaved: (String value) {
          // This optional block of code can be used to run
          // code when the user saves the form.
        },
        validator: (String value) {
          return validate(value);
        },
      ),
    );
  }
}
