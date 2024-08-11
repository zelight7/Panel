import 'package:panel/app/app.locator.dart';
import 'package:panel/services/panel_base_service.dart';
import 'package:stacked/stacked.dart';

class PanelSheetSheetModel extends BaseViewModel {
  final controller = locator<PanelBaseService>().controller;
}
