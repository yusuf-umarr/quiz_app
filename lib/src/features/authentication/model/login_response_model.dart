// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
    LoginResponseModel({
        this.success,
        this.token,
        this.user,
    });

    bool? success;
    String? token;
    User? user;

    factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
        success: json["success"] == null ? null : json["success"],
        token: json["token"] == null ? null : json["token"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "token": token == null ? null : token,
        "user": user == null ? null : user!.toJson(),
    };
}

class User {
    User({
        this.id,
        this.password,
        this.verified,
        this.isSeller,
        this.v,
        this.email,
        this.fullName,
        this.city,
        this.countryState,
        this.dob,
        this.phone,
        this.selectGender,
        this.streetAddress,
        this.postalCode,
        this.country,
        this.profileImage,
    });

    String? id;
    String? password;
    bool? verified;
    bool? isSeller;
    int? v;
    String? email;
    String? fullName;
    String? city;
    String? countryState;
    DateTime? dob;
    String? phone;
    String? selectGender;
    String? streetAddress;
    String? postalCode;
    String? country;
    String? profileImage;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"] == null ? null : json["_id"],
        password: json["password"] == null ? null : json["password"],
        verified: json["verified"] == null ? null : json["verified"],
        isSeller: json["isSeller"] == null ? null : json["isSeller"],
        v: json["__v"] == null ? null : json["__v"],
        email: json["email"] == null ? null : json["email"],
        fullName: json["fullName"] == null ? null : json["fullName"],
        city: json["city"] == null ? null : json["city"],
        countryState: json["countryState"] == null ? null : json["countryState"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        phone: json["phone"] == null ? null : json["phone"],
        selectGender: json["selectGender"] == null ? null : json["selectGender"],
        streetAddress: json["streetAddress"] == null ? null : json["streetAddress"],
        postalCode: json["postalCode"] == null ? null : json["postalCode"],
        country: json["country"] == null ? null : json["country"],
        profileImage: json["profileIMAGE"] == null ? null : json["profileIMAGE"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "password": password == null ? null : password,
        "verified": verified == null ? null : verified,
        "isSeller": isSeller == null ? null : isSeller,
        "__v": v == null ? null : v,
        "email": email == null ? null : email,
        "fullName": fullName == null ? null : fullName,
        "city": city == null ? null : city,
        "countryState": countryState == null ? null : countryState,
        "dob": dob == null ? null : "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "phone": phone == null ? null : phone,
        "selectGender": selectGender == null ? null : selectGender,
        "streetAddress": streetAddress == null ? null : streetAddress,
        "postalCode": postalCode == null ? null : postalCode,
        "country": country == null ? null : country,
        "profileIMAGE": profileImage == null ? null : profileImage,
    };
}
