class UserModel {
  String? uid;
  String? name;
  String? createAt;
  String? lastSignInTime;
  String? email;
  String? photoUrl;

  UserModel(
      {this.uid,
      this.name,
      this.createAt,
      this.lastSignInTime,
      this.email,
      this.photoUrl});

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    createAt = json['createAt'];
    lastSignInTime = json['lastSignInTime'];
    email = json['email'];
    photoUrl = json['photoUrl'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['uid'] = uid;
    data['name'] = name;
    data['createAt'] = createAt;
    data['lastSignInTime'] = lastSignInTime;
    data['email'] = email;
    data['photoUrl'] = photoUrl;
    return data;
  }
}
