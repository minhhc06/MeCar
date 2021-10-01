import 'package:rxdart/rxdart.dart';

class BlocBase{
  BlocBase(){
    setIsShowPassword(true);
  }


  BehaviorSubject<bool> _setIsShowPassword =
  BehaviorSubject<bool>();


  Stream<bool> get getIsShowPassword => _setIsShowPassword.stream;

  setIsShowPassword(bool value) {
    _setIsShowPassword.sink.add(value);
  }

  disposeBlocBase() {
    _setIsShowPassword.close();
  }
}