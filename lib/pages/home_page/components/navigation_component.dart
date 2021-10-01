import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mecar/util/assets_path_util.dart';
import 'package:mecar/util/base_components.dart';
import 'package:mecar/util/colors_util.dart';
import 'package:mecar/util/convert_color_util.dart';
import 'package:mecar/util/enum_util.dart';
import 'package:mecar/util/size_util.dart';
import 'package:mecar/util/words_util.dart';


class NavigationComponent extends BaseComponents{
  Widget bottomNavigationBar(
      { Function(TypeNavigationBar) onTapFunction,  Stream<TypeNavigationBar> stream }) {
    return StreamBuilder<TypeNavigationBar>(
        stream: stream,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return Padding(
              padding: const EdgeInsets.only(bottom: SizeUtil.padding16),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                      child: GestureDetector(
                        onTap: ()=> onTapFunction(TypeNavigationBar.home),
                        child: SvgPicture.asset('${AssetPathUtil.homeIcon}', color: snapshot.data == TypeNavigationBar.home ? TypeNavigationBar.home.color : Colors.grey,
                          width: 22, height: 22,),
                      )),
                  Expanded(
                      flex: 2,
                      child: GestureDetector(
                          onTap: ()=> onTapFunction(TypeNavigationBar.search),
                          child: SvgPicture.asset('${AssetPathUtil.searchIcon}', color: snapshot.data == TypeNavigationBar.search ? TypeNavigationBar.search.color : Colors.grey,width: 22, height: 22,))),
                  SizedBox(width: 32,),
                  Expanded(
                      flex: 3,
                      child: Container(
                        height: 40,
                        decoration: myBoxDecoration(),

                        child: Icon(Icons.add, color: Colors.white,),
                      )),
                  SizedBox(width: 32,),
                  Expanded(
                      flex: 2,
                      child: GestureDetector(
                          onTap: ()=> onTapFunction(TypeNavigationBar.chat),
                          child: SvgPicture.asset('${AssetPathUtil.chatIcon}', color: snapshot.data == TypeNavigationBar.chat ? TypeNavigationBar.chat.color : Colors.grey, width: 22, height: 22,))),
                  Expanded(
                      flex: 2,
                      child: GestureDetector(
                          onTap: ()=> onTapFunction(TypeNavigationBar.user),
                          child: SvgPicture.asset('${AssetPathUtil.userIcon}', color: snapshot.data == TypeNavigationBar.user ? TypeNavigationBar.home.color : Colors.grey, width: 22, height: 22,))),
                ],
              ),
            );
          }
          return Container();
        });
  }
}