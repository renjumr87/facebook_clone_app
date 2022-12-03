// ignore_for_file: unused_import

import 'package:hive_flutter/hive_flutter.dart';
// import 'package:build_runner/build_runner.dart';
// import 'package:hive_flutter/adapters.dart';
part 'profile_model.g.dart';

@HiveType(typeId: 1)
class ProfileModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String firstName;
  @HiveField(2)
  final String lastName;
  @HiveField(3)
  final String email;
  @HiveField(4)
  final String mobile;
  @HiveField(5)
  final String password;
  @HiveField(6)
  final String dateOfBirth;
  @HiveField(7)
  final String gender;

  ProfileModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobile,
    required this.password,
    required this.dateOfBirth,
    required this.gender,
  });
}
