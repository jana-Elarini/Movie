import 'package:flutter/material.dart';
import 'package:moviedetails/HomeWidget/popularSlider.dart';

import '../api/api.manger.dart';
import '../model/category.dart';
import 'newRelaeseDart.dart';
import 'recommende.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late Future<List<Movie>> popularMovies; // Declare it here

  @override
  void initState() {
    super.initState(); // Call the superclass's initState
    popularMovies = ApiManager.getPopularMovies(); // Initialize the future
    // topRatedMovies = Api().getTopRatedMovies();
    // upcomingMovies = Api().getUpcomingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(5),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: const [
            PopularSlider(),
            SizedBox(height: 5),
            NewRelease(),
            Recommended(),
          ],
        ),
      ),
    );
  }
}
