import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foodie_fly_restaurant/controllers/api_services/orders/api_calling.dart';
import 'package:foodie_fly_restaurant/models/order.dart';
import 'package:foodie_fly_restaurant/models/order_items.dart';
import 'package:foodie_fly_restaurant/models/order_status.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderInitial()) {
    on<GetAllOrderEvent>(getAllOrderEvent);
    on<GetOrderByIdEvent>(getOrderByIdEvent);
    on<UpdateStatusEvent>(updateStatusEvent);

  }


  FutureOr<void> getAllOrderEvent(GetAllOrderEvent event, Emitter<OrderState> emit)async {
    final order = await OrderApiService().getAllOrders();
    emit(OrderState(order: order, orderItem: []));
  }

  FutureOr<void> getOrderByIdEvent(GetOrderByIdEvent event, Emitter<OrderState> emit)async {
    final order = await OrderApiService().getAllOrders();
    final orderItem = await OrderApiService().getOrderById(event.orderId);
    emit(OrderState(order: order, orderItem: orderItem));
  }

  FutureOr<void> updateStatusEvent(UpdateStatusEvent event, Emitter<OrderState> emit)async {
      final value = await OrderApiService().updateStatus(event.orderId, event.status);
      if(value){
        final orders = await OrderApiService().getAllOrders();
        final orderItem = await OrderApiService().getOrderById(event.orderId);
        emit(OrderState(order: orders, orderItem: orderItem));
      }else{
        emit(UpdateErrorState());
      }
  }
  
}
