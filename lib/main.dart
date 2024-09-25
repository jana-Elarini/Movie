import 'package:flutter/material.dart';
import 'package:moviedetails/HomeScreenDetail/MovieDetailScreen.dart';

import 'HomeWidget/Home_screen.dart';
import 'MyTheme/myTheme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeScreen.routeName,
      routes: {
        // Define your routes here if needed
        HomeScreen.routeName: (context) => HomeScreen(),
        MovieDetailsScreen.routeName: (context) => MovieDetailsScreen()
      },
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
    );
  }
}
