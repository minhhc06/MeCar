import 'package:flutter/material.dart';

import '../../util/assets_path_util.dart';
import '../../util/base_components.dart';
import '../../util/colors_util.dart';
import '../../util/colors_util.dart';
import '../../util/colors_util.dart';
import '../../util/colors_util.dart';
import '../../util/convert_color_util.dart';
import '../../util/size_util.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with BaseComponents {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Container(
              child: Image.asset(
                '${AssetPathUtil.bgAppBar}',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: buttonUtil(
                            title: 'Login',
                            background: ColorsUtil.whiteColorBtn,
                            titleColor: ColorsUtil.blackColorBtn,
                            radiusColor: ColorsUtil.blackColorBtn,
                        handleOnPress: (){
                              print('vo day');
                        })),
                    SizedBox(
                      width: SizeUtil.padding8,
                    ),
                    Expanded(flex: 1, child: buttonUtil(title: 'Register', handleOnPress: (){

                    })),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
