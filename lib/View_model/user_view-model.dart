

import 'package:flutter/cupertino.dart';
import 'package:mvvm/model/User_Model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier{

  Future<bool> saveUser(UserModel user)async{

    SharedPreferences sp= await SharedPreferences.getInstance();
      sp.setString("token", user.token.toString());

    return true;
  }

  Future<UserModel> getUser() async{

    SharedPreferences sp=await SharedPreferences.getInstance();
    final  String? token1=sp.getString("token");

    return UserModel(
      token: token1.toString(),
    );
  }

  Future<bool> remove() async{
    SharedPreferences sp=await SharedPreferences.getInstance();
    sp.remove("token");

    return true;
  }
}