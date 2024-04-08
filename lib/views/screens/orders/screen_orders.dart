import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie_fly_restaurant/controllers/blocs/bloc/order_bloc.dart';
import 'package:foodie_fly_restaurant/utils/constants.dart';
import 'package:foodie_fly_restaurant/utils/text_styles.dart';
import 'package:foodie_fly_restaurant/views/screens/order_details/order_details.dart';
import 'package:foodie_fly_restaurant/views/screens/orders/widgets/tabbar_custom_widget.dart';
import 'package:intl/intl.dart';

class ScreenOrders extends StatelessWidget {
  const ScreenOrders({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: TabBarWidgetCustom(text: "Orders"),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child:
               BlocBuilder<OrderBloc, OrderState>(
                builder: (context, state) {
                  return state.order.isEmpty
                      ? const Center(child: Text('All Order page is Empty'))
                      : 
                      ListView.builder(
                          itemCount: state.order.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ScreenOrderDetails(
                                      order: state.order[index],
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: width,
                                // height: height * .25,
                                padding: const EdgeInsets.all(18),
                                margin: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.green),
                                ),
                                child: Column(
                                  children: [
                                    kHight10,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Order Id: '),
                                        Text(
                                          state.order[index].orderId.toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: boldOrange,
                                        ),
                                      ],
                                    ),
                                    kHight10,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Order on: '),
                                        Text(
                                          DateFormat("d MMM yyyy").format(
                                            DateTime.parse(state
                                                .order[index].deliveryDate),
                                          ),
                                          style: semiBoldOrange,
                                        ),
                                      ],
                                    ),
                                    kHight10,
                                    kHight10,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Total Amount: '),
                                        Text(
                                          '₹ ${state.order[index].totalPrice - state.order[index].deliveryCharge}',
                                          style: semiBoldOrange,
                                        ),
                                      ],
                                    ),
                                    kHight10,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Item count: '),
                                        Text(
                                          state.order[index].itemCount
                                              .toString(),
                                          style: semiBoldOrange,
                                        ),
                                      ],
                                    ),
                                    kHight10,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Delivery Status: '),
                                        Text(
                                          state.order[index].orderStatus,
                                          style: semiBoldOrange,
                                        ),
                                      ],
                                    ),
                                    kHight10,
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: BlocBuilder<OrderBloc, OrderState>(
                builder: (context, state) {
                  final orders = state.order
                      .where((element) =>
                          element.orderStatus.toLowerCase() == 'cooking')
                      .toList();
                  return orders.isEmpty
                      ?  const Center(child: Text('cooking page  is Empty'))
                      : ListView.builder(
                          itemCount: orders.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ScreenOrderDetails(
                                      order: orders[index],
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: width,
                                // height: height * .25,
                                padding: const EdgeInsets.all(18),
                                margin: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.green),
                                ),
                                child: Column(
                                  children: [
                                    kHight10,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Order Id: '),
                                        Text(
                                          orders[index].orderId.toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: semiBoldBlack,
                                        ),
                                      ],
                                    ),
                                    kHight10,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Order on: '),
                                        Text(
                                          DateFormat("d MMM yyyy").format(
                                            DateTime.parse(
                                                orders[index].deliveryDate),
                                          ),
                                          style: semiBoldBlack,
                                        ),
                                      ],
                                    ),
                                    kHight10,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Total Amount: '),
                                        Text(
                                          '₹ ${state.order[index].totalPrice - state.order[index].deliveryCharge}',
                                          style: semiBoldBlack,
                                        ),
                                      ],
                                    ),
                                    kHight10,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Item count: '),
                                        Text(
                                          orders[index].itemCount.toString(),
                                          style: semiBoldBlack,
                                        ),
                                      ],
                                    ),
                                    kHight10,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Delivery Status: '),
                                        Text(
                                          orders[index].orderStatus,
                                          style: orders[index].orderStatus ==
                                                      'COOKING' ||
                                                  orders[index].orderStatus ==
                                                      'FOOD READY'
                                              ? semiBoldBlack
                                              : semiBoldOrange,
                                        ),
                                      ],
                                    ),
                                    kHight10,
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: BlocBuilder<OrderBloc, OrderState>(
                builder: (context, state) {
                  final orders = state.order
                      .where((element) =>
                          element.orderStatus.toLowerCase() == 'food ready')
                      .toList();
                  return orders.isEmpty
                      ? const Center(child: Text('food ready page  is Empty'))
                      : ListView.builder(
                          itemCount: orders.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ScreenOrderDetails(
                                      order: orders[index],
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: width,
                                // height: height * .25,
                                padding: const EdgeInsets.all(18),
                                margin: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.green),
                                ),
                                child: Column(
                                  children: [
                                    kHight10,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Order Id: '),
                                        Text(
                                          orders[index].orderId.toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: semiBoldBlack,
                                        ),
                                      ],
                                    ),
                                    kHight10,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Order on: '),
                                        Text(
                                          DateFormat("d MMM yyyy").format(
                                            DateTime.parse(
                                                orders[index].deliveryDate),
                                          ),
                                          style: semiBoldBlack,
                                        ),
                                      ],
                                    ),
                                    kHight10,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Total Amount: '),
                                        Text(
                                          '₹ ${state.order[index].totalPrice - state.order[index].deliveryCharge}',
                                          style: semiBoldBlack,
                                        ),
                                      ],
                                    ),
                                    kHight10,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Item count: '),
                                        Text(
                                          orders[index].itemCount.toString(),
                                          style: semiBoldBlack,
                                        ),
                                      ],
                                    ),
                                    kHight10,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Delivery Status: '),
                                        Text(
                                          orders[index].orderStatus,
                                          style: semiBoldBlack,
                                        ),
                                      ],
                                    ),
                                    kHight10,
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: BlocBuilder<OrderBloc, OrderState>(
                builder: (context, state) {
                  final orders = state.order
                      .where((element) =>
                          element.orderStatus.toLowerCase() == 'delivered')
                      .toList();
                  return orders.isEmpty
                      ? const Center(child: Text('delivered page  is Empty'))
                      : ListView.builder(
                          itemCount: orders.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ScreenOrderDetails(
                                      order: orders[index],
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: width,
                                // height: height * .25,
                                padding: const EdgeInsets.all(18),
                                margin: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.green),
                                ),
                                child: Column(
                                  children: [
                                    kHight10,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Order Id: '),
                                        Text(
                                          orders[index].orderId.toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: semiBoldBlack,
                                        ),
                                      ],
                                    ),
                                    kHight10,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Order on: '),
                                        Text(
                                          DateFormat("d MMM yyyy").format(
                                            DateTime.parse(
                                                orders[index].deliveryDate),
                                          ),
                                          style: semiBoldBlack,
                                        ),
                                      ],
                                    ),
                                    kHight10,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Total Amount: '),
                                        Text(
                                          '₹ ${state.order[index].totalPrice - state.order[index].deliveryCharge}',
                                          style: semiBoldBlack,
                                        ),
                                      ],
                                    ),
                                    kHight10,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Item count: '),
                                        Text(
                                          orders[index].itemCount.toString(),
                                          style: semiBoldBlack,
                                        ),
                                      ],
                                    ),
                                    kHight10,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Delivery Status: '),
                                        Text(
                                          orders[index].orderStatus,
                                          style: semiBoldBlack,
                                        ),
                                      ],
                                    ),
                                    kHight10,
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
