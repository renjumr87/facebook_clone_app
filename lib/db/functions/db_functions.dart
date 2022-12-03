import 'package:flutter/material.dart';
import 'package:testing/db/model/profile_model.dart';

ValueNotifier<List<ProfileModel>> profileListNotifier = ValueNotifier([]);

void createProfile(ProfileModel profileModel) {
  profileListNotifier.value.add(profileModel);
  profileListNotifier.notifyListeners;
  // print(profileModel.toString());
}
