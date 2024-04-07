import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie_fly_restaurant/controllers/blocs/category/category_bloc.dart';
import 'package:foodie_fly_restaurant/controllers/blocs/offer/offer_bloc.dart';
import 'package:foodie_fly_restaurant/utils/constants.dart';
import 'package:foodie_fly_restaurant/utils/text_styles.dart';
import 'package:foodie_fly_restaurant/views/screens/add_offer/screen_add_offer.dart';
import 'package:foodie_fly_restaurant/views/screens/home/widgets/floating_action_btn.dart';
import 'package:foodie_fly_restaurant/views/widgets/class_widgets/app_bar_widget.dart';
import 'package:foodie_fly_restaurant/views/widgets/class_widgets/section_head.dart';

class ScreenOffers extends StatelessWidget {
  const ScreenOffers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    context.read<OfferBloc>().add(GetOffersEvent());
    context.read<CategoryBloc>().add(CategoryEvent());

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
                    child: Column(
                    children: <Widget>[
                      const CircularProgressIndicator(),
                      const Divider(),
                      Text(' Empty', style: boldOrangeGrey),
                    ],
                  ))
                : FadeInUpBig(
                  child: ListView.builder(
                      itemCount: state.offers.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Stack(
                              children: <Widget>[
                                Container(
                                  width: width,
                                  height: height * .39,
                                  padding: const EdgeInsets.all(12),
                                  margin: const EdgeInsets.symmetric(vertical: 4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border:
                                        Border.all(color: orangePointShade800),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          CircleAvatar(
                                            backgroundColor:
                                                Colors.black.withAlpha(7),
                                            radius: 36,
                                            child: Image.asset(
                                              'assets/icons/box.png',
                                              height: height * .071,
                                              width: width * 1.2 / 10,
                                              color: amber,
                                            ),
                                          ),
                                          Container(
                                            width: width * 4.5 / 10,
                                            height: height * 2 / 10,
                                            padding: const EdgeInsets.all(12),
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 4),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: orangePointShade800),
                                            ),
                                            child: Image.network(
                                              state.offers[index].imageUrl,
                                              fit: BoxFit.cover,
                                              matchTextDirection: true,
                                              filterQuality: FilterQuality.high,
                                              alignment: Alignment.center,
                                            ),
                                          ),
                                          CircleAvatar(
                                            radius: 36,
                                            backgroundColor: orange,
                                            foregroundColor: white,
                                            child: Text(
                                              '${state.offers[index].offerPercentage}%',
                                              style: bigBoldWhite,
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              SectionHead(
                                                  heading: 'Title : ',
                                                  values: state
                                                      .offers[index].offerTitle),
                                              BlocBuilder<CategoryBloc,
                                                  CategoryState>(
                                                builder: (context, state) {
                                                  return SectionHead(
                                                      heading: "Category : ",
                                                      values: state
                                                          .categories[index]
                                                          .name!);
                                                },
                                              ),
                                              SectionHead(
                                                  heading: 'Started : ',
                                                  values: state
                                                      .offers[index].startDate
                                                      .substring(0, 10)),
                                              SectionHead(
                                                  heading: 'will End : ',
                                                  values: state
                                                      .offers[index].endDate
                                                      .substring(0, 10)),
                                              SectionHead(
                                                  heading: 'Status : ',
                                                  values: state
                                                      .offers[index].status
                                                      .substring(0, 6)),
                                            ],
                                          ),
                                          // Column(
                                          //   children: <Widget>[
                                          //     CircleAvatar(
                                          //       foregroundColor: black,
                                          //       backgroundColor:
                                          //           Colors.black.withAlpha(7),
                                          //       radius: 25,
                                          //       child: const Icon(
                                          //         CupertinoIcons
                                          //             .eyedropper_halffull,
                                          //         size: 25,
                                          //       ),
                                          //     ),
                                          //     const Divider(),
                                          //     CircleAvatar(
                                          //       foregroundColor: black,
                                          //       backgroundColor:
                                          //           Colors.black.withAlpha(7),
                                          //       radius: 25,
                                          //       child: const Icon(
                                          //         CupertinoIcons.delete,
                                          //         size: 25,
                                          //       ),
                                          //     )
                                          //   ],
                                          // )
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            kHight10,
                            divider1,
                            kHight10,
                          ],
                        );
                      },
                    ),
                ),
          );
        },
      ),
      floatingActionButton: FloatingActionBTN(
        icon: Icons.add,
        string: 'Add Offer',
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ScreenAddOffer(),
            ),
          );
        },
      ),
    );
  }
}
