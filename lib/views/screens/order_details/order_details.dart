import 'package:flutter/material.dart';
import 'package:foodie_fly_restaurant/models/order_status.dart';
import 'package:foodie_fly_restaurant/views/widgets/class_widgets/section_head.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie_fly_restaurant/controllers/blocs/bloc/order_bloc.dart';
import 'package:foodie_fly_restaurant/models/order.dart';
import 'package:foodie_fly_restaurant/utils/constants.dart';
import 'package:foodie_fly_restaurant/utils/text_styles.dart';
import 'package:foodie_fly_restaurant/views/widgets/class_widgets/app_bar_widget.dart';

class ScreenOrderDetails extends StatelessWidget {
  ScreenOrderDetails({super.key, required this.order});
  final Order order;
  final List<String> status = ['COOKING', 'FOOD READY', 'DELIVERED'];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    context.read<OrderBloc>().add(GetOrderByIdEvent(orderId: order.orderId));
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBarWidget(title: 'Order details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: BlocBuilder<OrderBloc, OrderState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: width,
                  // height: height * .25,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.green),
                  ),
                  child: Column(
                    children: [
                      kHight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Order Id: ', style: regularBlack),
                          Text(
                            order.orderId.toString(),
                            overflow: TextOverflow.ellipsis,
                            style: semiBoldOrange,
                          ),
                        ],
                      ),
                      kHight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Order on: '),
                          Text(
                            DateFormat("  d MMMM yyy")
                                .format(DateTime.parse(order.orderDate)),
                            style: semiBoldOrange,
                          ),
                        ],
                      ),
                      kHight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Item count: '),
                          Text(
                            order.itemCount.toString(),
                            style: semiBoldOrange,
                          ),
                        ],
                      ),
                      kHight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Delivery Status: '),
                          SizedBox(
                            width: width * .4,
                            child: DropdownButtonFormField(
                              validator: (value) {
                                if (value == null) return 'Choose category';
                                return null;
                              },
                              decoration: InputDecoration(
                                label: Text(order.orderStatus),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              items: status.map((stat) {
                                return DropdownMenuItem(
                                  value: stat,
                                  child: Text(stat),
                                );
                              }).toList(),
                              onChanged: (value) async {
                                final status = OrderStatus(orderStatus: value!);
                                context.read<OrderBloc>().add(UpdateStatusEvent(
                                    orderId: order.orderId,
                                    status: status,
                                    context: context));
                              },
                            ),
                          )
                        ],
                      ),
                      kHight10,
                    ],
                  ),
                ),
                kHight10,
                const SectionHead(heading: 'Items', values: '',),
                kHight10,
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: state.orderItem.length,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          state.orderItem[index].name,
                          style: boldGrey,
                        ),
                        SizedBox(
                          width: width * .25,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'x ${state.orderItem[index].quantity}',
                                style: semiBoldBlack,
                              ),
                              Text(
                                '₹ ${state.orderItem[index].salePrice * state.orderItem[index].quantity}',
                                style: boldOrange,
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return kHight10;
                  },
                ),
                kHight10,
                divider1,
                kHight10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total Amount:',
                      style: semiBoldBlack,
                    ),
                    Text(
                      '₹ ${order.totalPrice - order.deliveryCharge}',
                      style: boldOrange,
                    )
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
