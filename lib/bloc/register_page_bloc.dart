import 'package:rxdart/rxdart.dart';
import 'package:mecar/util/bloc_base.dart';

class RegisterPageBloc extends BlocBase{



  BehaviorSubject<bool> _setIsShowConfirmPassword = BehaviorSubject<bool>();


  Stream<bool> get getIsShowConfirmPassword => _setIsShowConfirmPassword.stream;

  setIsShowConfirmPassword(bool value) {
    _setIsShowConfirmPassword.sink.add(value);
  }

  dispose() {
    _setIsShowConfirmPassword.close();
    disposeBlocBase();
  }

  RegisterPageBloc(){
    setIsShowConfirmPassword(true);
  }
}