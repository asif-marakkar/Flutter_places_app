import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:places_app/models/place.dart';
import 'package:places_app/providers/places_provider.dart';
import 'package:places_app/widgets/image_input.dart';
import 'package:places_app/widgets/location_input.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File? _pickedImage;
  PlaceLocation? _pickedLocation;

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
  }

  void _savePlace() {
    final enteredText = _titleController.text.trim();
    if (enteredText.isEmpty ||
        _pickedImage == null ||
        _pickedLocation == null) {
      return;
    }
    ref.read(placesProvider.notifier).addPlace(
          enteredText,
          _pickedImage!,
          _pickedLocation!,
        );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new place'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              autocorrect: false,
              decoration: const InputDecoration(
                label: Text('Title'),
              ),
              controller: _titleController,
              style: TextStyle(color: colorScheme.onBackground),
            ),
            const SizedBox(
              height: 16,
            ),
            ImageInput(
              onPick: (image) => _pickedImage = image,
            ),
            const SizedBox(
              height: 16,
            ),
            LocationInput(
              onPick: (location) => _pickedLocation = location,
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton.icon(
              onPressed: _savePlace,
              icon: const Icon(Icons.add),
              label: const Text('Add Place'),
            ),
          ],
        ),
      ),
    );
  }
}
