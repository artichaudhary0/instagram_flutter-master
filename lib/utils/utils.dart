import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

pickedImage({required ImageSource imageSource}) async {
  ImagePicker _picker = ImagePicker();

  final XFile? picked = await _picker.pickImage(
    source: imageSource,
  );
  if (picked != null) {
    return await picked.readAsBytes();
  } else {
    print("No image is selected");
  }
}

showSnackBar({required BuildContext context, required String content}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}
