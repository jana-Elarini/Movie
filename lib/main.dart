import 'package:flutter/material.dart';
import 'package:moviedetails/HomeWidget/Home_screen.dart';
import 'package:moviedetails/MyTheme/myTheme.dart';
import 'package:moviedetails/browse/browseWidget.dart';
import 'package:moviedetails/browse/movieCategoryItem.dart';

import 'HomeScreenDetail/MovieDetailScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        BrowseWidget.routeName: (context) => BrowseWidget(),
        MovieCategoryItem.routeName: (context) => MovieCategoryItem(),
        MovieDetailsScreen.routeName: (context) => MovieDetailsScreen(),
      },
      debugShowCheckedModeBanner: false,
      theme: MyTheme.AppTheme,
    );
  }
}