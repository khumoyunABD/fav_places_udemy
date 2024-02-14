import 'package:fav_places_udemy/models/place.dart';
import 'package:fav_places_udemy/screens/place_detail.dart';
import 'package:fav_places_udemy/widgets/place_item.dart';

import 'package:flutter/material.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.places});

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    void selectPlace(BuildContext context, Place place) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (ctx) => PlaceDetailScreen(place: place)));
    }

    if (places.isEmpty) {
      return Center(
        child: Text(
          'No places added yet',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      );
    }

    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (ctx, index) => PlaceItem(
        myPlace: places[index],
        onSelectPlace: (myPlace) {
          selectPlace(context, myPlace);
        },
      ),
    );
  }
}
