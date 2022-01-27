import 'package:illustrare/auth/UserManager.dart';

class BaseBloc {
    bool authRequired = false;

    BaseBloc(){
        if(this.authRequired){

            this.openLoginPage();
        }

    }

    openLoginPage() async {
        bool isLoggedIn = await UserManager.instance.isLoggedIn();
        if(!isLoggedIn){
            // TODO: NAVIGATE TO LOGIN

        }

    }
}