import 'package:flutter/cupertino.dart';
import 'package:panel/app/app.locator.dart';
import 'package:panel/services/panel_base_service.dart';
import 'package:stacked/stacked.dart';

class GameMenuViewModel extends BaseViewModel {
  final _panelBaseService = locator<PanelBaseService>();
  PanelBaseService get panelBaseService => _panelBaseService;
  final _gameMenuSc = ScrollController();
  ScrollController get sc => _gameMenuSc;
  void setPanelSc() {
    _panelBaseService.setPanelSc(_gameMenuSc);
  }

  GameMenuViewModel() {
    //print("初始化setPanelScToGameMenu");
    setPanelSc();
  }

  bool get isGuestLogin => _panelBaseService.isGuestLogin;
  void onTapGuestLogin() {}
}
