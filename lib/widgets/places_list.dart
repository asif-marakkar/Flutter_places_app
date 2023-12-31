import 'package:flutter/material.dart';
import 'package:places_app/models/place.dart';
import 'package:places_app/screens/places_detail.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.places});

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    if (places.isEmpty) {
      return Center(
        child: Text(
          'No places added yet.',
          style: textTheme.titleMedium!.copyWith(
            color: colorScheme.onBackground,
          ),
        ),
      );
    }
    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (cxt, index) => ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: FileImage(places[index].image),
        ),
        title: Text(
          places[index].title,
          style: textTheme.titleMedium!.copyWith(
            color: colorScheme.onBackground,
          ),
        ),
        subtitle: Text(
          places[index].location.address,
          style: textTheme.bodySmall!.copyWith(
            color: colorScheme.onBackground,
          ),
        ),
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (cxt) => PlacesDetailScreen(
              place: places[index],
            ),
          ),
        ),
      ),
    );
  }
}
