import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:foodie_fly_restaurant/controllers/api_services/sales_report/api_calls.dart';
import 'package:foodie_fly_restaurant/models/sales_reports.dart';

part 'seller_sales_panaltotel_event.dart';
part 'seller_sales_panaltotel_state.dart';

class SalesTotelBloc extends Bloc<SalesTotelEvent, SalesTotelState> {
  SalesTotelBloc() : super(SalesTotelInitial()) {
    on<SalesTotelEvent>(sellerSalesPanaltotelEvent);
  }

  FutureOr<void> sellerSalesPanaltotelEvent(SalesTotelEvent event, Emitter<SalesTotelState> emit) async{
    final report = await SalesApiServices().getSalesReportTotel();
     emit(SalesTotelState(report: report));
  }
}
