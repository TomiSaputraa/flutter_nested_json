import 'dart:convert';

import 'package:fetch_api/datas/model/user_model.dart';
import 'package:http/http.dart' as http;

class Repository {
  Future<List<dynamic>> getDataUser() async {
    List<User> users = [];
    try {
      var url = 'https://63070990c0d0f2b8012570e6.mockapi.io/api';
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        for (var u in jsonData) {
          users.add(User.fromMap(u));
        }
        print(jsonData);
        return users;
      }
    } catch (e) {
      print(e.toString());
    }
    return users;
  }
}
