class Student {
  int? id;
  String username;
  String password;
  int score; // new field for storing the score

  Student(
      {this.id,
      required this.username,
      required this.password,
      this.score = 0});

  static fromJson(Map<String, dynamic> json) => Student(
      id: json['id'],
      username: json['username'],
      password: json['password'],
      score: json['score']);
  Map<String, dynamic> toJson() {
    return {"username": username, "password": password, "score": score};
  }
}
