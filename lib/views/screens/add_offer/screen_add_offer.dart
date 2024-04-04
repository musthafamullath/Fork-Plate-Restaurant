import 'dart:developer';
import 'dart:io';


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie_fly_restaurant/controllers/blocs/category/category_bloc.dart';
import 'package:foodie_fly_restaurant/controllers/blocs/offer/offer_bloc.dart';
import 'package:foodie_fly_restaurant/models/offer.dart';
import 'package:foodie_fly_restaurant/utils/constants.dart';
import 'package:foodie_fly_restaurant/views/screens/add_dishes/widgets/pick_image.dart';
import 'package:foodie_fly_restaurant/views/widgets/class_widgets/app_bar_widget.dart';
import 'package:foodie_fly_restaurant/views/widgets/class_widgets/button_widget.dart';
import 'package:foodie_fly_restaurant/views/widgets/class_widgets/text_field_widget.dart';
import 'package:foodie_fly_restaurant/views/widgets/function_widgets/snackbar_function.dart';

import 'package:image_picker/image_picker.dart';



class ScreenAddOffer extends StatelessWidget {
  ScreenAddOffer({super.key});
  final formkey = GlobalKey<FormState>();
  final offerController = TextEditingController();
  final offerPerController = TextEditingController();
  int categoryId = 0;
  XFile? imagePath;
  String image = '';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBarWidget(title: 'Add New Offer'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                InkWell(
                  onTap: () async {
                    imagePath = await showBottomSheetWidget(context);
                    if (imagePath != null) {
                      image = imagePath!.path;
                      print(image);
                    }
                  },
                  child: Container(
                    width: width,
                    height: height * .25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: .5),
                    ),
                    child: image != ''
                        ? Image.file(File(image))
                        : const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add_a_photo, size: 30),
                              Text('Add Banner')
                            ],
                          ),
                  ),
                ),
                kHight10,
                TextFieldWidget(
                  userController: offerController,
                  label: 'Offer Name: ',
                  inputType: TextInputType.name,
                  obscureText: false,
                  validator: (value) {
                    if (value!.isEmpty) return 'Add offer name';
                    return null;
                  },
                ),
                kHight10,
                BlocBuilder<CategoryBloc, CategoryState>(
                  builder: (context, state) {
                    return DropdownButtonFormField(
                      validator: (value) {
                        if (value == null) {
                          return "Choose category";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          label: Text(state.categories[0].name),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      items: state.categories.map((cat) {
                        return DropdownMenuItem(
                          value: cat,
                          child: Text(cat.name),
                        );
                      }).toList(),
                      onChanged: (value) async {
                        categoryId = value!.id;
                        log(categoryId.toString());
                      },
                    );
                  },
                ),
                kHight10,
                TextFieldWidget(
                  userController: offerPerController,
                  label: 'Offer percentage: ',
                  inputType: TextInputType.number,
                  obscureText: false,
                  validator: (value) {
                    if (value!.isEmpty) return 'Add offer percentage';
                    return null;
                  },
                ),
                kHight10,
                ButtonWidget(
                  width: width,
                  text: 'Add offer',
                  onPressed: () async {
                    if (formkey.currentState!.validate()) {
                      if (image == '') {
                        showSnack(context, red, 'Add Banner');
                      } else {
                        MultipartFile imageFile =
                            await MultipartFile.fromFile(image);
                        final offer = OfferRequest(
                          image: imageFile,
                          categoryId: categoryId,
                          offerTitle: offerController.text,
                          offerPercentage: int.parse(offerController.text),
                          status: 'ACTIVE',
                        );
                        context.read<OfferBloc>().add(AddOfferEvent(offerRequest: offer,));
                      }
                    }
                  },
                  height: height,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
