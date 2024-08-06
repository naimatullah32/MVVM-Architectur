
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm/View_model/user_view-model.dart';
import 'package:mvvm/model/User_Model.dart';
import 'package:mvvm/respositry/auth_repositry.dart';
import 'package:mvvm/utilities/Route/routes_name.dart';
import 'package:mvvm/utilities/utiles.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier{

  final _repo=AuthRepositry();

  bool _loading=false;
  bool get loading => _loading;

  bool _signUploading=false;
  bool get signUploading => _signUploading;

  setLoading(bool value){
    _loading=value;
    notifyListeners();
  }

  setSignUploading(bool value){
    _signUploading=value;
    notifyListeners();
  }



  Future<void> loginApi(dynamic data, BuildContext context) async{
    setLoading(true);
    _repo.loginApi(data).then((value){
      setLoading(false);
      final userPreference=Provider.of<UserViewModel>(context , listen: false);
      userPreference.saveUser(
        UserModel(
          token: value['token'].toString())
      );
      Utiles.flushBarErrorMessage("Login succesfully", context);
      Navigator.pushNamed(context, RoutesName.home);
      if(kDebugMode){
        print(value.toString());
      }

    }).onError((error, stackTrace){
      setLoading(false);
      if(kDebugMode){
        Utiles.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }

    });
  }

  Future<void> SingUpApi(dynamic data, BuildContext context) async{
    setSignUploading(true);
    _repo.SignUpApi(data).then((value){
      setSignUploading(false);
      if(kDebugMode){
        Utiles.flushBarErrorMessage("Account created succesfully", context);
        Navigator.pushNamed(context, RoutesName.home);
        print(value.toString());
      }

    }).onError((error, stackTrace){
      setSignUploading(false);
      if(kDebugMode){
        Utiles.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }

    });
  }
}