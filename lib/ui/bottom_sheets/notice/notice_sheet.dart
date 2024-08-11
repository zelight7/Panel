import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:panel/ui/views/game_menu/game_menu_view.dart';
import 'package:panel/ui/views/panel/panel_viewmodel.dart';
import 'package:sheet/sheet.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'notice_sheet_model.dart';

class NoticeSheet extends StackedView<NoticeSheetModel> {
  final Function(SheetResponse)? completer;
  final SheetRequest request;
  const NoticeSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    NoticeSheetModel viewModel,
    Widget? child,
  ) {
    return Sheet(
      initialExtent: 400,
      minExtent: 100,
      maxExtent: 600,
      child:
          //  Column(
          //   mainAxisSize: MainAxisSize.min,
          //   children: [

          //       child: SizedBox(
          //         width: MediaQuery.of(context).size.height,
          //         height: MediaQuery.of(context).size.height / 2,
          Navigator(
        pages: const [
          CupertinoPage(
            child: GameMenuView(),
          ),
        ],
        onPopPage: (Route<dynamic> route, dynamic result) {
          return route.didPop(result);
        },
      ),
      //),
      //     ),
      //   ],
      // ),
    );
  }

  Widget _buildPanelWidget(BuildContext context, NoticeSheetModel viewModel) {
    return
        // ClipRRect(
        //   borderRadius: const BorderRadius.only(
        //     topLeft: Radius.circular(16),
        //     topRight: Radius.circular(16),
        //   ),
        //   child:
        Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.height,
        child: Navigator(
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
    );
  }

  @override
  NoticeSheetModel viewModelBuilder(BuildContext context) => NoticeSheetModel();
}
