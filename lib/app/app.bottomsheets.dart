// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedBottomsheetGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/bottom_sheets/example/example_sheet.dart';
import '../ui/bottom_sheets/notice/notice_sheet.dart';
import '../ui/bottom_sheets/personal_center/personal_center_sheet.dart';
import '../ui/bottom_sheets/show_panel/show_panel_sheet.dart';

enum BottomSheetType {
  notice,
  showPanel,
  personalCenter,
  example,
}

void setupBottomSheetUi() {
  final bottomsheetService = locator<BottomSheetService>();

  final Map<BottomSheetType, SheetBuilder> builders = {
    BottomSheetType.notice: (context, request, completer) =>
        NoticeSheet(request: request, completer: completer),
    BottomSheetType.showPanel: (context, request, completer) =>
        ShowPanelSheet(request: request, completer: completer),
    BottomSheetType.personalCenter: (context, request, completer) =>
        PersonalCenterSheet(request: request, completer: completer),
    BottomSheetType.example: (context, request, completer) =>
        ExampleSheet(request: request, completer: completer),
  };

  bottomsheetService.setCustomSheetBuilders(builders);
}
