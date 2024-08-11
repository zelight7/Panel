import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:panel/ui/views/game_menu/game_menu_view.dart';
import 'package:sheet/sheet.dart';
import 'package:stacked/stacked.dart';

import 'panel_viewmodel.dart';

class PanelView extends StackedView<PanelViewModel> {
  const PanelView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PanelViewModel viewModel,
    Widget? child,
  ) {
    return
        //Container(height: 400, color: Colors.red);
        _buildPanelWidget(viewModel);
  }

  Widget _buildPanelWidget(PanelViewModel viewModel) {
    return Sheet(
      initialExtent: 200,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        child: Scaffold(
          body: Navigator(
            key: viewModel.key,
            pages: const [
              CupertinoPage(
                child: GameMenuView(),
              ),
            ],
            observers: [PanelNavigator()],
            onPopPage: (Route<dynamic> route, dynamic result) {
              return route.didPop(result);
            },
          ),
        ),
      ),
    );
  }

  @override
  PanelViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PanelViewModel();
}
