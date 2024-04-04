import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie_fly_restaurant/controllers/blocs/category/category_bloc.dart';
import 'package:foodie_fly_restaurant/controllers/blocs/offer/offer_bloc.dart';
import 'package:foodie_fly_restaurant/models/category.dart';
import 'package:foodie_fly_restaurant/utils/constants.dart';
import 'package:foodie_fly_restaurant/utils/text_styles.dart';
import 'package:foodie_fly_restaurant/views/screens/add_offer/screen_add_offer.dart';
import 'package:foodie_fly_restaurant/views/screens/home/widgets/floating_action_btn.dart';
import 'package:foodie_fly_restaurant/views/widgets/class_widgets/app_bar_widget.dart';
import 'package:foodie_fly_restaurant/views/widgets/class_widgets/section_head.dart';
import 'package:dio/dio.dart';

class ScreenOffers extends StatelessWidget {
  const ScreenOffers({super.key, this.categories});
  final Category? categories;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    context.read<CategoryBloc>().add(CategoryEvent());
    context.read<OfferBloc>().add(GetOffersEvent(categoryId: categories!.id));
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBarWidget(title: "Offers"),
      ),
      body: BlocBuilder<OfferBloc, OfferState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: state.offers.isEmpty
                ? Center(
                    child: Text.rich(TextSpan(children: [
                      const TextSpan(text: 'The Category: ', style: boldBlack),
                      TextSpan(text: categories!.name, style: boldOrangeGrey),
                      const TextSpan(text: ' is Empty', style: boldBlack),
                    ])),
                  )
                : ListView.builder(
                    itemCount: state.offers.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: <Widget>[
                          Container(
                            width: width,
                            height: height * .25,
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: orangePointShade800),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Image.asset(
                                  'assets/icons/box.png',
                                  height: height * .1,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Row(
                                      children: [
                                        Text(state.offers[index].offerTitle!),
                                        BlocBuilder<CategoryBloc,
                                            CategoryState>(
                                          builder: (context, state) {
                                            return Text(
                                                state.categories[index].name);
                                          },
                                        ),
                                      ],
                                    ),
                                    SectionHead(
                                        heading: 'Started',
                                        values: state.offers[index].startDate!
                                            .substring(0, 10)),
                                    SectionHead(
                                        heading: 'will End',
                                        values: state.offers[index].endDate!
                                            .substring(0, 10)),
                                    SectionHead(
                                        heading: 'Status',
                                        values: state.offers[index].status!
                                            .substring(0, 10)),
                                  ],
                                ),
                                CircleAvatar(
                                  radius: 40,
                                  backgroundColor: orange,
                                  child: Text(
                                    '${state.offers[index].offerPercentage} %',
                                    style: boldWhite,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      );
                    },
                  ),
          );
        },
      ),
      floatingActionButton: FloatingActionBTN(
        icon: Icons.add ,
        string: 'Add Offer',
        onPressed: (){
            Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>  ScreenAddOffer(),
            ),
          );
        },
      ),
    );
  }
}
