class User {
  String? username;
  String? email;
  bool? isActive;

  User({this.username, this.email, this.isActive});

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['username'] = username;
    data['email'] = email;
    data['is_active'] = isActive;
    return data;
  }
}
