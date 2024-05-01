import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie_fly_restaurant/controllers/blocs/salesdaily/seller_sales_panal_bloc.dart';
import 'package:foodie_fly_restaurant/controllers/blocs/salestotel/seller_sales_panaltotel_bloc.dart';
import 'package:foodie_fly_restaurant/utils/constants.dart';
import 'package:foodie_fly_restaurant/utils/text_styles.dart';

class SellerSalesPanalWidget extends StatelessWidget {
  const SellerSalesPanalWidget({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    context.read<SalesDailyBloc>().add(GetSalesDailyEvent());
    context.read<SalesTotelBloc>().add(GetSalesTotelEvent());
    return Positioned(
      top: 100,
      left: 20,
      child: Container(
        width: width * 9 / 10,
        height: width * 4 / 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: orangePointWithblue,
          border: Border.all(
            width: 1.5,
            color: orangePointShade800,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: width * 4 / 10,
              height: 140 / 1,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  width: 1,
                  color: orangePointShade800,
                ),
              ),
              child: Card(
                margin: const EdgeInsets.all(7),
                elevation: 5,
                shadowColor: orangePointWithblue,
                surfaceTintColor: orangePointWithblue,
                child: Column(
                  children: [
                    const Text(
                      "Orders",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationColor: orange,
                          decorationThickness: 2,
                          decorationStyle: TextDecorationStyle.dashed),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const ImageIcon(
                          AssetImage('assets/icons/ordericon.png'),
                          color: green,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        BlocBuilder<SalesDailyBloc, SalesDailyState>(
                          builder: (context, state) {
                            return Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  const TextSpan(
                                      text: 'Today: ', style: semiBoldBlack),
                                  TextSpan(
                                    text: '${state.report?.todayOrder}',
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Divider(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const ImageIcon(
                          AssetImage('assets/icons/ordericon.png'),
                          color: green,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        BlocBuilder<SalesTotelBloc, SalesTotelState>(
                          builder: (context, state) {
                            return Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  const TextSpan(
                                      text: 'Total: ', style: semiBoldBlack),
                                  TextSpan(
                                    text: '${state.report?.totelOrder}',
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: width * 4 / 10,
              height: 140 / 1,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  width: 1.5,
                  color: orangePointShade800,
                ),
              ),
              child: Card(
                margin: const EdgeInsets.all(7),
                elevation: 5,
                shadowColor: orangePointWithblue,
                surfaceTintColor: orangePointWithblue,
                child: Column(
                  children: [
                    const Text(
                      "Revenue",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationColor: orange,
                          decorationThickness: 2,
                          decorationStyle: TextDecorationStyle.dashed),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const ImageIcon(
                          AssetImage('assets/icons/revenueicon.png'),
                          color: green,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        BlocBuilder<SalesDailyBloc, SalesDailyState>(
                          builder: (context, state) {
                            return Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  const TextSpan(
                                    text: 'Today: ',
                                    style: semiBoldBlack,
                                  ),
                                  TextSpan(
                                    text: '${state.report?.todayRevenue}',
                                    style: boldOrange,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Divider(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const ImageIcon(
                          AssetImage('assets/icons/revenueicon.png'),
                          color: green,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        BlocBuilder<SalesTotelBloc, SalesTotelState>(
                          builder: (context, state) {
                            return Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  const TextSpan(
                                      text: 'Total: ', style: semiBoldBlack),
                                  TextSpan(
                                      text: '${state.report?.totelReverue}',
                                      style: boldOrange),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
