// ignore_for_file: prefer_typing_uninitialized_variables

class SalesReport {
  final  todayOrder;
  final  totelOrder;
  final  todayRevenue;
  final  totelReverue;

  SalesReport(
      {required this.todayOrder,
      required this.totelOrder,
      required this.todayRevenue,
      required this.totelReverue});

  factory SalesReport.fromJson(Map<String, dynamic> json) {
    return SalesReport(
      todayOrder: json['todayOrder'],
      totelOrder: json['totelOrder'],
      todayRevenue: json['todayRevenue'],
      totelReverue: json['totelReverue'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['todayOrder'] = todayOrder;
    data['totelOrder'] = totelOrder;
    data['todayRevenue'] = todayRevenue;
    data['totelReverue'] = totelReverue;
    return data;
  }
}
