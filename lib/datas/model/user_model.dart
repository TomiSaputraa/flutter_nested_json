import 'package:meta/meta.dart';
import 'dart:convert';

class User {
  User({
    required this.createdAt,
    required this.name,
    required this.avatar,
    required this.updateAt,
    required this.username,
    required this.knownIps,
    required this.profile,
    required this.id,
  });

  final DateTime createdAt;
  final String name;
  final String avatar;
  final DateTime updateAt;
  final String username;
  final List<String> knownIps;
  final Profile profile;
  final String id;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        createdAt: DateTime.parse(json["createdAt"]),
        name: json["name"],
        avatar: json["avatar"],
        updateAt: DateTime.parse(json["updateAt"]),
        username: json["username"],
        knownIps: List<String>.from(json["knownIps"].map((x) => x)),
        profile: Profile.fromMap(json["profile"]),
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "createdAt": createdAt.toIso8601String(),
        "name": name,
        "avatar": avatar,
        "updateAt": updateAt.toIso8601String(),
        "username": username,
        "knownIps": List<dynamic>.from(knownIps.map((x) => x)),
        "profile": profile.toMap(),
        "id": id,
      };
}

class Profile {
  Profile({
    required this.firstName,
    required this.lastName,
  });

  final String firstName;
  final String lastName;

  factory Profile.fromJson(String str) => Profile.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Profile.fromMap(Map<String, dynamic> json) => Profile(
        firstName: json["firstName"],
        lastName: json["lastName"],
      );

  Map<String, dynamic> toMap() => {
        "firstName": firstName,
        "lastName": lastName,
      };
}
