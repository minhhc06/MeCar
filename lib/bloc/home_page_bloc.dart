import 'package:rxdart/rxdart.dart';
import 'package:mecar/pages/home_page/model/task_model.dart';
import 'package:mecar/util/enum_util.dart';

class HomePageBloc {
  HomePageBloc({List<TaskModel> listTask}) {
    setIndexNavigationBar(typeCategory: TypeNavigationBar.home);
    setListTaskModel(listTask);
  }

  BehaviorSubject<TypeNavigationBar> _setIndexNavigationBar =
      BehaviorSubject<TypeNavigationBar>();

  Stream<TypeNavigationBar> get getIndexNavigationBar =>
      _setIndexNavigationBar.stream;

  setIndexNavigationBar({TypeNavigationBar typeCategory}) {
      _setIndexNavigationBar.sink.add(typeCategory);

  }

  BehaviorSubject<List<TaskModel>> _setListTaskModel =
      BehaviorSubject<List<TaskModel>>();

  Stream<List<TaskModel>> get getListTaskModel => _setListTaskModel.stream;

  setListTaskModel(List<TaskModel> listTask) {
    try {
      _setListTaskModel.sink.add(listTask);
      return true;
    } catch (ex) {
      return false;
    }
  }

  updateIsCompleted({TaskModel taskModel}) {
    try {
      var model = _setListTaskModel.stream.value;

      int index = model.indexOf(taskModel);
      model[index].isComplete = !model[index].isComplete;

      _setListTaskModel.sink.add(model);

      return true;
    } catch (ex) {
      return false;
    }
  }

  dispose() {
    try {
      _setIndexNavigationBar.close();
      _setListTaskModel.close();
      return true;
    } catch (ex) {
      return false;
    }
  }
}
