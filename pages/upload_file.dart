import 'dart:io';

import 'package:crud/db.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageToFirebase extends StatefulWidget {
  const UploadImageToFirebase({super.key});

  @override
  State<UploadImageToFirebase> createState() => _UploadImageToFirebaseState();
}

class _UploadImageToFirebaseState extends State<UploadImageToFirebase> {
  //use the commented lines if you are building a website

  // String _imageFile = '';
  // Uint8List? selectedImageInBytes;
  XFile? selectedImage;
  Db db = Db();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload Image"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (selectedImage != null) Image.file(File(selectedImage!.path)),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _pickImage();
                },
                child: const Text('Pick Image'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () async {
                    String url = await db.uploadImage(
                        file: selectedImage!,
                        folderName: "Images",
                        fileName: "Image Name");

                  },
                  child: const Text('Upload Image To Firebase Storage')),
            ],
          ),
        ),
      ),
    );
  }

// Method to pick image in flutter
  Future<void> _pickImage() async {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        selectedImage = image;
      });
    }
  }

  // // Method to pick image in flutter web
  // Future<void> pickImage() async {
  //   try {
  //     // Pick image using file_picker package
  //     FilePickerResult? fileResult = await FilePicker.platform.pickFiles(
  //       type: FileType.image,
  //     );

  //     // If user picks an image, save selected image to variable
  //     if (fileResult != null) {
  //       setState(() {
  //         _imageFile = fileResult.files.first.name;
  //         selectedImageInBytes = fileResult.files.first.bytes;
  //       });
  //     }
  //   } catch (e) {
  //     // If an error occured, show SnackBar with error message
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text("Error:$e")));
  //   }
  // }
}
