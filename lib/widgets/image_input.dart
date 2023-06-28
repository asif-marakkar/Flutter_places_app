import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key, required this.onPick});

  final Function(File image) onPick;

  @override
  State<StatefulWidget> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _pickedImage;

  void _takePicture() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery, maxWidth: 600);
    if (pickedImage == null) {
      return;
    }
    setState(() {
      _pickedImage = File(pickedImage.path);
    });
    widget.onPick(_pickedImage!);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
      onPressed: _takePicture,
      icon: const Icon(Icons.camera),
      label: const Text('Take picture'),
    );
    if (_pickedImage != null) {
      content = GestureDetector(
        onTap: _takePicture,
        child: Image.file(
          _pickedImage!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      );
    }
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        ),
      ),
      width: double.infinity,
      height: 250,
      child: content,
    );
  }
}
