import 'package:flutter/cupertino.dart';

class VendorBottomNavigationProvider with ChangeNotifier {
  int currentstate = 0;

  int get _currentstate => currentstate;

  void setcurrentstate(value) {
    currentstate = value;
    notifyListeners();
  }

  int getcurrentstate() {
    return _currentstate;
  }
}
