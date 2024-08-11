import 'package:flutter/material.dart';
import 'package:panel/app/app.locator.dart';
import 'package:panel/services/panel_base_service.dart';
import 'package:stacked/stacked.dart';

class ShowPanelSheetModel extends ReactiveViewModel {
  final controller = locator<PanelBaseService>().controller;
  final GlobalKey key = GlobalKey();

  final PanelBaseService _panelBaseService = locator<PanelBaseService>();
  PanelBaseService get panelBaseService => _panelBaseService;

  @override
  List<ListenableServiceMixin> get listenableServices => [_panelBaseService];
}

class PanelSheetNavigator extends NavigatorObserver {
  final _panelBaseService = locator<PanelBaseService>();
  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    //_panelBaseService.resetScrollController();
    print("didpop rebuild");
    _panelBaseService.isDraggable = true;
  }

  // void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
  //   //_panelBaseService.resetScrollController();
  //   _panelBaseService.isDraggable = true;
  // }

  @override
  void didStartUserGesture(
      Route<dynamic> route, Route<dynamic>? previousRoute) {
    print("didStartUserGesture");
    _panelBaseService.isDraggable = true;
    //panelBaseService.controller.panelPosition = 1.0;
  }

  @override
  void didStopUserGesture() {
    print("didStopUserGesture");
    _panelBaseService.isDraggable = true;
  }
}
