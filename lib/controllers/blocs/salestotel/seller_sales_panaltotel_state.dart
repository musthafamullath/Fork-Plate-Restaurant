part of 'seller_sales_panaltotel_bloc.dart';
 class SalesTotelState {
  final SalesReport? report;

  SalesTotelState({required this.report});
}

final class SalesTotelInitial extends SalesTotelState {
  SalesTotelInitial() : super(report: null);
}
