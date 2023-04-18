import 'package:flutter/cupertino.dart';

@immutable
class Student {
  final int? id;
final  String username;
  final String password;
  final int score; // new field for storing the score

  const Student(
      { this.id,
      required this.username,
      required this.password,
      this.score = 0});
  Student copyWith({int? id, String? username, String? password, int? score}){
    return Student(
          id: id ?? this.id,
          username: username ?? this.username,
           password: password ??this.password,
          score: score ?? this.score );
  }

  static fromJson(Map<String, dynamic> json) => Student(
      id: json['id'],
      username: json['username'],
      password: json['password'],
      score: json['score']);
  Map<String, dynamic> toJson() {
    return {"username": username, "password": password, "score": score};
  }
}
