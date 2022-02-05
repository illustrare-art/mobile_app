
import 'package:illustrare/auth/TokenManager.dart';
import 'package:illustrare/auth/UserManager.dart';
import 'package:illustrare/models/AppUserModel.dart';
import 'package:illustrare/pages/login/LoginRepository.dart';
import 'package:rxdart/rxdart.dart';


class LoginBloc {
  final LoginRepository _repository = LoginRepository();
  final BehaviorSubject<AppUserModel> _subject = BehaviorSubject<AppUserModel>();

  getUser() async {
    AppUserModel? user = await UserManager.instance.getUser();
    _subject.sink.add(user!);
  }

  login() async{

    var model = await _repository.login();
    if(model != null) getUser();
  }

  bool isLoggedIn(){
    return TokenManager.instance.isLoggedIn();
  }

  dispose(){
    _subject.close();
  }

  BehaviorSubject<AppUserModel> get subject => _subject;

}

final bloc = LoginBloc();