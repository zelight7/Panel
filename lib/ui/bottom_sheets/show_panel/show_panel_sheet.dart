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
          panelBuilder: () => _buildPanelWidget(viewModel),
          //backdropEnabled: true,
          defaultPanelState: PanelState.OPEN,
          //isDraggable: 关闭时滑动列表到头，不能连同面板一起下拉到底
          isDraggable: viewModel.panelBaseService.isDraggable,
          onPanelClosed: () {
            //面板下滑到关闭时，应该让sheet一起销毁
            Navigator.pop(context); //(context, Duration(milliseconds: 100));
            print("close");
          },
          scrollController: viewModel.panelBaseService.sc,
          //disableDraggableOnScrolling: true,
        ),
      ],
    );
  }

  Widget _scrollingList(ScrollController sc) {
    return ListView.builder(
      controller: sc,
      itemCount: 50,
      itemBuilder: (BuildContext context, int i) {
        return Container(
          padding: const EdgeInsets.all(12.0),
          child: Text("$i"),
        );
      },
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
