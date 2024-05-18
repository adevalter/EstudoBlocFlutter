class Post {
  final int id;
  final String name;
  final String username;

  Post({required this.id, required this.name, required this.username});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(id: json['id'], name: json['name'], username: json['username']);
  }
}
