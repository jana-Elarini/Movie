import 'package:flutter/material.dart';

import '../model/category.dart';
import 'More.dart';
import 'MovieDetails.dart';
import 'MovieName.dart';
import 'Rating.dart';


class MovieDetailsScreen extends StatelessWidget {
  // Step 1: Add a static constant for the route name
  static const String routeName = 'movie-details';

  // Movie object passed to this screen

  // Constructor to accept the Movie object


  @override
  Widget build(BuildContext context) {
    var args = ModalRoute
        .of(context)
        ?.settings
        .arguments as Movie;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title ?? 'Movie Details'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MoviePoster(),
            MovieDetails(),
            MovieRating(),
            MoreLikeThis(),
          ],
        ),
      ),
    );
  }
}
