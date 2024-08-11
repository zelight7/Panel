import 'package:flutter/widgets.dart';
import 'package:panel/app/app.locator.dart';
import 'package:panel/services/panel_base_service.dart';
import 'package:stacked/stacked.dart';

class NoticeSheetModel extends ReactiveViewModel {
  final controller = locator<PanelBaseService>().controller;
  final GlobalKey key = GlobalKey();

  final PanelBaseService _panelBaseService = locator<PanelBaseService>();
  PanelBaseService get panelBaseService => _panelBaseService;

  @override
  List<ListenableServiceMixin> get listenableServices => [_panelBaseService];
}
