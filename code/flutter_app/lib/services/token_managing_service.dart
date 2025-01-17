import 'dart:math';

import 'package:flutter_app/classes/user_small.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:jwt_decoder/jwt_decoder.dart';
import '../classes/app_properties.dart'as properties;


final storage = FlutterSecureStorage();

Future<void> storeToken(String token) async {
  await storage.write(key: 'jwt_token', value: token);
}
Future<void> storeUsername(String username) async{
  await storage.write(key: 'username', value: username);

}

Future<void> storePictureURI(String pictureURI) async{
  await storage.write(key: 'pictureURI', value: pictureURI);
}

Future<String?> getToken() async {
  return await storage.read(key: 'jwt_token');
}

Future<String?> getPictureURI() async {
  return await storage.read(key: 'pictureURI');
}

Future<String?> getUsername() async {
  return await storage.read(key: 'username');
}

Future<UserSmall?> auth() async{
  String? token = await getToken();
  String? username = await getUsername();
  if(token == null || username == null) return null;
  final response = await http.post(
    Uri.parse("${properties.apiUrl}/auth"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization' : 'Bearer $token'
    },
    body: jsonEncode(<String, String>{
      'username': username,
    }),
  );
  if(response.statusCode == 200){
    final Map<String, dynamic> body = json.decode(response.body);
     UserSmall user = UserSmall.fromJson(body);
     await storePictureURI(user.pictureURI);
     return user;
  };
  return null;
}

Future<String?> updatePicture(String pictureURI)async {
  String? token = await getToken();
  String? username = await getUsername();
  if(token == null || username == null) return null;
  final response = await http.put(
    Uri.parse("${properties.apiUrl}/update_picture"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization' : 'Bearer $token'
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'pictureURI':pictureURI
    }),
  );
  if(response.statusCode == 200) {
    storePictureURI(pictureURI);
    return pictureURI;
  }
  return null;
}

Future<String> login(String username, String password) async {
  final response = await http.post(
    Uri.parse("${properties.apiUrl}/login"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body)['token'];
  } else {
    throw Exception('Failed to login');
  }
}

bool isTokenExpired(String token) {
  return JwtDecoder.isExpired(token);
}