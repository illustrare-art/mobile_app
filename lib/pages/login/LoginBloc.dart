import 'package:illustrare/auth/UserManager.dart';
import 'package:illustrare/models/AppUserModel.dart';
import 'package:illustrare/pages/login/LoginRepository.dart';
import 'package:rxdart/rxdart.dart';


class LoginBloc {
  final LoginRepository _repository = LoginRepository();
  final BehaviorSubject<AppUserModel> _subject = BehaviorSubject<AppUserModel>();
  final UserManager _manager = UserManager();

  getUser() async {
    if(await _manager.isLoggedIn()){
      AppUserModel? user = await _manager.getUser();
      _subject.sink.add(user!);
      return;
    }else{
      AppUserModel? response = await _repository.getUser();
      if(response != null) _subject.sink.add(response);
    }

  }

  dispose(){
    _subject.close();
  }

  BehaviorSubject<AppUserModel> get subject => _subject;

}

final bloc = LoginBloc();