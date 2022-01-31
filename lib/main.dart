import 'dart:io';

import 'package:e3/BestPlayer/Best.dart';
import 'package:e3/BottomNavigationBar.dart';
import 'package:e3/Demo.dart';
import 'package:e3/category/CatHome.dart';
import 'package:e3/category/VideoCollections.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'cert.dart';

void main() {
  HttpOverrides.global = DevHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:
      videocollections(),
         // ChildApp(),
    );
  }
}
