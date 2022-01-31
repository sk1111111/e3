import 'package:e3/BestPlayer/Best.dart';
import 'package:e3/Database.dart';
import 'package:e3/Models/classFile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class Gqq extends StatefulWidget {
  const Gqq({Key? key}) : super(key: key);

  @override
  _GqqState createState() => _GqqState();
}

class _GqqState extends State<Gqq> {
  List<VideoDetails> list = [];

  getData() async {
    setState(() async {
      list.clear();
      list.addAll(await Database.GetVideos());
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  Widget build(BuildContext context) {
    var _crossAxisSpacing = 8;
    var _screenWidth = MediaQuery.of(context).size.width;
    var _crossAxisCount = 2;
    var _width = (_screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) /
        _crossAxisCount;
    var cellHeight = 80;
    var _aspectRatio = _width / cellHeight;
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Container(
        height: 120,
        child: ListView.builder(
          itemCount: list.length,
          padding: EdgeInsets.only(left: 1.0, right: 16),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Expanded(
              child: GestureDetector(
                onTap: () {
                  // Get.to(Best(list[index].videoId));
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    list[index].title,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "https://chocolata.in/" +
                              list[index].bannerImagePath1.toString(),
                        ),
                      ),
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
