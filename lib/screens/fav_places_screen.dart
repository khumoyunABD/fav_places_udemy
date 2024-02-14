import 'package:fav_places_udemy/models/place.dart';
import 'package:fav_places_udemy/screens/place_detail.dart';
import 'package:fav_places_udemy/widgets/place_item.dart';
import 'package:flutter/material.dart';

class FavPlacesScreen extends StatelessWidget {
  const FavPlacesScreen({
    super.key,
    required this.places,
    this.title,
  });

  final String? title;
  final List<Place> places;

  void selectPlace(BuildContext context, Place place) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => PlaceDetailScreen(
              place: place,
            )));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh oh ... nothing here!',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            'Try selecting a different place!',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ],
      ),
    );

    if (places.isNotEmpty) {
      content = ListView.builder(
        itemCount: places.length,
        itemBuilder: (ctx, index) => PlaceItem(
          myPlace: places[index],
          onSelectPlace: (place) {
            selectPlace(context, place);
          },
        ),
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
