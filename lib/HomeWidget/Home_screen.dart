import 'package:flutter/material.dart';

import 'bottom_navy_bar.dart';
import 'browseWidget.dart';
import 'homeWidget.dart';
import 'search.dart';
import 'watchList.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_Screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const String routeName = 'home_screen';

  int selectedIndex = 0;

  List<Widget> homeBody = [
    HomeWidget(),
    SearchWidget(),
    BrowseWidget(),
    WatchListWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        selectedIndex: selectedIndex,
        onItemTapped: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      body: homeBody[selectedIndex],
    );
  }
}
