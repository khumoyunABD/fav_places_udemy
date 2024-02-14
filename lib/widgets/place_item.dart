import 'package:fav_places_udemy/models/place.dart';
import 'package:flutter/material.dart';

class PlaceItem extends StatelessWidget {
  const PlaceItem({
    super.key,
    required this.myPlace,
    required this.onSelectPlace,
  });

  final Place myPlace;
  final void Function(Place place) onSelectPlace;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: CircleAvatar(
          radius: 22,
          backgroundImage: FileImage(myPlace.image),
        ),
        title: Text(
          myPlace.title,
          style: const TextStyle(fontSize: 20),
        ),
        subtitle: Text(
          myPlace.location.address,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
        onTap: () {
          onSelectPlace(myPlace);
        },
      ),
    );
  }
}
