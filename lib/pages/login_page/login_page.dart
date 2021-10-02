import 'package:flutter/material.dart';
import 'package:mecar/pages/login_input_page/login_input_page.dart';
import 'package:mecar/pages/register_page/register_page.dart';
import 'package:mecar/util/words_util.dart';

import '../../util/assets_path_util.dart';
import '../../util/base_components.dart';
import '../../util/colors_util.dart';
import '../../util/size_util.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with BaseComponents {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => handleWillPop(),
      child: Scaffold(
        body: Stack(
          children: [
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
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
                              title: '${WordsUtil.login}',
                              background: ColorsUtil.whiteColorBtn,
                              titleColor: ColorsUtil.blackColorBtn,
                              radiusColor: ColorsUtil.blackColorBtn,
                          handleOnPress: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LoginInputPage()),
                            );
                          })),
                      SizedBox(
                        width: SizeUtil.padding8,
                      ),
                      Expanded(flex: 1, child: buttonUtil(title: '${WordsUtil.register}', handleOnPress: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterPage()),
                        );
                      })),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
