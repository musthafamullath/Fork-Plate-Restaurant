import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:foodie_fly_restaurant/controllers/api_end_points/api_end_points.dart';
import 'package:foodie_fly_restaurant/models/restaurant.dart';
import 'package:foodie_fly_restaurant/controllers/api_tokens/tokens.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiSellerAuthentication {
  final Dio dio = Dio(BaseOptions(baseUrl: ApiEndPoints.baseUrl));
  //----------------------------------------------------------sign up----------------------------------------------------------//
  Future<String> register(
      RestaurantRegisteration restaurantRegisteration) async {
    final data = {
      "email": restaurantRegisteration.email,
      "password": restaurantRegisteration.password,
      "confirmPassword": restaurantRegisteration.password,
      "name": restaurantRegisteration.name,
      "description": restaurantRegisteration.description,
      "pinCode": restaurantRegisteration.pinCode,
    };
    print(data);
    try {
      final response = await dio.post(
        ApiEndPoints.sellerRegister,
        options: Options(
          headers: <String, String>{
            'Content-Type': 'application/json',
            'accept': 'application/json',
          },
        ),
        data: jsonEncode(data),
      );
      debugPrint('Response ${response.statusCode}');
      print(response);

      final responseBody = response.data as Map;
      print(responseBody);
      if (response.statusCode == 200) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setBool('LOGIN', true);
        saveToken(responseBody['token']);
        return "Success";
      } else if (response.statusCode == 400) {
        if (responseBody['message'] == "failed. invalid fields") {
          return "failed. invalid fields";
        } else if (responseBody['message'] == "failed to register") {
          return "failed to register";
        }
        return '';
      } else if (response.statusCode == 500) {
        return "failed to parse body";
      } else {
        return '';
      }
    } catch (e) {
      log(e.toString());
      return '';
    }
  }

  //----------------------------------------------------------login----------------------------------------------------------//

   Future<String> login(String email, String password) async {
    try {

      final data = {
        "email": email,
        "password": password,
      };

      final response = await dio.post(
        ApiEndPoints.SellerLogin,
        data: data,
      );

      final responseBody = jsonDecode(response.data)as Map;

      if (response.statusCode == 200) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setBool("LOGIN", true);
        saveToken(responseBody['token']);

        return "success";
      } else if (response.statusCode == 400) {
        if (responseBody['message'] == "failed. invalid fields") {
          return "failed. invalid fields";
        } else if (responseBody['message'] == "failed to Login") {
          return "failed to Login";
        }
        return '';
      } else if (response.statusCode == 500) {
        return "failed to parse body";
      } else {
        return '';
      }
    } catch (e) {
      log(e.toString());
      print('------');
      return '';
    }
  }
}
