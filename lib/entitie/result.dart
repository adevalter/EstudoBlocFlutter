class Users {
  final int id;
  final String name;
  final String username;

  Users({required this.id, required this.name, required this.username});

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
        id: json['id'], name: json['name'], username: json['username']);
  }
}
