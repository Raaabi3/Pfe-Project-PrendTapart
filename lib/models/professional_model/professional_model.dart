// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProfessionalModel {
  String firstname;
  String lastname;
  String email;
  DateTime email_verified_at;
  String password;
  String remember_token;
  int current_team_id;
  String profile_photo_path;
  String phone_number;
  String address_line_one;
  String address_line_two;
  String zip_code;
  String country;
  String fcm_token;
  DateTime created_at;
  DateTime updated_at;
  ProfessionalModel({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.email_verified_at,
    required this.password,
    required this.remember_token,
    required this.current_team_id,
    required this.profile_photo_path,
    required this.phone_number,
    required this.address_line_one,
    required this.address_line_two,
    required this.zip_code,
    required this.country,
    required this.fcm_token,
    required this.created_at,
    required this.updated_at,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'email_verified_at': email_verified_at.millisecondsSinceEpoch,
      'password': password,
      'remember_token': remember_token,
      'current_team_id': current_team_id,
      'profile_photo_path': profile_photo_path,
      'phone_number': phone_number,
      'address_line_one': address_line_one,
      'address_line_two': address_line_two,
      'zip_code': zip_code,
      'country': country,
      'fcm_token': fcm_token,
      'created_at': created_at.millisecondsSinceEpoch,
      'updated_at': updated_at.millisecondsSinceEpoch,
    };
  }

  factory ProfessionalModel.fromMap(Map<String, dynamic> map) {
    return ProfessionalModel(
      firstname: map['firstname'] as String,
      lastname: map['lastname'] as String,
      email: map['email'] as String,
      email_verified_at: DateTime.fromMillisecondsSinceEpoch(map['email_verified_at'] as int),
      password: map['password'] as String,
      remember_token: map['remember_token'] as String,
      current_team_id: map['current_team_id'] as int,
      profile_photo_path: map['profile_photo_path'] as String,
      phone_number: map['phone_number'] as String,
      address_line_one: map['address_line_one'] as String,
      address_line_two: map['address_line_two'] as String,
      zip_code: map['zip_code'] as String,
      country: map['country'] as String,
      fcm_token: map['fcm_token'] as String,
      created_at: DateTime.fromMillisecondsSinceEpoch(map['created_at'] as int),
      updated_at: DateTime.fromMillisecondsSinceEpoch(map['updated_at'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfessionalModel.fromJson(String source) => ProfessionalModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
