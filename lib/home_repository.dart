// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;

import 'home_model.dart';

class HomeRepository {
  Future<HomeModel> getData() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
      return HomeModel.fromJson(json.decode(response.body));
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
