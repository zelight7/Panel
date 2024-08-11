import 'package:flutter/material.dart';
import 'package:panel/app/app.bottomsheets.dart';
import 'package:panel/app/app.locator.dart';
import 'package:panel/services/panel_base_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PeronalCenterViewModel extends BaseViewModel {
  final _panelBaseService = locator<PanelBaseService>();
  final _bottomSheetService = locator<BottomSheetService>();
  //final personalCenterSc = locator<PanelBaseService>().personalCenterSc;
  // ScrollController get personalCenterSc =>
  //     locator<PanelBaseService>().personalCenterSc;
  final ScrollController personalCenterSc = ScrollController();
  final TextEditingController textEditingController = TextEditingController();
  bool isShowTextField = false;
  PanelBaseService get panelBaseService => _panelBaseService;
  // PeronalCenterViewModel() {
  //   _panelBaseService.sc = personalCenterSc;
  // }

  bool get isGuestLogin => _panelBaseService.isGuestLogin;
  bool _switch2FA = false;
  bool get switch2FA => _switch2FA;
  void on2FAChanged(bool value) {
    _switch2FA = value;
    rebuildUi();
  }

  // void setPanelScToGameMenu() {
  //   print("setPanelScToGameMenu");
  //   _panelBaseService.setPanelScToGameMenu();
  // }

  bool _switchNotification = false;
  bool get switchNotification => _switchNotification;
  void onNotificationChanged(bool value) {
    _switchNotification = value;
    rebuildUi();
  }

  void onTapPersonalInformation(BuildContext context) {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
    );
    //panelBaseService.showCustomPopup(context);
  }

  void onTapLinkPass() {}
  void onTapLinkThirdParty() {}
  void onTapAccountDetails() {}
  void onTapSwitchAccount() {}
  void onTapDeviceLoginHistory() {}
  void onTapLanguage() {}
  void onTapPrivacyAndTerms() {}
  void onTapCustomerFeedback() {}
  void onTapHelpCenter() {}
  void onTapLogout() {}

  void onButtonPressed() {
    print('rebuild');
    rebuildUi();
  }
}
