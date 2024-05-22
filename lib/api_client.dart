import 'dart:convert';
import 'package:concesionario_tunning/builder/coche.dart';
import 'package:concesionario_tunning/user/user.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  final String baseUrl = "http://localhost:3000";

  Future<Coche> getCoche(int id) async {
    return await http.get(Uri.parse("$baseUrl/car/$id")).then((response) {
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return Coche.fromJson(json);
      } else {
        throw Exception("Error al obtener el coche");
      }
    });
  }

  Future<void> updateCoche(Coche coche) async {
    String json = Coche.toJson(coche);
    return await http
        .put(Uri.parse("$baseUrl/car/${coche.id}"),
            headers: {
              'Content-Type': 'application/json',
            },
            body: json)
        .then((response) {
      if (response.statusCode != 200) {
        throw Exception("Error al actualizar el coche");
      }
    });
  }

  Future<void> deleteCoche(int id) async {
    return await http.delete(Uri.parse("$baseUrl/car/$id")).then((response) {
      if (response.statusCode != 200) {
        throw Exception("Error al eliminar el coche");
      }
    });
  }

  Future<void> addCoche(Coche coche) async {
    String json = Coche.toJson(coche);
    return await http
        .post(Uri.parse("$baseUrl/car"),
            headers: {
              'Content-Type': 'application/json',
            },
            body: json)
        .then((response) {
      if (response.statusCode != 200) {
        throw Exception("Error al añadir el coche: ${response.body}");
      }
    });
  }

  Future<List<User>> getUsers() {
    return http.get(Uri.parse("$baseUrl/user")).then((response) {
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        var users = List<User>.empty(growable: true);
        for (var user in json) {
          users.add(User.fromJson(user));
        }
        return users;
      } else {
        throw Exception("Error al obtener los usuarios");
      }
    });
  }

  Future<List<Coche>> getCochesUsuario(int id) {
    return http.get(Uri.parse("$baseUrl/user/$id/cars")).then((response) {
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        var coches = List<Coche>.empty(growable: true);
        for (var coche in json) {
          coches.add(Coche.fromJson(coche));
        }
        return coches;
      } else {
        throw Exception("Error al obtener los coches");
      }
    });
  }
}
