import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mecar/bloc/home_page_bloc.dart';
import 'package:mecar/pages/home_page/components/home_page_components/home_page_components.dart';
import 'package:mecar/pages/home_page/components/navigation_component.dart';
import 'package:mecar/util/assets_path_util.dart';
import 'package:mecar/util/base_components.dart';
import 'package:mecar/util/colors_util.dart';
import 'package:mecar/util/enum_util.dart';
import 'package:mecar/util/size_util.dart';
import 'package:mecar/util/words_util.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with BaseComponents {
  HomePageBloc bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    bloc = new HomePageBloc();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => handleWillPop(),
      child: Scaffold(
        body: StreamBuilder<TypeNavigationBar>(
            stream: bloc.getIndexNavigationBar,
            builder: (context, snapshotPage) {
              if (snapshotPage.data == null) {
                return Container();
              }
              return snapshotPage.data == TypeNavigationBar.home
                  ? SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(SizeUtil.padding16),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: SizeUtil.padding16),
                                child:
                                    buildTitlePage(title: WordsUtil.discover),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: SizeUtil.padding16),
                                child: Text(
                                  '${WordsUtil.newToday}',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Image.asset('${AssetPathUtil.imageTitleHome}',
                                  fit: BoxFit.fill,
                                  width: MediaQuery.of(context).size.width,
                                  height: SizeUtil.heightImageTitle),
                              HomePageComponents().buildFieldInformation(),
                              StreamBuilder<List<String>>(
                                  stream: bloc.getListUrlImage,
                                  builder: (context, snapshotListUrlImage) {
                                    if (snapshotListUrlImage.data == null) {
                                      return Container();
                                    }
                                    return Column(
                                      children: [
                                        Container(
                                          color: Colors.white30,
                                          child: StaggeredGridView.countBuilder(
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            crossAxisCount: 4,
                                            itemCount: snapshotListUrlImage
                                                .data.length,
                                            itemBuilder: (BuildContext context,
                                                    int index) =>
                                                Card(
                                              child: Column(
                                                children: <Widget>[
                                                  Expanded(
                                                      child: Image.asset(
                                                    snapshotListUrlImage
                                                        .data[index],
                                                    fit: BoxFit.cover,
                                                  )),
                                                ],
                                              ),
                                            ),
                                            staggeredTileBuilder: (int index) =>
                                                new StaggeredTile.count(
                                                    2, index.isEven ? 3 : 4),
                                            mainAxisSpacing: 4.0,
                                            crossAxisSpacing: 4.0,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                                child: buttonUtil(
                                                    title: '${WordsUtil.seeMore}',
                                                    radiusColor: ColorsUtil
                                                        .blackColorBtn,
                                                    background: ColorsUtil
                                                        .whiteColorBtn,
                                                    titleColor: ColorsUtil
                                                        .blackColorBtn,
                                                    handleOnPress: () {
                                                      bloc.updateIsCompleted();
                                                    })),
                                          ],
                                        )
                                      ],
                                    );
                                  }),
                            ],
                          ),
                        ),
                      ),
                    )
                  : HomePageComponents().logoutComponent(context);
            }),
        bottomNavigationBar: NavigationComponent().bottomNavigationBar(
            stream: bloc.getIndexNavigationBar,
            onTapFunction: (TypeNavigationBar typeNavigationBar) {
              bloc.setIndexNavigationBar(typeCategory: typeNavigationBar);
            }),
      ),
    );
    ;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    bloc.dispose();
  }
}
