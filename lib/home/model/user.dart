class User {
  int id;
  String name;
  String avatartUrl;
  String followersUrl;

  User({this.id, this.name, this.avatartUrl, this.followersUrl});

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        id: map['id'] as int,
        name: map['login'] as String,
        avatartUrl: map['avatar_url'] as String,
        followersUrl: map['followers_url'] as String);
  }
}
