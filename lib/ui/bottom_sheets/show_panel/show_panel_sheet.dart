import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:panel/sliding_up_panel/panel.dart';
import 'package:panel/ui/views/game_menu/game_menu_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'show_panel_sheet_model.dart';

class ShowPanelSheet extends StackedView<ShowPanelSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const ShowPanelSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ShowPanelSheetModel viewModel,
    Widget? child,
  ) {
    double screenHeight = MediaQuery.of(context).size.height;
    double height = screenHeight -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom -
        100;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SlidingUpPanel(
          minHeight: 0,
          snapPoint: 0.5,
          maxHeight: height,
          renderPanelSheet: false,
          controller: viewModel.controller,
          panelBuilder: (sc) => _buildPanelWidget(viewModel),
          defaultPanelState: PanelState.OPEN,
          isDraggable: viewModel.panelBaseService.isDraggable,
        ),
      ],
    );
  }

  Widget _buildPanelWidget(ShowPanelSheetModel viewModel) {
    return ClipRRect(
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
          observers: [PanelSheetNavigator()],
          onPopPage: (Route<dynamic> route, dynamic result) {
            return route.didPop(result);
          },
        ),
      ),
    );
  }

  @override
  ShowPanelSheetModel viewModelBuilder(BuildContext context) =>
      ShowPanelSheetModel();
}
