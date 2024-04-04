class SalesReport {
  final num todayOrder;
  final num totelOrder;
  final num todayRevenue;
  final num totelReverue;

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
