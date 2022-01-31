import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class Util {
  //Image compression percentage must be between 0 to 100
  static int pictureQuality = 50;
  static int pictureQualityAfterAttachingTag = 100;

  static Color back = Colors.white, red = Colors.red, textColor = Colors.black;

  static width() => MediaQuery.of(Get.context!).size.width;

  static height() => MediaQuery.of(Get.context!).size.height;

  static toast(String m) => ScaffoldMessenger.of(Get.context!)
      .showSnackBar(SnackBar(content: Text(m)));

  static statusBarHeight() => MediaQuery.of(Get.context!).padding.top;

  static Future<String> getFilePath(String path) async {
    Directory? directory = await getExternalStorageDirectory();
    if (directory?.path != null) return "${directory?.path}/$path";
    return "";
  }
}
