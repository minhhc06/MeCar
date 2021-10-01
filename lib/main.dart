import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_manabie/pages/splash_page/splash_page.dart';

import 'util/words_util.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(

        SystemUiOverlayStyle(statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.black,   ));
    return MaterialApp(
      title: '${WordsUtil.meCar}',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          brightness: Brightness.dark,
          systemOverlayStyle: SystemUiOverlayStyle.dark, // 2
        ),

      ),
      home: SplashPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

