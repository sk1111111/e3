import 'package:e3/BestPlayer/Best.dart';
import 'package:e3/BestPlayer/videoplayer.dart';
import 'package:e3/Models/classFile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Database.dart';

class videocollections extends StatefulWidget {
  @override
  _videocollectionsState createState() => _videocollectionsState();
}

class _videocollectionsState extends State<videocollections> {
  List<VideoDetails> list = [];
  var imgs = [];
  Future<List<VideoDetails>> getData() async {
    list.clear();
    list.addAll(await Database.GetVideos());
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<VideoDetails>>(
        future: getData(), // function where you call your api
        builder:
            (BuildContext context, AsyncSnapshot<List<VideoDetails>> snapshot) {
          // AsyncSnapshot<Your object type>
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text('Please wait its loading...'));
          } else {
            if (snapshot.hasError)
              return Center(child: Text('Error: ${snapshot.error}'));
            else
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5),
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, index) {
                    imgs = list[index].bannerImagePath1.toString().split(',');

                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(videoplayer(list[index].videoId));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            list[index].title,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  Database.baseURL + imgs[0].toString(),
                                ),
                              ),
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                    );
                  }); // snapshot.data  :- get your object which is pass from your downloadData() function
          }
        });
  }
}
