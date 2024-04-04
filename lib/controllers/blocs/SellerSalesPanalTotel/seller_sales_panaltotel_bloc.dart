// import 'dart:async';

// import 'package:bloc/bloc.dart';
// import 'package:foodie_fly_restaurant/controllers/api_services/sales_report/api_calls.dart';
// import 'package:foodie_fly_restaurant/models/sales_reports.dart';

// part 'seller_sales_panaltotel_event.dart';
// part 'seller_sales_panaltotel_state.dart';

// class SellerSalesPanaltotelBloc extends Bloc<SellerSalesPanaltotelEvent, SellerSalesPanaltotelState> {
//   SellerSalesPanaltotelBloc() : super(SellerSalesPanaltotelInitial()) {
//     on<SellerSalesPanaltotelEvent>(sellerSalesPanaltotelEvent);
//   }

//   FutureOr<void> sellerSalesPanaltotelEvent(SellerSalesPanaltotelEvent event, Emitter<SellerSalesPanaltotelState> emit) async{
//     final report = await SalesApiServices().getSalesReportTotel();
//      emit(SellerSalesPanaltotelState(report: report));
//   }
// }
