import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:places_app/models/place.dart';
import 'dart:io';

class PlacesNotifier extends StateNotifier<List<Place>> {
  PlacesNotifier() : super(const []);

  void addPlace(String title, File image, PlaceLocation location) {
    state = [Place(title: title, image: image, location: location), ...state];
  }
}

final placesProvider = StateNotifierProvider<PlacesNotifier, List<Place>>(
  (ref) => PlacesNotifier(),
);
