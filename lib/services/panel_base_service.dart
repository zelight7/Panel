import 'package:flutter/material.dart';
//import 'package:my_first_app/app/app.locator.dart';
//import 'package:my_first_app/services/login_service.dart';
import 'package:panel/sliding_up_panel/panel.dart';
import 'package:stacked/stacked.dart';

class PanelBaseService with ListenableServiceMixin {
  PanelController controller = PanelController();

  void setPanelSc(ScrollController sc) {
    controller.setScrollController(sc);
  }

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

  Future<void> open() async {
    notifyListeners();
    await controller.open();
  }
}
