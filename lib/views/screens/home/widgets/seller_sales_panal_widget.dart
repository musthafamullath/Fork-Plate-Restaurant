import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie_fly_restaurant/controllers/blocs/sales_report/sales_report_bloc.dart';
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
    context.read<SalesReportBloc>().add(GetDailySalesReportEvent());
    return Positioned(
      top: 110,
      left: 10,
      child: Container(
        width: width * 9.5 / 10,
        height: width * 3 / 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey.shade100,
          border: Border.all(
            width: 3,
            color: Colors.grey.shade300,
          ),
        ),
        child: BlocBuilder<SalesReportBloc, SalesReportState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: width * 4.5 / 10,
                  height: 100 / 01,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Card(
                    margin: const EdgeInsets.all(7),
                    shadowColor: grey,
                    surfaceTintColor: grey,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1.5, color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 6),
                            child: Text(
                              "Today's Order",
                              style: boldGrey,
                            ),
                          ),
                          Divider(
                            thickness: 2,
                            color: Colors.grey.shade300,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Text(
                              '${state.report?.saleCount}',
                              style: const TextStyle(
                                fontSize: 20,
                                color: yellow,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: width *4.8 / 10,
                  height: 100 / 01,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Card(
                    margin: const EdgeInsets.all(7),
                    shadowColor: yellow,
                    surfaceTintColor: yellow,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1.5, color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 6),
                            child: Text(
                              "Today's revenue",
                              style: boldGrey,
                            ),
                          ),
                          Divider(
                            thickness: 2,
                            color: Colors.grey.shade300,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Text(
                              '₹ ${state.report?.totalSales.round()}.00',
                              style: const TextStyle(
                                fontSize: 20,
                                color: yellow,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
