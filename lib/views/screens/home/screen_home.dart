import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie_fly_restaurant/controllers/blocs/profile/profile_bloc.dart';
import 'package:foodie_fly_restaurant/utils/constants.dart';
import 'package:foodie_fly_restaurant/utils/text_styles.dart';
import 'package:foodie_fly_restaurant/views/screens/add_dishes/screen_add_dishes.dart';
import 'package:foodie_fly_restaurant/views/screens/all_categories/screen_categories.dart';
import 'package:foodie_fly_restaurant/views/screens/home/widgets/appbar_widget.dart';
import 'package:foodie_fly_restaurant/views/screens/home/widgets/seller_sales_panal_widget.dart';
import 'package:foodie_fly_restaurant/views/screens/home/widgets/viewall_widget.dart';
import 'package:foodie_fly_restaurant/views/screens/orders/screen_orders.dart';

import 'widgets/floating_action_btn.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    context.read<ProfileBloc>().add(GetProfileEvent());
    return Scaffold(
      body: Stack(
        children: [
          Scaffold(
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(160),
                child: HomeAppBarWidget(width: width),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 55,
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ViewAllwidget(
                        text: "Recent Orders",
                        buttonName: "viewAll",
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const ScreenOrders(),
                            ),
                          );
                        },
                      ),
                    ),
                    Column(
                      children: List.generate(
                        2,
                        (index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: FadeInUpBig(
                              child: Card(
                                shadowColor: Colors.orange.withBlue(900),
                                surfaceTintColor: Colors.orange.withBlue(900),
                                elevation: 5,
                                child: Column(
                                  children: [
                                    ListTile(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 8),
                                      title: Text(
                                        'Order Id: ',
                                        style: boldBlack,
                                      ),
                                      subtitle: Text(
                                        'Order Amount: ₹',
                                        style: semiBoldBlack,
                                      ),
                                      trailing: const Icon(CupertinoIcons
                                          .chevron_right_circle_fill),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    kHight20,
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ViewAllwidget(
                        text: "Categories",
                        buttonName: "View All",
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ScreenCategories(),
                          ));
                        },
                      ),
                    ),
                    kHight20,
                    FadeInDownBig(
                      child: GridView.builder(
                        itemCount: 6,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3),
                        itemBuilder: (context, index) {
                          return Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: 10,),
                                Text('hhhhhh'),
                                const Spacer(),
                                Text('kkkkddd'),
                                 SizedBox(height: 10,),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    kHight50,
                    kHight20,
                  ],
                ),
              ),
              floatingActionButton: FloatingActionBTN(
                string: 'Add Dish',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ScreenAddDishes(),
                    ),
                  );
                }, icon: Icons.add
              )),
          SellerSalesPanalWidget(width: width),
        ],
      ),
    );
  }
}
