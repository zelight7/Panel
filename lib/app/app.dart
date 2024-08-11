import 'package:panel/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:panel/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:panel/ui/views/home/home_view.dart';
import 'package:panel/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:panel/ui/views/game_menu/game_menu_view.dart';
import 'package:panel/ui/views/personal_center/personal_center_view.dart';
import 'package:panel/ui/views/panel/panel_view.dart';
import 'package:panel/services/panel_base_service.dart';
import 'package:panel/ui/bottom_sheets/show_panel/show_panel_sheet.dart';
import 'package:panel/ui/bottom_sheets/personal_center/personal_center_sheet.dart';
import 'package:panel/ui/bottom_sheets/example/example_sheet.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: GameMenuView),
    MaterialRoute(page: PeronalCenterView),
    MaterialRoute(page: PanelView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: PanelBaseService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    StackedBottomsheet(classType: ShowPanelSheet),
    StackedBottomsheet(classType: PersonalCenterSheet),
    StackedBottomsheet(classType: ExampleSheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
