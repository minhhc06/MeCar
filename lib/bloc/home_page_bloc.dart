import 'package:mecar/util/assets_path_util.dart';
import 'package:rxdart/rxdart.dart';
import 'package:mecar/util/enum_util.dart';

class HomePageBloc {


  HomePageBloc() {
    setIndexNavigationBar(typeCategory: TypeNavigationBar.home);

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

    ];


    setListUrlImage(images);
  }

  BehaviorSubject<TypeNavigationBar> _setIndexNavigationBar =
      BehaviorSubject<TypeNavigationBar>();

  Stream<TypeNavigationBar> get getIndexNavigationBar =>
      _setIndexNavigationBar.stream;

  setIndexNavigationBar({TypeNavigationBar typeCategory}) {
      _setIndexNavigationBar.sink.add(typeCategory);

  }

  BehaviorSubject<List<String>> _setListUrlImage = BehaviorSubject<List<String>>();

  Stream<List<String>> get getListUrlImage => _setListUrlImage.stream;

  setListUrlImage(List<String> listTask) {

    _setListUrlImage.sink.add(listTask);

  }

  updateIsCompleted() {
    List<String> imagesAddMore = [
      "${AssetPathUtil.imageItem1}",
      "${AssetPathUtil.imageItem2}",
      "${AssetPathUtil.imageItem3}",
      "${AssetPathUtil.imageItem4}",
      "${AssetPathUtil.imageItem5}",
      "${AssetPathUtil.imageItem6}",
      "${AssetPathUtil.imageItem7}",
      "${AssetPathUtil.imageItem8}",
      "${AssetPathUtil.imageItem9}",

    ];
      var model = _setListUrlImage.stream.value;
      model.addAll(imagesAddMore);

      _setListUrlImage.sink.add(model);

  }

  dispose() {

      _setIndexNavigationBar.close();
      _setListUrlImage.close();
  }
}
