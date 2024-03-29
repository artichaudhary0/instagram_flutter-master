import 'package:flutter/foundation.dart';
import 'package:instagram_flutter/model/user_model.dart';
import 'package:instagram_flutter/resources/auth_method.dart';

class UserProvider with ChangeNotifier{
  UsersModel? _userModel ;
  UsersModel? get getUser => _userModel!;

  Future<void> refreshUser()
  async{
    UsersModel? user = await AuthMethods().getUserDetails();
    _userModel = user;
    notifyListeners();
  }

}