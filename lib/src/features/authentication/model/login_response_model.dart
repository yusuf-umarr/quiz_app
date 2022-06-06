import 'dart:convert';

LoginResponseModel loginResponseJson(String str) =>
LoginResponseModel.fromJson(json.decode(str));

class LoginResponseModel {
  LoginResponseModel({
    required this.success,
    required this.token,
    required this.user,
  });
  late final bool success;
  late final String token;
  late final User user;
  
  LoginResponseModel.fromJson(Map<String, dynamic> json){
    success = json['success'];
    token = json['token'];
    user = User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['token'] = token;
    _data['user'] = user.toJson();
    return _data;
  }
}

class User {
  User({
    required this.id,
    required this.password,
    required this.verified,
    required this.isSeller,
    required this.V,
    required this.email,
    required this.fullName,
    required this.city,
    required this.countryState,
    required this.dob,
    required this.phone,
    required this.selectGender,
    required this.streetAddress,
    required this.postalCode,
    required this.country,
    required this.profileIMAGE,
  });
  late final String id;
  late final String password;
  late final bool verified;
  late final bool isSeller;
  late final int V;
  late final String email;
  late final String fullName;
  late final String city;
  late final String countryState;
  late final String dob;
  late final String phone;
  late final String selectGender;
  late final String streetAddress;
  late final String postalCode;
  late final String country;
  late final String profileIMAGE;
  
  User.fromJson(Map<String, dynamic> json){
    id = json['id'];
    password = json['password'];
    verified = json['verified'];
    isSeller = json['isSeller'];
    V = json['v'];
    email = json['email'];
    fullName = json['fullName'];
    city = json['city'];
    countryState = json['countryState'];
    dob = json['dob'];
    phone = json['phone'];
    selectGender = json['selectGender'];
    streetAddress = json['streetAddress'];
    postalCode = json['postalCode'];
    country = json['country'];
    profileIMAGE = json['profileIMAGE'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['password'] = password;
    _data['verified'] = verified;
    _data['isSeller'] = isSeller;
    _data['v'] = V;
    _data['email'] = email;
    _data['fullName'] = fullName;
    _data['city'] = city;
    _data['countryState'] = countryState;
    _data['dob'] = dob;
    _data['phone'] = phone;
    _data['selectGender'] = selectGender;
    _data['streetAddress'] = streetAddress;
    _data['postalCode'] = postalCode;
    _data['country'] = country;
    _data['profileIMAGE'] = profileIMAGE;
    return _data;
  }
}