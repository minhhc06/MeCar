import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_manabie/pages/home_page/home_page.dart';
import 'package:todo_manabie/pages/login_page/login_page.dart';
import 'package:todo_manabie/util/assets_path_util.dart';
import 'package:todo_manabie/util/colors_util.dart';
import 'package:todo_manabie/util/convert_color_util.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(seconds: 2),
          () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              '${AssetPathUtil.bgAppBar}',
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
