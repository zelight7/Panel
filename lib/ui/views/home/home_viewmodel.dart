import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:panel/app/app.bottomsheets.dart';
import 'package:panel/app/app.dialogs.dart';
import 'package:panel/app/app.locator.dart';
import 'package:panel/ui/views/panel/panel_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked $_counter stars on Github',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.showPanel,
      isScrollControlled: true,
      enableDrag: false,
    );
  }

  void onTapButton(BuildContext context) {
    // _bottomSheetService.showCustomSheet(
    //   variant: BottomSheetType.notice,
    //   isScrollControlled: true,
    // );
    showCupertinoModalBottomSheet(
      context: context,
      builder: (context) => PanelView(),
      expand: true,
    );
  }
}
