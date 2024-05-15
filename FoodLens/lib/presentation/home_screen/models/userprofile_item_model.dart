import 'package:flutter/material.dart';

/// This class is used in the [userprofile_item_widget] screen.
// ignore_for_file: must_be_immutable

class UserprofileItemModel {
  UserprofileItemModel({this.rewindController, this.id}) {
    rewindController = rewindController ?? TextEditingController();
    id = id ?? "";
  }

  TextEditingController? rewindController;

  String? id;
}
