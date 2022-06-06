import 'dart:convert';

RegisterResponseModel registerResponseModel(String str) =>
RegisterResponseModel.fromJson(json.decode(str));

class RegisterResponseModel {
  RegisterResponseModel({
    required this.user,
    required this.success,
  });
  late final User user;
  late final bool success;
  
  RegisterResponseModel.fromJson(Map<String, dynamic> json){
    user = User.fromJson(json['user']);
    // user = User.fromJson(json['user']);
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user'] = user.toJson();
    _data['success'] = success;
    return _data;
  }
}

class User {
  User({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.password,
    required this.country,
    required this.countryState,
    required this.streetAddress,
    required this.dob,
    required this.city,
    required this.postalCode,
    required this.selectGender,
    required this.verified,
    required this.isSeller,
    required this.id,
    required this.v,
  });
  late final String fullName;
  late final String email;
  late final String phone;
  late final String password;
  late final String country;
  late final String countryState;
  late final String streetAddress;
  late final String dob;
  late final String city;
  late final String postalCode;
  late final String selectGender;
  late final bool verified;
  late final bool isSeller;
  late final String id;
  late final int v;
  
  User.fromJson(Map<String, dynamic> json){
    fullName = json['fullName'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    country = json['country'];
    countryState = json['countryState'];
    streetAddress = json['streetAddress'];
    dob = json['dob'];
    city = json['city'];
    postalCode = json['postalCode'];
    selectGender = json['selectGender'];
    verified = json['verified'];
    isSeller = json['isSeller'];
    id = json['id'];
    v = json['v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['fullName'] = fullName;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['password'] = password;
    _data['country'] = country;
    _data['countryState'] = countryState;
    _data['streetAddress'] = streetAddress;
    _data['dob'] = dob;
    _data['city'] = city;
    _data['postalCode'] = postalCode;
    _data['selectGender'] = selectGender;
    _data['verified'] = verified;
    _data['isSeller'] = isSeller;
    _data['id'] = id;
    _data['v'] = v;
    return _data;
  }
}

