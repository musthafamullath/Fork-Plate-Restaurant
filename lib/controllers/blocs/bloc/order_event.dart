part of 'order_bloc.dart';
class OrderEvent {}
class GetAllOrderEvent extends OrderEvent{}
class GetOrderByIdEvent extends OrderEvent{
  final int orderId;

  GetOrderByIdEvent({required this.orderId});
}
class UpdateStatusEvent extends OrderEvent{
  final int orderId;
  final OrderStatus status;
  UpdateStatusEvent({required this.orderId, required this.status, required BuildContext context});
  
}