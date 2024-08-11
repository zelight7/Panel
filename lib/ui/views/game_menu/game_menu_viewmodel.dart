import 'package:flutter/cupertino.dart';
import 'package:panel/app/app.locator.dart';
import 'package:panel/services/panel_base_service.dart';
import 'package:stacked/stacked.dart';

class GameMenuViewModel extends BaseViewModel {
  final _panelBaseService = locator<PanelBaseService>();

  final ScrollController gameMenuSc = ScrollController();
  PanelBaseService get panelBaseService => _panelBaseService;

  // GameMenuViewModel() {
  //   print("setPanelScToGameMenu");
  //   _panelBaseService.sc = gameMenuSc;
  // }

  bool get isGuestLogin => _panelBaseService.isGuestLogin;

  void onTapGuestLogin() {}

  // void setScToPersnalCenter() {
  //   _panelBaseService.sc = gameMenuSc;
  // }
}
