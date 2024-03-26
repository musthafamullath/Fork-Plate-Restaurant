import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:foodie_fly_restaurant/controllers/api_end_points/api_end_points.dart';
import 'package:foodie_fly_restaurant/models/restaurant.dart';
import 'package:foodie_fly_restaurant/controllers/api_tokens/tokens.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiSellerAuthentication {
  //----------------------------------------------------------login----------------------------------------------------------//
  static Future<String> register(
      RestaurantRegisteration restaurantRegisteration) async {
    const url =
        "${ApiEndPoints.baseUrl}${ApiEndPoints.seller}${ApiEndPoints.register}";
    final data = {
      "email": restaurantRegisteration.email,
      "password": restaurantRegisteration.password,
      "confirmPassword": restaurantRegisteration.password,
      "name": restaurantRegisteration.name,
      "description": restaurantRegisteration.description,
      "pinCode": restaurantRegisteration.pinCode,
    };
    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode(data),
      );
      debugPrint('Response ${response.statusCode}');

      final responseBody = jsonDecode(response.body);
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

  static Future<String> login(String email, String password) async {
    try {
      const url =
          "${ApiEndPoints.baseUrl}${ApiEndPoints.seller}${ApiEndPoints.login}";
      final data = {
        "email": email,
        "password": password,
      };
      final response = await http.post(
        Uri.parse(url),
        body: data,
      );
      final responseBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setBool("LOGIN", true);
        saveToken(responseBody['token']);
        return "success";
      } else if (response.statusCode == 400) {
        if(responseBody['message'] == "failed. invalid fields"){
          return "failed. invalid fields";
        }else if(responseBody['message'] == "failed to Login"){
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
      return '';
    }
  }
}
