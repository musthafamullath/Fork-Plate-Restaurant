import 'dart:convert';
import 'dart:developer';
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
        print(url);
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
      final response = await http.post(Uri.parse(url), body: data);
      debugPrint('Response ${response.statusCode}');
      print(response.body);
      print("signup ststuscode:${response.statusCode}");
     final responseBody = jsonDecode(response.body);
        saveToken(responseBody['token']);
      if (response.statusCode == 200) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setBool('LOGIN', true);
        final message = responseBody['message'];
        print("message =${message}");
        return "Success";
      }
       else if(response.statusCode == 400) {
        return "failed invalid fields or failed to register";
      } else if(response.statusCode == 500) {
        return "failed to parse body";
      }else{
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
      print(url);
      final data = {
        "email": email,
        "password": password,
      };
      print(data);
      final response = await http.post(
        Uri.parse(url),
        body: data,
      );
      print(response.body);
      print(response.statusCode);
      final body = jsonDecode(response.body);
      saveToken(body['token']);
      if (response.statusCode == 200) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setBool("LOGIN", true);
        return "success";
      }else if(response.statusCode == 400){
        return "failed invalid fields or failed to Login";
      }else if(response.statusCode == 500){
        return "failed to parse body";
      }else{
        return '';
      }
    } catch (e) {
      log(e.toString());
      return '';
    }
  }
}
