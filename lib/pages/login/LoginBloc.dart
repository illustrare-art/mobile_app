
import 'package:illustrare/auth/UserManager.dart';
import 'package:illustrare/models/AppUserModel.dart';
import 'package:illustrare/pages/login/LoginRepository.dart';
import 'package:rxdart/rxdart.dart';


class LoginBloc {
  final LoginRepository _repository = LoginRepository();
  final BehaviorSubject<AppUserModel> _subject = BehaviorSubject<AppUserModel>();

  getUser() async {
    if(await UserManager.instance.isLoggedIn()){
      AppUserModel? user = await UserManager.instance.getUser();
      _subject.sink.add(user!);
    }else{
      AppUserModel? response = await _repository.getUser();
      if(response != null){
        UserManager.instance.setUser(response);
        _subject.sink.add(response);
      }
    }

  }

  dispose(){
    _subject.close();
  }

  BehaviorSubject<AppUserModel> get subject => _subject;

}

final bloc = LoginBloc();