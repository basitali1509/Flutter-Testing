class User1 {
  final int id;
  final String name;
  final String email;

  User1({required this.id, required this.name, required this.email});

  factory User1.fromJson(Map<String, dynamic> json) {
    return User1(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'email': email});

    return result;
  }
}