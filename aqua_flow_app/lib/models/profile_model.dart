class ProfileModel {
  var username;
  var del_location;
  var phone;
  var profile_picture;

  ProfileModel({
    this.username,
    this.del_location,
    this.phone,
    this.profile_picture,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
        username: json['username'],
        del_location: json['del_location'],
        phone: json['phone'],
        profile_picture: json['profile_picture']);
  }
}
