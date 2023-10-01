class User {
  int id;
  String? login;
  String? avatarUrl;
  String? name;
  String? company;
  String? blog;

  User(
      this.id,
      this.login,
      this.avatarUrl,
      this.name,
      this.company,
      this.blog,
      );

  static User fromJson(json) {
    return User(
      json['id'],
      json['login'],
      json['avatar_url'],
      json['name'],
      json['company'],
      json['blog']
    );

  }
}