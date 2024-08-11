import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:panel/app/app.locator.dart';
import 'package:panel/services/panel_base_service.dart';
import 'package:stacked/stacked.dart';

class PanelViewModel extends ReactiveViewModel {
  final controller = locator<PanelBaseService>().controller;
  final GlobalKey key = GlobalKey();

  final PanelBaseService _panelBaseService = locator<PanelBaseService>();
  PanelBaseService get panelBaseService => _panelBaseService;

  @override
  List<ListenableServiceMixin> get listenableServices => [_panelBaseService];
}

class PanelNavigator extends NavigatorObserver {
  final panelBaseService = locator<PanelBaseService>();
  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    panelBaseService.isDraggable = true;
  }

  @override
  void didStartUserGesture(
      Route<dynamic> route, Route<dynamic>? previousRoute) {
    panelBaseService.isDraggable = false;
    panelBaseService.controller.panelPosition = 1.0;
  }

  @override
  void didStopUserGesture() {
    panelBaseService.isDraggable = true;
  }
}
