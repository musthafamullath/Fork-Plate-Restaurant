
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:foodie_fly_restaurant/controllers/api_end_points/api_end_points.dart';
import 'package:foodie_fly_restaurant/controllers/api_tokens/tokens.dart';
import 'package:foodie_fly_restaurant/models/sales_reports.dart';

class SalesApiServices {
  Dio dio = Dio(BaseOptions(baseUrl: ApiEndPoints.baseUrl));

  //-------------------getSalesReportDaily-----------------//

  Future<SalesReport?> getSalesReportDaily() async {
      final token = await getToken();
    try {
      final response = await dio.get(
        ApiEndPoints.dailyStatus,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        final body = response.data;
        final result = body['result'];
        final salesReport = SalesReport.fromJson(result);
        return salesReport;
      } else if (response.statusCode == 401) {
        final body = response.data;
        final result = body['result'];
        final salesReport = SalesReport.fromJson(result);
        return salesReport;
      } else if (response.statusCode == 500) {
        final body = response.data;
        final result = body['result'];
        final salesReport = SalesReport.fromJson(result);
        return salesReport;
      } else{
        return null;
      }
    } catch (e) {
     
      log(e.toString());
      return null;
    }
  }

  //-------------------getSalesReportTotel-----------------//

  Future<SalesReport?> getSalesReportTotel() async {
    try {
      final token = await getToken();
      final response = await dio.get(
        ApiEndPoints.totelStatus,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        final body = response.data;
        final result = body['result'];
        final salesReport = SalesReport.fromJson(result);
        return salesReport;
      } else if (response.statusCode == 401) {
        final body = response.data;
        final result = body['result'];
        final salesReport = SalesReport.fromJson(result);
        return salesReport;
      } else if (response.statusCode == 500) {
        final body = response.data;
        final result = body['result'];
        final salesReport = SalesReport.fromJson(result);
        return salesReport;
      } else{
        return null;
      }
    } catch (e) {
     
      log(e.toString());
      return null;
    }
  }
}
