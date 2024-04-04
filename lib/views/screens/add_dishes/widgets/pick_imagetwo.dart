import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImageBottomSheet extends StatefulWidget {
  const PickImageBottomSheet({super.key});

  @override
  State<PickImageBottomSheet> createState() => _PickImageBottomSheetState();
}


class _PickImageBottomSheetState extends State<PickImageBottomSheet> {
  String? _profilePicturePath;
  XFile? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet:   Container(
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              width: .4,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Select the image source:',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton.icon(
                    onPressed: () async {
                      XFile? img = await ImagePicker()
                          .pickImage(source: ImageSource.camera);
                      setState(() {
                        image = img;
                      });
                      _profilePicturePath = image!.path;
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.camera,
                    ),
                    label: const Text(
                      'Camera',
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () async {
                      XFile? img = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      setState(() {
                        image = img;
                      });
                      _profilePicturePath = image!.path;
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.image,
                    ),
                    label: const Text(
                      'Gallery',
                    ),
                  ),
                ],
              )
            ],
          ),
        )
    );
 
  }
}