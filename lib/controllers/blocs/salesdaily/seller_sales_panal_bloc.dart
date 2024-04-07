

import 'package:bloc/bloc.dart';
import 'package:foodie_fly_restaurant/controllers/api_services/sales_report/api_calls.dart';
import 'package:foodie_fly_restaurant/models/sales_reports.dart';

part 'seller_sales_panal_event.dart';
part 'seller_sales_panal_state.dart';

class SalesDailyBloc extends Bloc<SalesDailyEvent, SalesDailyState> {
  SalesDailyBloc() : super(SalesDilyInitial()) {
    on<GetSalesDailyEvent>((event, emit) async {
      final report = await SalesApiServices().getSalesReportDaily();
      emit(SalesDailyState(report: report));
    });
  }
}

