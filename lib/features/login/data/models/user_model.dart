// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.statusCode,
    this.message,
    this.data,
  });

  int? statusCode;
  String? message;
  Data? data;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        statusCode: json["statusCode"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "data": data == null ? null : data?.toJson(),
      };
}

class Data {
  Data({
    this.user,
    this.token,
  });

  User? user;
  String? token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user == null ? null : user?.toJson(),
        "token": token,
      };
}

class User {
  User({
    this.id,
    this.name,
    this.username,
    this.email,
    this.emailVerifiedAt,
    this.phone,
    this.phoneVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.roleId,
    this.status,
    this.language,
    this.isPaid,
    this.tapCustomerId,
    this.deletedAt,
    this.role,
    this.clients,
  });

  int? id;
  String? name;
  String? username;
  String? email;
  dynamic emailVerifiedAt;
  String? phone;
  dynamic phoneVerifiedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? roleId;
  String? status;
  String? language;
  String? isPaid;
  dynamic tapCustomerId;
  dynamic deletedAt;
  Role? role;
  List<int>? clients;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        phone: json["phone"],
        phoneVerifiedAt: json["phone_verified_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        roleId: json["role_id"],
        status: json["status"],
        language: json["language"],
        isPaid: json["is_paid"],
        tapCustomerId: json["tap_customer_id"],
        deletedAt: json["deleted_at"],
        role: json["role"] == null ? null : Role.fromJson(json["role"]),
        clients: json["clients"] == null
            ? null
            : List<int>.from(json["clients"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "phone": phone,
        "phone_verified_at": phoneVerifiedAt,
        "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
        "role_id": roleId,
        "status": status,
        "language": language,
        "is_paid": isPaid,
        "tap_customer_id": tapCustomerId,
        "deleted_at": deletedAt,
        "role": role == null ? null : role?.toJson(),
        "clients":
            clients == null ? null : List<dynamic>.from(clients!.map((x) => x)),
      };
}

class Role {
  Role({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.description,
    this.privilege,
  });

  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? name;
  String? description;
  String? privilege;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        name: json["name"],
        description: json["description"],
        privilege: json["privilege"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
        "name": name,
        "description": description,
        "privilege": privilege,
      };
}
