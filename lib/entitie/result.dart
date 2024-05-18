class Result {
  final int id;
  final String name;
  final String username;

  Result({required this.id, required this.name, required this.username});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
        id: json['id'], name: json['name'], username: json['username']);
  }
}
