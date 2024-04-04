import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:foodie_fly_restaurant/controllers/api_end_points/api_end_points.dart';
import 'package:foodie_fly_restaurant/controllers/api_tokens/tokens.dart';
import 'package:foodie_fly_restaurant/models/offer.dart';

class OfferApiServices{
  final Dio dio = Dio(BaseOptions(baseUrl: ApiEndPoints.baseUrl));
  //--------------------add offer-----------------------------------//
  Future<String> addOffer(OfferRequest offer)async{
    final bearer = await getToken();
    try{
      final body = FormData.fromMap(offer.toJson(offer));
      final response = await dio.post(
        ApiEndPoints.addOffers,
        data: body,
        options: Options(
          headers: {
           'Content-Type': 'multipart/form-data',
           'accept': 'application/json',
           'Authorization': 'Bearer $bearer'
          }
        )
      );
      final responseBody = jsonDecode(response.data);
      if(response.statusCode == 200){
        return "offer created successfully";
      }else if(response.statusCode == 400){
        if(responseBody['message'] == "invalid inputs" ) {
          return "invalid inputs";
        }else if(responseBody['message'] == "failed to get image from form"){
          return "failed to get image from form";
        }else{
          return '';
        }
      }else if(response.statusCode == 500){
        if(responseBody['message'] == "failed to parse body"){
          return "failed to parse body";
        }else if(responseBody['message'] == "failed to open file path in server"){
          return "failed to open file path in server";
        }else if(responseBody['message'] == "failed to upload file to cloud"){
          return "failed to upload file to cloud";
        }else if(responseBody['message'] == "failed to delete temp image"){
          return "failed to delete temp image";
        }else if(responseBody['message'] == "error occured while creating offer"){
          return "error occured while creating offer";
        }return '';
      }
      return '';
    }on DioException catch(e){
      log(e.toString());
      return '';
    }
    catch(e){
      log(e.toString());
      return '';
    }
  }
  //-------------------------------get all offers-----------------------//
  Future<List<OfferGet>> getAllOffers(int categoryId)async{
    final token = await getToken();
    try{
      final response = await dio.get(
        ApiEndPoints.getAllOffers,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          }
        )
      );
      final responseBody = jsonDecode(response.data);
      if(response.statusCode == 200){
        final result = responseBody['offerList'] as List;
        List<OfferGet> offers = [];
        for(int i = 0; i < result.length; i++){
          final offer = OfferGet.fromJson(result[i]);
          offers.add(offer);
        }
       return offers;
      }else if(response.statusCode == 500){
        if(responseBody['message'] == "failed to fetch offers"){
        
          return [];
        }
      }
      return [];
    }
    on DioException catch(e){
      log(e.toString());
      return [];
    }catch(e){
      log(e.toString());
      return [];
    }
  }
}