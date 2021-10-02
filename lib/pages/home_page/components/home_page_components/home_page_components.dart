import 'package:flutter/material.dart';
import 'package:mecar/pages/login_page/login_page.dart';
import 'package:mecar/util/assets_path_util.dart';
import 'package:mecar/util/base_components.dart';
import 'package:mecar/util/shared_preference_util.dart';
import 'package:mecar/util/size_util.dart';
import 'package:mecar/util/words_util.dart';

class HomePageComponents extends BaseComponents{
  Widget buildFieldInformation(){
    return Padding(
      padding: const EdgeInsets.all(SizeUtil.padding8),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('${AssetPathUtil.imageAvatar}'),
          ),
          SizedBox(width: SizeUtil.padding8,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Ridwan Nordin', style: TextStyle(fontWeight: FontWeight.bold),),
              Text('\@ridzjcob', style: TextStyle(color: Colors.grey[700]),),

            ],
          )
        ],
      ),
    );
  }

  Widget logoutComponent(BuildContext context){
    return Center(
      child: Row(
          children: [
            Expanded(child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: SizeUtil.padding16),
              child: buttonUtil(title: WordsUtil.logoutTitle, handleOnPress: () {
                SharedPreferenceUtil().removeStringSharePreference(key: WordsUtil.token);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );

              }),
            ))
            ],
        ),
    );
}


}