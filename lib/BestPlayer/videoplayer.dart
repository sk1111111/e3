import 'package:better_player/better_player.dart';
import 'package:e3/Models/classFile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Database.dart';
import 'PageTab.dart';

class videoplayer extends StatefulWidget {
  final int videoId;
  videoplayer(this.videoId);
  @override
  _videoplayerState createState() => _videoplayerState();
}

class _videoplayerState extends State<videoplayer> {
  late Widget networkPlayerWidget;
  List<VideoDetails> list = [];
  List<CasteDetails> castList = [];
  Future<List<VideoDetails>> getData() async {
    list.clear();
    list.addAll(await Database.GetSpecificVideo(widget.videoId));
    castList.clear();
    castList.addAll(await Database.GetSpecificVideoCasting(widget.videoId));
    return list;
  }

  @override
  void initState() {
    super.initState();
    getData();
    // networkPlayerWidget = AspectRatio(
    //   aspectRatio: 16 / 9,
    //   child: BetterPlayerListVideoPlayer(
    //     BetterPlayerDataSource(
    //       BetterPlayerDataSourceType.network,
    //       list[0].videoPath.toString().length == 0
    //           ? 'https://assets.mixkit.co/videos/preview/mixkit-group-of-friends-partying-happily-4640-large.mp4'
    //           : "https://chocolata.in/" + list[0].videoPath.toString(),
    //       liveStream: false,
    //       useAsmsSubtitles: true,
    //       asmsTrackNames: [
    //         "Low quality",
    //         "Not so low quality",
    //         "Medium quality"
    //       ],
    //       subtitles: [
    //         BetterPlayerSubtitlesSource(
    //           type: BetterPlayerSubtitlesSourceType.network,
    //           name: "EN",
    //           urls: [
    //             "https://dl.dropboxusercontent.com/s/71nzjo2ux3evxqk/example_subtitles.srt"
    //           ],
    //         ),
    //         BetterPlayerSubtitlesSource(
    //           type: BetterPlayerSubtitlesSourceType.network,
    //           name: "DE",
    //           urls: [
    //             "https://dl.dropboxusercontent.com/s/71nzjo2ux3evxqk/example_subtitles.srt"
    //           ],
    //         ),
    //       ],
    //     ),
    //     key: Key(
    //         "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4"
    //             .hashCode
    //             .toString()),
    //     playFraction: 0.8,
    //   ),
    //   // child: BetterPlayer.network(
    //   //   'https://kanyaaresidency.com/Video/Rhymes/Rhymes2.mp4',
    //   //   betterPlayerConfiguration: BetterPlayerConfiguration(
    //   //     aspectRatio: 16 / 9,
    //   //     fullScreenAspectRatio: 16 / 9,
    //   //     autoPlay: true,
    //   //     placeholder: Center(child: CircularProgressIndicator()),
    //   //     allowedScreenSleep: false,
    //   //   ),
    //   // ),
    // );
    /*networkPlayerWidget = AspectRatio(
      aspectRatio: 16 / 9,
      child: BetterPlayer.network(
        list[0].videoPath.toString().length == 0
            ? 'https://assets.mixkit.co/videos/preview/mixkit-group-of-friends-partying-happily-4640-large.mp4'
            : "https://chocolata.in/" + list[0].videoPath.toString(),
        betterPlayerConfiguration: BetterPlayerConfiguration(
          aspectRatio: 16 / 9,
          fullScreenAspectRatio: 16 / 9,
          autoPlay: true,
          placeholder: Center(child: CircularProgressIndicator()),
          allowedScreenSleep: false,
        ),
      ),
    );*/
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.black87,
            body: FutureBuilder<List<VideoDetails>>(
                future: getData(), // function where you call your api
                builder: (BuildContext context,
                    AsyncSnapshot<List<VideoDetails>> snapshot) {
                  // AsyncSnapshot<Your object type>
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    if (snapshot.hasError)
                      return Center(child: Text('Error: ${snapshot.error}'));
                    else {
                      return ListView(
                        physics: ClampingScrollPhysics(),
                        //NeverScrollableScrollPhysics(),
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: AspectRatio(
                                  aspectRatio: 16 / 9,
                                  child: BetterPlayer.network(
                                    list[0].videoPath.toString().length == 0
                                        ? 'https://assets.mixkit.co/videos/preview/mixkit-group-of-friends-partying-happily-4640-large.mp4'
                                        : "https://chocolata.in/" +
                                            list[0].videoPath.toString(),
                                    betterPlayerConfiguration:
                                        BetterPlayerConfiguration(
                                      aspectRatio: 16 / 9,
                                      fullScreenAspectRatio: 16 / 9,
                                      autoPlay: true,
                                      placeholder: Center(
                                          child: CircularProgressIndicator()),
                                      allowedScreenSleep: false,
                                    ),
                                  ),
                                ),
                                // BetterPlayer.network(
                                //   list[0].videoPath.toString().length == 0
                                //       ? 'https://assets.mixkit.co/videos/preview/mixkit-group-of-friends-partying-happily-4640-large.mp4'
                                //       : "https://chocolata.in/" +
                                //           list[0].videoPath.toString(),
                                //   betterPlayerConfiguration:
                                //       BetterPlayerConfiguration(
                                //     aspectRatio: 16 / 9,
                                //     fullScreenAspectRatio: 16 / 9,
                                //     autoPlay: true,
                                //     placeholder: Center(
                                //         child: CircularProgressIndicator()),
                                //     allowedScreenSleep: false,
                                //   ),
                                // ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  list[0].genreNames + ' - ' + list[0].language,
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(children: [
                                    Material(
                                        elevation: 4.0,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        child: Container(
                                            height: 40.0,
                                            width: 40.0,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.0)),
                                            child: Icon(
                                              Icons.favorite,
                                              color: Colors.red,
                                            ))),
                                    Text(
                                      'favorite',
                                      style: TextStyle(color: Colors.white54),
                                    )
                                  ]),
                                  Column(children: [
                                    Material(
                                        elevation: 4.0,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        child: Container(
                                            height: 40.0,
                                            width: 40.0,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.0)),
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.red,
                                            ))),
                                    Text(
                                      'WatchList',
                                      style: TextStyle(color: Colors.white54),
                                    )
                                  ]),
                                  Column(children: [
                                    Material(
                                        elevation: 4.0,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        child: Container(
                                            height: 40.0,
                                            width: 40.0,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.0)),
                                            child: Icon(
                                              Icons.share,
                                              color: Colors.red,
                                            ))),
                                    Text(
                                      'share',
                                      style: TextStyle(color: Colors.white54),
                                    )
                                  ]),
                                  Column(children: [
                                    Material(
                                        elevation: 4.0,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        child: Container(
                                            height: 40.0,
                                            width: 40.0,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.0)),
                                            child: Icon(
                                              Icons.comment,
                                              color: Colors.red,
                                            ))),
                                    Text(
                                      'Comments',
                                      style: TextStyle(color: Colors.white54),
                                    )
                                  ]),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                  height: 200,
                                  width: double.infinity,
                                  // width: (MediaQuery.of(context).size.width / 4 +
                                  //         MediaQuery.of(context).size.width / 2) -
                                  //     10.0,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Description',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        list[0].description,
                                        style: TextStyle(color: Colors.white70),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                  height: MediaQuery.of(context).size.height,
                                  child: PageTab(widget.videoId)),
                            ],
                          )
                        ],
                      );
                    } // snapshot.data  :- get your object which is pass from your downloadData() function
                  }
                })));
  }
}
