import 'package:flutter/material.dart';
import 'package:zaunfunk/features/authentication/models/zf_user.dart';

class UserProvider with ChangeNotifier {
  ZfUser? _currentUser;

  ZfUser? get currentUser => _currentUser;

  void setUser({required ZfUser user}) async {
    _currentUser =  user;
    notifyListeners();
  }

  void removeUser() {
    _currentUser = null;
    notifyListeners();
  }
}
