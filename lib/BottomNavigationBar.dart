import 'package:e3/Demo.dart';
import 'package:e3/category/CatHome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'Color/color.dart';
import 'category/VideoCollections.dart';

class BottomNavigationBarH extends StatefulWidget {
  const BottomNavigationBarH({Key? key}) : super(key: key);

  @override
  _BottomNavigationBarHState createState() => _BottomNavigationBarHState();
}

class _BottomNavigationBarHState extends State<BottomNavigationBarH> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  List<Widget> _widgetOptions = <Widget>[
    //HomePage(),


    videocollections(),

    Text(
      'In Progress',
      style: optionStyle,
    ),
    Text(
      'In Progress',
      style: optionStyle,
    ),
    Text(
      'In Progress',
      style: optionStyle,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mBackgroundColor,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: Text(
          'Categories',
          style: TextStyle(
              color: mWhite, fontSize: 18, fontWeight: FontWeight.w400),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications),
            color: mWhite,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more),
            color: mWhite,
          ),
        ],
      ),
      backgroundColor: mWhite,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: mBackgroundColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: mBackgroundColor,
              hoverColor: mBackgroundColor,
              gap: 8,
              activeColor: mWhite,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: mBackgroundColor,
              color: mWhite,
              tabs: [
                GButton(
                  icon: Icons.flash_on,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.ballot,
                  text: 'Categories',
                ),
                GButton(
                  icon: Icons.star,
                  text: 'StarsUp',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
