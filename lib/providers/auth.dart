import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth with ChangeNotifier {
  String _token = '';
  DateTime _expiryDate = DateTime.now();
  String _userId = '';

  Future<void> signup(String email, String password) async {
    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDkBAIi2HnqRBw6j5EOJWTy7zjwE_M7liM');
    final response = await http.post(url,
        body: json.encode(
            {'email': email, 'password': password, 'returnSecureToken': true}));
    print(json.decode(response.body));
  }
}
