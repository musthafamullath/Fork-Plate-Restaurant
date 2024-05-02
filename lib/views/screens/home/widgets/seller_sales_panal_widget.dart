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
     left: 10,
      child: Container(
        width: width * 9.5 / 10,
        height: width * 4.2 / 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: yellow,
          border: Border.all(
            width: 3,
            color: Colors.grey.shade300,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: width * 4.5 / 10,
              height: 140 / 01,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Card(
                margin: const EdgeInsets.all(7),
               
                shadowColor: yellow,
                surfaceTintColor: yellow,
                child: Container(
                  decoration: BoxDecoration(
                      border:
                          Border.all(width: 1.5, color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      const Text(
                        "Orders",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationColor: grey,
                            decorationThickness: 2,
                            decorationStyle: TextDecorationStyle.dashed),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          
                          
                          BlocBuilder<SalesDailyBloc, SalesDailyState>(
                            builder: (context, state) {
                              return Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    const TextSpan(
                                        text: 'Today: ', style: semiBoldBlack),
                                    TextSpan(
                                      text: '${state.report?.todayOrder}',style: boldGrey
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
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                      
                          BlocBuilder<SalesTotelBloc, SalesTotelState>(
                            builder: (context, state) {
                              return Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    const TextSpan(
                                        text: 'Total: ', style: semiBoldBlack),
                                    TextSpan(
                                      text: '${state.report?.totelOrder}',style: boldGrey
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
            ),
            Container(
             width: width * 4.5 / 10,
              height: 140 / 01,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Card(
                margin: const EdgeInsets.all(7),
               
                shadowColor: yellow,
                surfaceTintColor: yellow,
                child: Container(
                  decoration: BoxDecoration(
                      border:
                          Border.all(width: 1.5, color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      const Text(
                        "Revenue",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationColor: grey,
                            decorationThickness: 2,
                            decorationStyle: TextDecorationStyle.dashed),
                      ),
                     kHight10,
                      Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                        
                         
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
                                      style: boldGrey,
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
                      kHight10,
                      Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                         
                          
                          BlocBuilder<SalesTotelBloc, SalesTotelState>(
                            builder: (context, state) {
                              return Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    const TextSpan(
                                        text: 'Total: ', style: semiBoldBlack),
                                    TextSpan(
                                        text: '${state.report?.totelReverue}',
                                        style: boldGrey),
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
            ),
          ],
        ),
      ),
    );
  }
}
