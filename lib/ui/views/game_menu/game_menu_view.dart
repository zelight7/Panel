import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:panel/ui/views/personal_center/personal_center_view.dart';
import 'package:stacked/stacked.dart';

import 'game_menu_viewmodel.dart';

class GameMenuView extends StackedView<GameMenuViewModel> {
  const GameMenuView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    GameMenuViewModel viewModel,
    Widget? child,
  ) {
    print("game menu build");
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTopBar(viewModel),
          _buildContentWidget(context, viewModel),
        ],
      ),
    );
  }

  Widget _buildContentWidget(
      BuildContext context, GameMenuViewModel viewModel) {
    return Expanded(
      child: ListView(
        controller: viewModel.panelBaseService.sc,
        children: [
          Column(
            children: [
              viewModel.isGuestLogin
                  ? _buildAvatorGuest(context, viewModel)
                  : _buildAvator(context, viewModel),
              const SizedBox(height: 12),
              _buildRecentPlayBox(context, viewModel),
              const SizedBox(height: 12),
              _buildRcommendBox(context, viewModel),
              const SizedBox(height: 12),
              _buildOptionsBox(context, viewModel),
              const SizedBox(height: 12),
              _buildRcommendBox(context, viewModel),
              const SizedBox(height: 12),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar(GameMenuViewModel viewModel) {
    return
        // Listener(
        //   behavior: HitTestBehavior.opaque,
        //   onPointerMove: (p) =>
        //       viewModel.panelBaseService.controller.onChildWidgetPointerMove(p),
        //   child:
        Container(
      height: 39,
      alignment: Alignment.center,
      child: Column(
        children: [
          const SizedBox(height: 5),
          SizedBox(
            width: 36,
            height: 5,
            child: Container(color: Colors.red),
          ),
          const SizedBox(height: 10),
        ],
      ),
      //),
    );
  }

  Widget _buildAvator(BuildContext context, GameMenuViewModel viewModel) {
    return InkWell(
      onTap: () => _toPersonalCenter(context, viewModel),
      child: Container(
        height: 50,
        width: 343,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
        ),
        alignment: Alignment.center,
        child: const Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.amber,
              //backgroundImage: AssetImage('images/avator_menu.png'),
              radius: 25,
            ),
            SizedBox(width: 10.5),
            SizedBox(
              width: 50,
              height: 20,
              child: Text(
                'Name',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(width: 214),
            SizedBox(
              width: 16,
              height: 16,
              child:
                  Icon(Icons.arrow_forward_ios, color: Colors.black, size: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatorGuest(BuildContext context, GameMenuViewModel viewModel) {
    return InkWell(
      onTap: () => _toPersonalCenter(context, viewModel),
      child: Container(
        height: 50,
        width: 343,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
        ),
        alignment: Alignment.center,
        child: Row(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.amber,
              //backgroundImage: AssetImage('images/avator_guest.png'),
              radius: 25,
            ),
            const SizedBox(width: 10.5),
            const SizedBox(
              width: 50,
              height: 20,
              child: Text(
                'Visitor',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(width: 165),
            GestureDetector(
              onTap: viewModel.onTapGuestLogin,
              child: Container(
                width: 68,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF8C82FF), Color(0xFF7064FF)],
                  ),
                ),
                child: const Text(
                  'Log in',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentPlayBox(
      BuildContext context, GameMenuViewModel viewModel) {
    return Container(
      height: 153,
      width: 343,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFFF4F4F4),
      ),
      alignment: Alignment.center,
      child: Stack(
        children: [
          const Positioned(
            left: 16,
            top: 16,
            child: Text(
              'Recent Play',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          Positioned(
            left: 16,
            top: 45,
            child: Container(
              color: Colors.red,
              width: 176,
              height: 92,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRcommendBox(BuildContext context, GameMenuViewModel viewModel) {
    return Container(
      height: 236,
      width: 343,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFFF4F4F4),
      ),
      alignment: Alignment.center,
      child: Stack(
        children: [
          const Positioned(
            left: 16,
            top: 16,
            child: Text(
              'Recommend for you',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          Positioned(
            left: 16,
            top: 45,
            child: Container(
              color: Colors.red,
              width: 311,
              height: 175,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionsBox(BuildContext context, GameMenuViewModel viewModel) {
    return SizedBox(
      height: 78,
      width: 343,
      child: Container(
        color: Colors.red,
      ),
    );
  }

  void _toPersonalCenter(BuildContext context, GameMenuViewModel viewModel) {
    //viewModel.setPanelScToPersonalCenter();
    Navigator.push(
      context,
      //CupertinoPageRoute风格
      CupertinoPageRoute(
        builder: (context) {
          return const PeronalCenterView();
        },
      ),
    );
  }

  @override
  GameMenuViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      GameMenuViewModel();
}
