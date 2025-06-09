import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpClient {
  HttpClient._();

  static const String _baseUrl =
      "http://10.0.2.2:5050"; // Emulador padrão Android

  // static const String _baseUrl = "https://ferramenta-pro-core.onrender.com";

  // Method to make a get request
  static Future<http.Response> get(String endpoint) async {
    final response = await http.get(Uri.parse('$_baseUrl/$endpoint'));
    return response;
  }

  // Method to make a post request
  static Future<http.Response> post(String endpoint, dynamic data) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );
    return response;
  }

  // Method to make a put request
  static Future<http.Response> put(String endpoint, dynamic data) async {
    final response = await http.put(
      Uri.parse("$_baseUrl/$endpoint"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(data),
    );
    return response;
  }

  static Future<http.Response> delete(String endpoint) async {
    final response = await http.delete(
      Uri.parse("$_baseUrl/$endpoint"),
      headers: {"Content-Type": "application/json"},
    );
    return response;
  }

  static Future<Map<String, dynamic>> _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load data: ${response.statusCode}");
    }
  }
}
