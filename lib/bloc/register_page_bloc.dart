import 'package:rxdart/rxdart.dart';
import 'package:todo_manabie/util/bloc_base.dart';

class RegisterPageBloc extends BlocBase{
  BehaviorSubject<bool> _setIsShowCheckPassword =
  BehaviorSubject<bool>();


  Stream<bool> get getIsShowPassword => _setIsShowCheckPassword.stream;

  setIsShowCheckPassword(bool value) {
    _setIsShowCheckPassword.sink.add(value);
  }

  dispose() {
    _setIsShowCheckPassword.close();
  }

}