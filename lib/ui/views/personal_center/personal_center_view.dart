import 'package:flutter/material.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import 'personal_center_viewmodel.dart';

class PeronalCenterView extends StackedView<PeronalCenterViewModel> {
  const PeronalCenterView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PeronalCenterViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Column(
        children: [
          _buildTopBackBar(context, viewModel),
          _buildContentWidget(context, viewModel),
        ],
      ),
    );
  }

  Widget _buildContentWidget(
      BuildContext context, PeronalCenterViewModel viewModel) {
    print("personal center build");
    return Expanded(
      child: ListView(
        controller: viewModel.panelBaseService.sc,
        children: <Widget>[
          Column(
            children: [
              //FloatingActionButton(onPressed: viewModel.onButtonPressed),
              _buildAccountBox(context, viewModel),
              SizedBox(height: 10),
              _buildSecurityBox(context, viewModel),
              SizedBox(height: 10),
              _buildSettingBox(context, viewModel),
              SizedBox(height: 10),
              _buildAboutBox(context, viewModel),
              SizedBox(height: 20),
              _buildLogoutBox(viewModel),
              SizedBox(height: 10),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTopBackBar(
      BuildContext context, PeronalCenterViewModel viewModel) {
    return
        // Listener(
        //   behavior: HitTestBehavior.opaque,
        //   onPointerMove: (p) =>
        //       viewModel.panelBaseService.controller.onChildWidgetPointerMove(p),
        //   child:
        Stack(
      children: [
        Positioned(
          left: 16,
          top: 25,
          child: InkWell(
            onTap: () {
              //viewModel.setPanelScToGameMenu();
              Navigator.pop(context);
            },
            child:
                const Icon(Icons.arrow_back_ios, color: Colors.black, size: 16),
          ),
        ),
        Container(
          height: 68,
          //color: Colors.yellow,
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(height: 5),
              SizedBox(
                width: 36,
                height: 5,
                child: Container(color: Colors.red),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 26,
                child: Text(
                  'Personal Center',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ],
      //),
    );
  }

  Widget _buildAccountBox(
      BuildContext context, PeronalCenterViewModel viewModel) {
    return Column(
      children: [
        SizedBox(
          height: 32,
          child: Row(
            children: [
              SizedBox(
                width: 32,
              ),
              Text(
                'Account',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF898A8D)),
              ),
            ],
          ),
        ),
        Container(
          height: viewModel.isGuestLogin ? 240 : 192,
          width: 343,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xFFF5F5F5),
          ),
          child: Column(
            children: [
              SizedBox(height: 12),
              buildListTile('Personal Information', true, context, viewModel),
              Divider(
                color: const Color(0x8FD9D9D9),
                indent: 14,
                endIndent: 14,
                height: 24,
              ),
              viewModel.isGuestLogin
                  ? Column(
                      children: [
                        SizedBox(
                          height: 24,
                          child: ListTile(
                              title: const Row(
                                children: [
                                  Text(
                                    'Link LIPASS',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  // Image(
                                  //   image: AssetImage('images/gift.png'),
                                  //   width: 24,
                                  //   height: 24,
                                  // ),
                                ],
                              ),
                              minTileHeight: 26,
                              minVerticalPadding: 0,
                              trailing: const Icon(Icons.arrow_forward_ios,
                                  color: Color(0xFF929292), size: 16),
                              onTap: viewModel.onTapLinkPass),
                        ),
                        Divider(
                          color: const Color(0x8FD9D9D9),
                          indent: 14,
                          endIndent: 14,
                          height: 24,
                        ),
                      ],
                    )
                  : const SizedBox(),
              buildListTile('Link Third-party', true, context, viewModel),
              Divider(
                color: const Color(0x8FD9D9D9),
                indent: 14,
                endIndent: 14,
                height: 24,
              ),
              buildListTile('Account Details', false, context, viewModel),
              Divider(
                color: const Color(0x8FD9D9D9),
                indent: 14,
                endIndent: 14,
                height: 24,
              ),
              buildListTile('Switch Account', false, context, viewModel),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSecurityBox(
      BuildContext context, PeronalCenterViewModel viewModel) {
    return Column(
      children: [
        SizedBox(
          height: 26,
          child: Row(
            children: [
              SizedBox(
                width: 32,
              ),
              Text(
                'Security',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF898A8D)),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 136,
          width: 343,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xFFF5F5F5),
          ),
          child: Column(
            children: [
              SizedBox(height: 12),
              buildSwitchListTile(viewModel, 'Two-Factor Authentication',
                  viewModel.switch2FA, viewModel.on2FAChanged,
                  subtitle:
                      'Enable the function, and new devices can only log in after email verification.'),
              Divider(
                color: const Color(0x8FD9D9D9),
                indent: 14,
                endIndent: 14,
                height: 24,
              ),
              buildListTile('Device Login History', true, context, viewModel),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSettingBox(
      BuildContext context, PeronalCenterViewModel viewModel) {
    return Column(
      children: [
        SizedBox(
          height: 24,
          child: Row(
            children: [
              SizedBox(
                width: 32,
              ),
              Text(
                'Setting',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF898A8D)),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 96,
          width: 343,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xFFF5F5F5),
          ),
          child: Column(
            children: [
              SizedBox(height: 12),
              SizedBox(
                height: 24,
                child: ListTile(
                  title: Text(
                    'Language',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  minTileHeight: 26,
                  minVerticalPadding: 0,
                  trailing: Text(
                    'English',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF695DF0),
                    ),
                  ),
                ),
              ),
              Divider(
                color: const Color(0x8FD9D9D9),
                indent: 14,
                endIndent: 14,
                height: 24,
              ),
              buildSwitchListTile(
                  viewModel,
                  'Push Notification',
                  viewModel.switchNotification,
                  viewModel.onNotificationChanged),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildListTile(String title, bool withIcon, BuildContext context,
      PeronalCenterViewModel viewModel) {
    return SizedBox(
      height: 24,
      child: ListTile(
          title: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          minTileHeight: 26,
          minVerticalPadding: 0,
          trailing: withIcon
              ? const Icon(Icons.arrow_forward_ios,
                  color: Color(0xFF929292), size: 16)
              : null,
          onTap: () {
            viewModel.onTapPersonalInformation(context);
          }),
    );
  }

  Widget _buildAboutBox(
      BuildContext context, PeronalCenterViewModel viewModel) {
    return Column(
      children: [
        SizedBox(
          height: 24,
          child: Row(
            children: [
              SizedBox(
                width: 32,
              ),
              Text(
                'About',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF898A8D)),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 144,
          width: 343,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xFFF5F5F5),
          ),
          child: Column(
            children: [
              SizedBox(height: 12),
              buildListTile('Privacy & Terms', true, context, viewModel),
              Divider(
                color: const Color(0x8FD9D9D9),
                indent: 14,
                endIndent: 14,
                height: 24,
              ),
              buildListTile('Customer Feedback', true, context, viewModel),
              Divider(
                color: const Color(0x8FD9D9D9),
                indent: 14,
                endIndent: 14,
                height: 24,
              ),
              buildListTile('Help Center', true, context, viewModel),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildSwitchListTile(
    PeronalCenterViewModel viewModel,
    String title,
    bool switchValue,
    Function(bool) onChanged, {
    String? subtitle,
  }) {
    return SizedBox(
      height: subtitle == null ? 24 : 64,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        subtitle: subtitle == null
            ? null
            : Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF666666),
                ),
              ),
        minTileHeight: 24,
        minVerticalPadding: 0,
        minLeadingWidth: 24,
        horizontalTitleGap: 0,
        titleAlignment: ListTileTitleAlignment.top,
        contentPadding: EdgeInsets.fromLTRB(16, 0, 16, 0),
        trailing: Switch(
          value: switchValue,
          onChanged: onChanged,
          activeColor: const Color(0xFF695DF0),
          activeTrackColor: const Color(0xFF7064FF),
          inactiveTrackColor: const Color(0xFFDCDCDC),
          thumbColor: WidgetStateProperty.all(Colors.white),
          trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
        ),
      ),
    );
  }

  Widget _buildLogoutBox(PeronalCenterViewModel viewModel) {
    return InkWell(
      onTap: () {
        viewModel.onTapLogout();
      },
      child: Container(
        width: 343,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xFFF5F5F5),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image(
            //   image: const AssetImage('images/logout.png'),
            //   width: 24,
            //   height: 24,
            // ),
            // SizedBox(width: 8),
            Text(
              'Log Out',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }

  // void setShowInput(PeronalCenterViewModel viewModel, bool isShow) {
  //   viewModel.panelBaseService.isDraggable = !isShow;
  //   viewModel.isShowTextField = isShow;
  //   //if (mounted) setState(() {});
  // }

  @override
  PeronalCenterViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PeronalCenterViewModel();
}
