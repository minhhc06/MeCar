import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors_util.dart';

import 'size_util.dart';
import 'words_util.dart';

class BaseComponents {
  Widget buildTitlePage({String title}){
    return Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$title',
              style: TextStyle(fontSize: 32),
            ),
          ],
        ));
  }

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

  dialogWarning(
      {@required BuildContext context,
        @required bool isWarning,
        String title,
        String description,
        String buttonTitle,
        Function function}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)), //this right here
            child: _buildLayoutDialog(
                title: title,
                description: description,
                textButton: buttonTitle,
                function: function),
          );
        });
  }


  Widget _buildLayoutDialog({@required String title, @required String description, String textButton, Function function}){
    return Container(
      height: SizeUtil.heightContainerDialog,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(SizeUtil.padding8),
          child: Column(
            children: [
              Expanded(
                  flex: 1,
                  child: Text(title, style: TextStyle(fontSize: SizeUtil.fontSizeTextTitleDialog , fontWeight: FontWeight.bold),)),

              Expanded(
                  flex: 2,
                  child: Text(description, style: TextStyle(fontSize: SizeUtil.fontSizeTextDescriptionDialog),)),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey,
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: function,
                  child: Center(
                    child: Text(textButton, style: TextStyle(fontSize: SizeUtil.fontSizeTextConfirmDialog ,color: Colors.blue),),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomLeft,
        stops: [
        0.2,
        0.7,

        ],
        colors: [

          Colors.pinkAccent,
          Colors.redAccent,

        ],),
      // color: Colors.redAccent,
      border: Border.all(
          color: Colors.transparent,
          width: 3.0
      ),
      borderRadius: BorderRadius.all(
          Radius.circular(30.0) //                 <--- border radius here
      ),
    );
  }

  Future<bool> handleWillPop() async {
    SystemNavigator.pop();
  }


}
