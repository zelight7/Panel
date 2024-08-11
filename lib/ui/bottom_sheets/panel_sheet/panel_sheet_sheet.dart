import 'package:flutter/material.dart';
import 'package:panel/ui/common/app_colors.dart';
import 'package:panel/ui/common/ui_helpers.dart';
import 'package:panel/sliding_up_panel/panel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'panel_sheet_sheet_model.dart';

class PanelSheetSheet extends StackedView<PanelSheetSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const PanelSheetSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PanelSheetSheetModel viewModel,
    Widget? child,
  ) {
    double screenHeight = MediaQuery.of(context).size.height;
    double height = screenHeight -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            request.title ?? 'Hello Stacked Sheet!!111',
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
          ),
          if (request.description != null) ...[
            verticalSpaceTiny,
            Text(
              request.description!,
              style: const TextStyle(fontSize: 14, color: kcMediumGrey),
              maxLines: 3,
              softWrap: true,
            ),
          ],
          verticalSpaceLarge,
          Container(
              height: 200,
              child: ListView(
                children: [
                  FloatingActionButton(onPressed: () {}),
                  SlidingUpPanel(
                    minHeight: 0,
                    snapPoint: 0.5,
                    maxHeight: height,
                    renderPanelSheet: false,
                    parallaxEnabled: false,
                    defaultPanelState: PanelState.CLOSED,
                    controller: viewModel.controller,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                    //panelBuilder: (sc) => _buildPanelWidget(viewModel),
                    backdropEnabled: true,
                    // panel: Container(
                    //   width: 100,
                    //   height: 100,
                    //   color: Colors.red,
                    //   child: Text("This is the sliding Widget"),
                    // ),
                    //isDraggable: viewModel.panelBaseService.isDraggable,
                    onPanelClosed: () {
                      // If there are comment details in the panel, the local route pops up
                      // For example, pull down the details page, close the panel, and exit to the list page
                      // CommentDetailModel detailModel = AppGlobal.read<CommentDetailModel>();
                      print("close");
                      //Navigator.popUntil(context, (route) => route.isFirst);
                      // Navigator.pushAndRemoveUntil(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => GameMenuView()),
                      //   (route) => false,
                      // );
                    },
                  ),
                ],
              )),
        ],
      ),
    );
  }

  @override
  PanelSheetSheetModel viewModelBuilder(BuildContext context) =>
      PanelSheetSheetModel();
}
