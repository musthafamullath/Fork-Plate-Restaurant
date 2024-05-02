import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie_fly_restaurant/controllers/blocs/order/order_bloc.dart';
import 'package:foodie_fly_restaurant/models/order.dart';
import 'package:foodie_fly_restaurant/models/order_status.dart';
import 'package:foodie_fly_restaurant/utils/constants.dart';
import 'package:foodie_fly_restaurant/utils/text_styles.dart';
import 'package:foodie_fly_restaurant/views/widgets/class_widgets/app_bar_widget.dart';
import 'package:foodie_fly_restaurant/views/widgets/class_widgets/section_head.dart';
import 'package:intl/intl.dart';

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
      appBar:  PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: AppBarWidget(title: 'Order details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocBuilder<OrderBloc, OrderState>(
          builder: (context, state) {
            return Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(25)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: width,
                    // height: height * .25,
                    padding: const EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: Colors.grey.withOpacity(0.5), width: 3),
                    ),
                    child: Column(
                      children: [
                        kHight10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Order Id: ', style: semiBoldBlack),
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
                            const Text('Order on: ', style: semiBoldBlack),
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
                            const Text('Item count: ', style: semiBoldBlack),
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
                            const Text('Delivery Status: ',
                                style: semiBoldBlack),
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
                                  final status =
                                      OrderStatus(orderStatus: value!);
                                  context.read<OrderBloc>().add(
                                      UpdateStatusEvent(
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Container(
                      width: width,
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: Colors.grey.withOpacity(0.5), width: 2),
                      ),
                      child: Column(
                        children: [
                          kHight10,
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SectionHead(
                                heading: 'Items',
                                values: '',
                              ),
                              SectionHead(
                                heading: 'Count',
                                values: '',
                              ),
                              SectionHead(
                                heading: '',
                                values: 'Amount',
                              ),
                            ],
                          ),
                          kHight10,
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.orderItems.length,
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    state.orderItems[index].name,
                                    style: boldGrey,
                                  ),
                                  SizedBox(
                                    width: width * .25,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'x ${state.orderItems[index].quantity}',
                                          style: semiBoldBlack,
                                        ),
                                        Text(
                                          '₹ ${state.orderItems[index].salePrice * state.orderItems[index].quantity}',
                                          style: boldOrange,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              );
                            },
                          ),
                          kHight10,
                          divider2,
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
                              ),
                              
                            ],
                          ),
                          kHight10,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
