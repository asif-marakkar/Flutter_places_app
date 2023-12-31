import 'package:flutter/material.dart';
import 'package:places_app/models/place.dart';

class PlacesDetailScreen extends StatelessWidget {
  const PlacesDetailScreen({super.key, required this.place});

  final Place place;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
      ),
      body: Stack(
        children: [
          Image.file(
            place.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                const CircleAvatar(),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    place.location.address,
                    textAlign: TextAlign.center,
                    style: textTheme.titleLarge!.copyWith(
                      color: colorScheme.onBackground,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
