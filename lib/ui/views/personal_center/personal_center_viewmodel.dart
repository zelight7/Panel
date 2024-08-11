import 'package:flutter/material.dart';
import 'package:panel/app/app.bottomsheets.dart';
import 'package:panel/app/app.locator.dart';
import 'package:panel/services/panel_base_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PeronalCenterViewModel extends BaseViewModel {
  final _panelBaseService = locator<PanelBaseService>();
  final _bottomSheetService = locator<BottomSheetService>();

  final _personalCenterSc = ScrollController();
  ScrollController get sc => _personalCenterSc;

  final TextEditingController textEditingController = TextEditingController();
  bool isShowTextField = false;
  PanelBaseService get panelBaseService => _panelBaseService;
  PeronalCenterViewModel() {
    //print("初始化personalCenter的sc");
    setPanelSc();
  }

  bool get isGuestLogin => _panelBaseService.isGuestLogin;
  bool _switch2FA = false;
  bool get switch2FA => _switch2FA;
  void on2FAChanged(bool value) {
    _switch2FA = value;
    rebuildUi();
  }

  void setPanelSc() {
    _panelBaseService.setPanelSc(_personalCenterSc);
  }

  // void setPanelScToGameMenu() {
  //   print("setPanelScToGameMenu");
  //   _panelBaseService.setPanelSc(_personalCenterSc);
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
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.showPanel,
      isScrollControlled: true,
      enableDrag: false,
      //barrierDismissible: false,
      useRootNavigator: true,
      //exitBottomSheetDuration: Duration(milliseconds: 0),
    );
  }
}
