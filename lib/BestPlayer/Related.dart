import 'package:e3/BestPlayer/videoplayer.dart';
import 'package:e3/Models/classFile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Db.dart';

class Related extends StatelessWidget {
  final int videoId;
  Related(this.videoId);

  @override
  Widget build(BuildContext context) {
    List<CasteDetails> list = [];
    var imgs = [];

    Future<List<CasteDetails>> getData() async {
      list.clear();
      list.addAll(await Database.GetSpecificVideoCasting(videoId));
      return list;
    }

    return Scaffold(
      backgroundColor: Colors.black87,
      body: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Customer also watched',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        height: 80,
                        width: 150,
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'Tamil',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/images/z3.jpg',
                              ),
                            ),
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Container(
                          height: 80,
                          width: 150,
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            'Hindi',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  'assets/images/z3.jpg',
                                ),
                              ),
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Container(
                          height: 80,
                          width: 150,
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            'English',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  'assets/images/z3.jpg',
                                ),
                              ),
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                      SizedBox(width: 20),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Divider(
                  color: Colors.white,
                  thickness: 1,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(
                        'Cast & crew',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      /* subtitle: Text(
                        'Details from IMBs',
                        style: TextStyle(
                            color: Colors.white54, fontWeight: FontWeight.bold),
                      )*/
                    ),
                    Container(
                        height: 200,
                        child: FutureBuilder<List<CasteDetails>>(
                            future:
                                getData(), // function where you call your api
                            builder: (BuildContext context,
                                AsyncSnapshot<List<CasteDetails>> snapshot) {
                              // AsyncSnapshot<Your object type>
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                    child: Text('Please wait its loading...'));
                              } else {
                                if (snapshot.hasError)
                                  return Center(
                                      child: Text('Error: ${snapshot.error}'));
                                else
                                  return GridView.builder(
                                      gridDelegate:
                                          SliverGridDelegateWithMaxCrossAxisExtent(
                                              maxCrossAxisExtent: 200,
                                              childAspectRatio: 3 / 2,
                                              crossAxisSpacing: 5,
                                              mainAxisSpacing: 5),
                                      itemCount: list.length,
                                      itemBuilder:
                                          (BuildContext context, index) {
                                        imgs = list[index]
                                            .imgPath
                                            .toString()
                                            .split(',');

                                        return Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              Get.to(videoplayer(
                                                  list[index].videoId));
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              child: Text(
                                                list[index].name,
                                                style: TextStyle(
                                                    color: Colors.lightGreen,
                                                    fontSize: 20),
                                              ),
                                              decoration: BoxDecoration(
                                                  color: Colors.amber,
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                      Database.baseURL +
                                                          imgs[0].toString(),
                                                    ),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                            ),
                                          ),
                                        );
                                      }); // snapshot.data  :- get your object which is pass from your downloadData() function
                              }
                            })),
                  ],
                ),
                Divider(
                  color: Colors.white,
                  thickness: 1,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget Caste(BuildContext context) {
    List<CasteDetails> list = [];
    var imgs = [];

    Future<List<CasteDetails>> getData() async {
      list.clear();
      list.addAll(await Database.GetSpecificVideoCasting(9));
      return list;
    }

    return FutureBuilder<List<CasteDetails>>(
        future: getData(), // function where you call your api
        builder:
            (BuildContext context, AsyncSnapshot<List<CasteDetails>> snapshot) {
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
                    imgs = list[index].imgPath.toString().split(',');

                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(videoplayer(list[index].videoId));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            list[index].charcterName,
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
