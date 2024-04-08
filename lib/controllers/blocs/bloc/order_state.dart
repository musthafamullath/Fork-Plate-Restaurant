part of 'order_bloc.dart';

class OrderState {
  final List<Order> order;
  final List<OrderItem> orderItem;

  OrderState({required this.order, required this.orderItem});
  
}

final class OrderInitial extends OrderState {
  OrderInitial() : super(order: [],orderItem: []);
}

final class UpdateErrorState extends OrderState{
  UpdateErrorState():super(order: [],orderItem: []);

}