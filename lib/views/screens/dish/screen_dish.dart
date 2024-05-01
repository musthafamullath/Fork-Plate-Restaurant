import 'package:flutter/material.dart';
import 'package:foodie_fly_restaurant/models/dish.dart';
import 'package:foodie_fly_restaurant/utils/constants.dart';
import 'package:foodie_fly_restaurant/utils/text_styles.dart';
import 'package:foodie_fly_restaurant/views/widgets/class_widgets/app_bar_widget.dart';
import 'package:foodie_fly_restaurant/views/widgets/class_widgets/section_head.dart';

class ScreenDish extends StatelessWidget {
  const ScreenDish({super.key, required this.dish});
  final DishModel? dish;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppBarWidget(title: dish!.name!,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(5),
            color: Colors.orange[50],
            child: Column(
              children: [
                kHight20,
                Container(
                  width: width,
                  height: height * .25,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: dish!.image == ''
                            ? const AssetImage('assets/images/categories/dish.jpg')
                                as ImageProvider
                            : NetworkImage(dish!.image!.toString()),
                        fit: BoxFit.cover),
                  ),
                ),
                kHight10,
                Container(
                  width: width,
                  height: height ,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                       const Text("Dish Details",style: bigBoldBlack,textAlign: TextAlign.center,),
                        divider5,
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                               const Spacer(),
                                SectionHead(heading: "Name: ", values: dish!.name!,),
                                const Spacer(),
                                SectionHead(heading: "Discription: ", values: dish!.description!,),
                                const Spacer(),
                                SectionHead(heading: 'Price ₹:  ', values: dish!.price.toString(),),
                                const Spacer(),
                                SectionHead(heading: 'Quantity: ', values: dish!.quantity.toString(),),
                                const Spacer(),
                                SectionHead(heading: 'Veg: ', values: dish!.isVeg.toString(),),
                                const Spacer(),
                                SectionHead(heading: 'Availability: ', values: dish!.isAvailable.toString(),),
                                const Spacer(),
                                SectionHead(heading: "Seller d: ", values: dish!.sellerId.toString(),),
                                const Spacer(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}