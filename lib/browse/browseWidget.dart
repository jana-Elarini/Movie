import 'package:flutter/material.dart';
import 'package:moviedetails/MyTheme/myTheme.dart';
import 'package:moviedetails/api/api.manger.dart';
import 'package:moviedetails/browse/browse_item.dart';
import 'package:moviedetails/response/genres_response.dart';

class BrowseWidget extends StatefulWidget {
  static const String routeName = 'BrowseScreen';

  @override
  State<BrowseWidget> createState() => _BrowseWidgetState();
}

class _BrowseWidgetState extends State<BrowseWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Text(
                "Browse Categories",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: FutureBuilder<GenresResponse>(
                future: ApiManager.getCategoryResponse(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child:
                          CircularProgressIndicator(color: MyTheme.yellowColor),
                    );
                  } else if (snapshot.hasError) {
                    print(snapshot.error);
                    return Center(
                      child: IconButton(
                        onPressed: () {
                          setState(() {});
                        },
                        icon: Icon(Icons.error),
                        color: MyTheme.redColor,
                      ),
                    );
                  }

                  final genres = snapshot.data?.genres ?? [];
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemBuilder: (context, index) {
                      return BrowseItem(genre: genres[index]);
                    },
                    itemCount: genres.length,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
