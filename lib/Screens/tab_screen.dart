import 'package:coin_identification/Screens/tabbar%20screens/Collection/collection.dart';
import 'package:coin_identification/Screens/tabbar%20screens/artical%20detail/articles.dart';
import 'package:coin_identification/Screens/tabbar%20screens/coin%20detail/coins.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> with TickerProviderStateMixin {
  late TabController tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _selectedIndex == 0 ? "Explore Coins" : "Collections",
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        toolbarHeight: 56.h,
      ),
      body: Column(
        children: [
          _selectedIndex == 0
              ? Container(
                  color: Colors.transparent,
                  child: TabBar(
                    controller: tabController,
                    tabs: [
                      Tab(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: tabController.index == 0
                                ? Theme.of(context).colorScheme.primary
                                : Colors.grey[300],
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.zero,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Coins",
                              style: TextStyle(
                                color: tabController.index == 0
                                    ? Theme.of(context).colorScheme.onPrimary
                                    : Theme.of(context).colorScheme.onSurface,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: tabController.index == 1
                                ? Theme.of(context).colorScheme.primary
                                : Colors.grey[300],
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.zero,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Articles",
                              style: TextStyle(
                                color: tabController.index == 1
                                    ? Theme.of(context).colorScheme.onPrimary
                                    : Theme.of(context).colorScheme.onSurface,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                    labelPadding: EdgeInsets.zero,
                    indicatorColor: Colors.transparent,
                    dividerColor: Colors.transparent,
                  ),
                )
              : const SizedBox.shrink(),
          Expanded(
            child: _selectedIndex == 0
                ? TabBarView(
                    controller: tabController,
                    children: const [
                      Coins(),
                      Articles(),
                    ],
                  )
                : const Collection(),
          ),
        ],
      ),
      bottomNavigationBar: GNav(
        gap: 8, // Adjust space between icons
        backgroundColor: Theme.of(context).colorScheme.primary,
        color: Theme.of(context).colorScheme.onBackground,
        activeColor: Theme.of(context).colorScheme.onPrimary,
        iconSize: 24.sp,
        padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 20.h),
        onTabChange: (index) {
          _onItemTapped(index);
        },
        tabs:  const [
          GButton(
            icon: Icons.explore_outlined,
            text: 'Explore Coins & Article',
          ),
          GButton(
            icon: Icons.add,
            text: 'Collections',
          ),
        ],
      ),
    );
  }
}
