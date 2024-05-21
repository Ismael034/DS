import 'package:http/http.dart' as http;
import 'dart:convert';

class User {
  final int id;
  final String name;

  User({required this.id, required this.name});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
    );
  }
}

/*Future<List<User>> fetchUsers() async {
  /*final response = await http.get(Uri.parse('http://localhost:3000/users'));

  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    return data.map((user) => User.fromJson(user)).toList();
  } else {
    throw Exception('Failed to load users');
  }*/

  List<User> users = [
    User(id: 1, name: 'Alice'),
    User(id: 2, name: 'Bob'),
    User(id: 3, name: 'Charlie'),
    User(id: 4, name: 'Diana'),
  ];

  return users;
}*/
