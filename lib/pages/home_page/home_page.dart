  import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mecar/bloc/home_page_bloc.dart';
import 'package:mecar/pages/home_page/components/home_page_components/home_page_components.dart';
import 'package:mecar/pages/home_page/components/navigation_component.dart';
import 'package:mecar/pages/home_page/model/task_model.dart';
import 'package:mecar/util/assets_path_util.dart';
import 'package:mecar/util/base_components.dart';
import 'package:mecar/util/colors_util.dart';
import 'package:mecar/util/convert_color_util.dart';
import 'package:mecar/util/enum_util.dart';
import 'package:mecar/util/shared_preference_util.dart';
import 'package:mecar/util/size_util.dart';
import 'package:mecar/util/words_util.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with BaseComponents {
  HomePageBloc bloc;
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    bloc = new HomePageBloc();
  }


  final List<String> images = [
    "${AssetPathUtil.imageItem1}",
    "${AssetPathUtil.imageItem2}",
    "${AssetPathUtil.imageItem3}",
    "${AssetPathUtil.imageItem4}",
    "${AssetPathUtil.imageItem5}",
    "${AssetPathUtil.imageItem6}",
    "${AssetPathUtil.imageItem7}",
    "${AssetPathUtil.imageItem8}",
    "${AssetPathUtil.imageItem9}",
    "${AssetPathUtil.imageItem10}",

  ];


  @override
  Widget build(BuildContext context) {
    // double cardWidth = MediaQuery.of(context).size.width / 3.3;
    // double cardHeight = MediaQuery.of(context).size.height / 3.6;
    // SystemChrome.setSystemUIOverlayStyle(
    //     SystemUiOverlayStyle(statusBarColor: Colors.white));
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(SizeUtil.padding16),
          child: SingleChildScrollView(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTitlePage(title: WordsUtil.discover),
                Text('WHAT\'S NEW TODAY', style: TextStyle(fontWeight: FontWeight.bold),),
            Container(
                color: Colors.white30,
                child: StaggeredGridView.countBuilder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 4,
                  itemCount: images.length,
                  itemBuilder: (BuildContext context, int index) => Card(
                    child: Column(
                      children: <Widget>[
                        Expanded(

                            child: Image.asset(images[index], fit: BoxFit.cover,)),
                      ],
                    ),
                  ),
                  staggeredTileBuilder: (int index) =>
                  new StaggeredTile.count(2, index.isEven ? 3 : 4),
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                ),
            )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: NavigationComponent().bottomNavigationBar(
          stream: bloc.getIndexNavigationBar,
          onTapFunction: (TypeNavigationBar typeNavigationBar) {
            bloc.setIndexNavigationBar(typeCategory: typeNavigationBar);
          }),
    );;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    bloc.dispose();
  }
}
