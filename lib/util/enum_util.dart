import 'package:flutter/material.dart';
import 'package:mecar/util/colors_util.dart';
import 'package:mecar/util/words_util.dart';

enum   TypeNavigationBar{
  home,
  search,
  add,
  chat,
  user
}

extension TypeExtension on TypeNavigationBar {

  Color get color {
    switch (this) {
      case TypeNavigationBar.home:
        return ColorsUtil.blackColorBtn;
      case TypeNavigationBar.search:
        return ColorsUtil.blackColorBtn;
      case TypeNavigationBar.add:
        return ColorsUtil.blackColorBtn;
      case TypeNavigationBar.chat:
        return ColorsUtil.blackColorBtn;
      case TypeNavigationBar.user:
        return ColorsUtil.blackColorBtn;
      default:
        return null;
    }
  }

  // int get index {
  //   switch (this) {
  //     case TypeCategory.all:
  //       return 0;
  //     case TypeCategory.completed:
  //       return 1;
  //     case TypeCategory.inComplete:
  //       return 2;
  //     default:
  //       return null;
  //   }
  // }

}