import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:panel/ui/views/personal_center/personal_center_view.dart';
import 'package:stacked/stacked.dart';
import 'package:panel/ui/common/app_colors.dart';
import 'package:panel/ui/common/ui_helpers.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(title: Text("aaa")),
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Stack(
                children: [
                  FloatingActionButton(
                      key: UniqueKey(),
                      onPressed: () => viewModel.onTapButton(context)),
                  Positioned(
                    left: 100,
                    top: 30,
                    child: InkWell(
                      key: UniqueKey(),
                      child: Container(
                        width: 30,
                        height: 30,
                        color: Colors.blue,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          //CupertinoPageRoute风格
                          CupertinoPageRoute(
                            builder: (context) {
                              return const PeronalCenterView();
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        verticalSpaceLarge,
                        Column(
                          children: [
                            const Text(
                              'Hello, STACKED!',
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            verticalSpaceMedium,
                            MaterialButton(
                              color: Colors.black,
                              onPressed: viewModel.incrementCounter,
                              child: Text(
                                viewModel.counterLabel,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MaterialButton(
                              color: kcDarkGreyColor,
                              //onPressed: viewModel.showDialog,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  //CupertinoPageRoute风格
                                  CupertinoPageRoute(
                                    builder: (context) {
                                      return const HomeView();
                                    },
                                  ),
                                );
                              },

                              child: const Text(
                                'Show Dialog',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            MaterialButton(
                              color: kcDarkGreyColor,
                              onPressed: viewModel.showBottomSheet,
                              child: const Text(
                                'Show Bottom Sheet',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    // appBar: AppBar(
    //   title: Text("Flutter App"),
    // ),

    //   drawer: Drawer(
    //       child: Column(
    //     children: <Widget>[
    //       DrawerHeader(
    //         decoration: BoxDecoration(
    //             color: Colors.yellow,
    //             image: DecorationImage(
    //                 image: NetworkImage(
    //                     "https://www.itying.com/images/flutter/2.png"),
    //                 fit: BoxFit.cover)),
    //         child: ListView(
    //           children: <Widget>[Text('我是一个头部')],
    //         ),
    //       ),
    //       ListTile(
    //         title: Text("个人中心"),
    //         leading: CircleAvatar(child: Icon(Icons.people)),
    //       ),
    //       Divider(),
    //       ListTile(
    //         title: Text("系统设置"),
    //         leading: CircleAvatar(child: Icon(Icons.settings)),
    //       )
    //     ],
    //   )),
    //   endDrawer: Drawer(
    //       child: Column(
    //     children: <Widget>[
    //       UserAccountsDrawerHeader(
    //         accountName: Text("大地老师"),
    //         accountEmail: Text("dadi@itying.com"),
    //         currentAccountPicture: CircleAvatar(
    //           backgroundImage:
    //               NetworkImage("https://www.itying.com/images/flutter/3.png"),
    //         ),
    //         decoration: BoxDecoration(
    //             color: Colors.yellow,
    //             image: DecorationImage(
    //                 image: NetworkImage(
    //                     "https://www.itying.com/images/flutter/2.png"),
    //                 fit: BoxFit.cover)),
    //         otherAccountsPictures: <Widget>[
    //           Image.network("https://www.itying.com/images/flutter/4.png"),
    //           Image.network("https://www.itying.com/images/flutter/5.png"),
    //           Image.network("https://www.itying.com/images/flutter/6.png")
    //         ],
    //       ),
    //       ListTile(
    //           title: Text("个人中心"),
    //           leading: CircleAvatar(child: Icon(Icons.people)),
    //           onTap: () {
    //             //Navigator.of(context).pop();
    //             Navigator.push(
    //               context,
    //               //CupertinoPageRoute风格
    //               CupertinoPageRoute(
    //                 builder: (context) {
    //                   return const PeronalCenterView();
    //                 },
    //               ),
    //             );
    //           }),
    //       Divider(),
    //       ListTile(
    //         title: Text("系统设置"),
    //         leading: CircleAvatar(child: Icon(Icons.settings)),
    //       )
    //     ],
    //   )),
    // );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
