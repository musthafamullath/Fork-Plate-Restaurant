import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodie_fly_restaurant/utils/constants.dart';
import 'package:foodie_fly_restaurant/utils/text_styles.dart';
import 'package:foodie_fly_restaurant/views/screens/add_dishes/widgets/from_camera.dart';
import 'package:foodie_fly_restaurant/views/screens/add_dishes/widgets/from_gallery.dart';
import 'package:image_picker/image_picker.dart';

Future<XFile> showBottomSheetWidget(BuildContext context) async {
  final completer = Completer<XFile>();
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 1.5/10,
          width: double.infinity,
          
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.orange[50]
              ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Text(
                'Select the image source:',
                style: TextStyle(fontSize: 20, color: Colors.orange[700]),
              ),
              divider2,
              kHight20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton.icon(
                    onPressed: () async {
                      XFile imagePath = await fromCamera();
                      completer.complete(imagePath);
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.camera,
                      color: orange,
                    ),
                    label:  Text(
                      'Camera',style: boldOrange,
                    ),
                  ),
                  
                  TextButton.icon(
                    
                    onPressed: () async {
                      XFile imagePath = await fromGallery();
                      completer.complete(imagePath);

                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.image,
                      color: orange,
                    ),
                    label:  Text(
                      'Gallery',style: boldOrange,
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      });
  return completer.future;
}
