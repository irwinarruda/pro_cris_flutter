// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:pro_cris_flutter/components/atoms/dismiss_keyboard.dart';

import 'package:pro_cris_flutter/components/atoms/pro_cris_logo.dart';

import 'package:pro_cris_flutter/styles/pro_cris_colors.dart';
import 'package:pro_cris_flutter/styles/pro_cris_font_sizes.dart';

class ProCrisTab {
  ProCrisTab({required this.title, required this.body, this.icon});
  String title;
  Widget? icon;
  Widget body;
}

class ProCrisMenuItem {
  ProCrisMenuItem({required this.title, required this.onPressed, this.icon});
  String title;
  Widget? icon;
  void Function() onPressed;
}

class ProCrisTabBar extends StatelessWidget {
  ProCrisTabBar({
    super.key,
    required this.tabs,
    required this.height,
  });
  double height;
  List<ProCrisTab> tabs;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ProCrisColors.purple[300],
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: ProCrisColors.purple[100]!,
              width: 2,
            ),
          ),
        ),
        child: TabBar(
          indicatorColor: ProCrisColors.gold[400],
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 3,
          labelPadding: EdgeInsets.only(bottom: 0, top: 0),
          tabs: [
            for (var index = 0; index < tabs.length; index++) ...[
              Tab(
                height: height,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (index != 0) ...[
                      Expanded(
                        flex: 0,
                        child: VerticalDivider(
                          width: 1,
                          thickness: 1,
                          color: ProCrisColors.purple[100],
                        ),
                      ),
                    ],
                    Expanded(
                      flex: 4,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            tabs[index].icon ?? SizedBox(),
                            Text(
                              tabs[index].title,
                              style: TextStyle(
                                fontSize: ProCrisFontSizes.fontXs,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (index != tabs.length - 1) ...[
                      Expanded(
                        flex: 0,
                        child: VerticalDivider(
                          width: 1,
                          thickness: 1,
                          color: ProCrisColors.purple[100],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class ProCrisTabsScaffold extends StatelessWidget {
  ProCrisTabsScaffold({super.key, required this.tabs, required this.menuItems});
  List<ProCrisTab> tabs;
  List<ProCrisMenuItem> menuItems;
  final double tabHeight = 42.0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: DismissKeyboard(
        child: Scaffold(
          appBar: AppBar(
            elevation: 2,
            automaticallyImplyLeading: false,
            toolbarHeight: 62,
            title: ProCrisLogo(height: 26),
            actions: [
              PopupMenuButton(
                icon: Icon(Icons.more_vert, size: 28),
                tooltip: 'Abrir Menu',
                splashRadius: 20,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                  side: BorderSide(color: ProCrisColors.gold, width: 2),
                ),
                onSelected: (int item) {
                  menuItems[item].onPressed();
                },
                itemBuilder: (context) => [
                  for (var index = 0; index < menuItems.length; index++) ...[
                    PopupMenuItem<int>(
                      height: 28,
                      value: index,
                      child: Text(
                        menuItems[index].title,
                        style: TextStyle(fontSize: ProCrisFontSizes.fontSm),
                      ),
                    )
                  ]
                ],
              ),
              SizedBox(
                width: 2,
              )
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(tabHeight),
              child: ProCrisTabBar(
                height: tabHeight,
                tabs: tabs,
              ),
            ),
          ),
          body: TabBarView(
            children: [
              for (var tab in tabs) ...[tab.body],
            ],
          ),
        ),
      ),
    );
  }
}
