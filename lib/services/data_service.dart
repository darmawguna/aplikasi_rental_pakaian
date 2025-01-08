import 'package:app_rental/dto/product.dart';
import 'package:app_rental/dto/payment.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:app_rental/endpoints/endpoints.dart';
import 'package:app_rental/utils/constants.dart';
import 'package:app_rental/utils/secure_storage_util.dart';

class DataService {
  static Future<List<Product>> fetchProducts(String token) async {
    final response = await http.get(
      Uri.parse(Endpoints.product),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json', // Tambahkan jika perlu
      },
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body) as Map<String, dynamic>;

      // Validasi struktur respons
      if (responseData.containsKey('data') &&
          responseData['data'] is Map<String, dynamic> &&
          responseData['data'].containsKey('produk')) {
        final produk = responseData['data']['produk'] as List<dynamic>;
        return produk
            .map((item) => Product.fromJson(item as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception(
          'Invalid response format: Missing "produk" key in "data".',
        );
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }

  static Future<List<Payment>> fetchPayments(String token) async {
    final response = await http.get(
      Uri.parse(Endpoints.payment), // Ganti dengan endpoint API yang sesuai
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body) as Map<String, dynamic>;

      // Validasi struktur respons
      if (responseData.containsKey('data') &&
          responseData['data'] is Map<String, dynamic> &&
          responseData['data'].containsKey('payment')) {
        final payment = responseData['data']['payment'] as List<dynamic>;

        return payment
            .map((item) => Payment.fromJson(item as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception(
          'Invalid response format: Missing "produk" key in "data".',
        );
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }

  //post login with email and password
  static Future<http.Response> sendLoginData(
    String email,
    String password,
  ) async {
    final url = Uri.parse(Endpoints.login); // Replace with your endpoint
    final data = {'email': email, 'password': password};

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );

    return response;
  }

  static Future<http.Response> logoutData() async {
    final url = Uri.parse(Endpoints.logout); // Replace with your endpoint
    final String? accessToken = await SecureStorageUtil.storage.read(
      key: tokenStoreName,
    );
    debugPrint("logout with $accessToken");

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    );

    return response;
  }

  

}
