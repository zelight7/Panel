import 'package:flutter/material.dart';
//import 'package:my_first_app/app/app.locator.dart';
//import 'package:my_first_app/services/login_service.dart';
import 'package:panel/sliding_up_panel/panel.dart';
import 'package:stacked/stacked.dart';

class PanelBaseService with ListenableServiceMixin {
  //final _loginService = locator<LoginService>();
  PanelController controller = PanelController();
  ScrollController sc = ScrollController();

  // ScrollController get sc => _sc;
  // set sc(ScrollController value) {
  //   _sc = value;
  //   setPanelSc();
  // }

  bool _isDraggable = true;
  bool get isDraggable => _isDraggable;
  set isDraggable(bool value) {
    _isDraggable = value;
    notifyListeners();
  }

  bool get isGuestLogin => false;
  set isGuestLogin(bool value) {
    if (isGuestLogin = !value) {
      isGuestLogin = value;
      notifyListeners();
    }
  }

  // void clear() {
  //   controller.clear();
  // }

  Future<void> open() async {
    notifyListeners();
    await controller.open();
  }

  // void setPanelSc() {
  //   controller.setScrollController(_sc);
  // }
}
