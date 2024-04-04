import 'package:http/http.dart';

class OfferGet {
  int? offerId;
  String? offerTitle;
  int? sellerId;
  int? categoryId;
  int? offerPercentage;
  String? imageUrl;
  String? startDate;
  String? endDate;
  String? status;
  OfferGet({
    this.offerId,
    this.offerTitle,
    this.sellerId,
    this.categoryId,
    this.offerPercentage,
    this.imageUrl,
    this.startDate,
    this.endDate,
    this.status,
  });
  factory OfferGet.fromJson(Map<String, dynamic> json) {
    return OfferGet(
      offerId: json['offerId'],
      offerTitle: json['offerTitle'],
      sellerId: json['sellerId'],
      categoryId: json['categoryId'],
      offerPercentage: json['offerPercentage'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      status: json['status'],
    );
  }
  Map<String, dynamic> toJson(OfferGet offer) {
    final data = {
      "categoryId": offer.categoryId,
      "endDate": offer.endDate,
      "imageUrl": offer.imageUrl,
      "offerId": offer.offerId,
      "offerPercentage": offer.offerPercentage,
      "offerTitle": offer.offerTitle,
      "sellerId": offer.sellerId,
      "startDate": offer.startDate,
      "status": offer.status,
    };
    return data;
  }
}

class OfferRequest {
  final MultipartFile image;
  final int categoryId;
  String? startDate;
  String? endDate;
  final String offerTitle;
  final int offerPercentage;
  final String status;

  OfferRequest({
    required this.image,
    required this.categoryId,
    required this.offerTitle,
    required this.offerPercentage,
    required this.status,
    this.endDate,
    this.startDate,
  });
  Map<String, dynamic> toJson(OfferRequest offerRequest) {
    final data = {
      'image': offerRequest.image,
      'categoryId': offerRequest.categoryId,
      'endDate': offerRequest.endDate,
      'offerPercentage': offerRequest.offerPercentage,
      'startDate': offerRequest.startDate,
      'offerTitle': offerRequest.offerTitle,
      'status': offerRequest.status,
    };
    return data;
  }
}
