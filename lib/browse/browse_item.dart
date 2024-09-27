import 'package:flutter/material.dart';

import 'package:moviedetails/browse/movieCategoryItem.dart';
import 'package:moviedetails/response/genres_response.dart';

final Map<int, String> genreImages = {
  28: 'assets/images/action.jpg',
  12: 'assets/images/adventure.jpg',
  16: 'assets/images/animation.jpg',
  35: 'assets/images/comedy.jpg',
  80: 'assets/images/crime.jpg',
  99: 'assets/images/documentary.jpg',
  18: 'assets/images/drama.jpg',
  10751: 'assets/images/family.jpg',
  14: 'assets/images/fantasy.jpg',
  36: 'assets/images/history.jpg',
  27: 'assets/images/horror.jpg',
  10402: 'assets/images/music.jpg',
  9648: 'assets/images/mystery.jpg',
  10749: 'assets/images/romance.jpg',
  878: 'assets/images/sci-fi.jpg',
  10770: 'assets/images/tv.jpg',
  53: 'assets/images/thriller.jpg',
  10752: 'assets/images/war.jpg',
  37: 'assets/images/western.jpg',
};

class BrowseItem extends StatelessWidget {
  final Genres genre;

  BrowseItem({required this.genre});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        if (genre != null) {
          Navigator.pushNamed(context, MovieCategoryItem.routeName,
              arguments: genre);
        } else {
          print("Genre is null, cannot navigate.");
        }
      },
      child: Container(
        // Wrapping Column with Container to ensure proper tap recognition
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                genreImages[genre.id] ?? 'lib/images/movies.png',
                width: screenSize.width * .40,
                height: screenSize.height * .18,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 8),
            Text(
              genre.name ?? "Unknown Genre",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
