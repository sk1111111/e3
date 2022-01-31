import 'package:e3/BestPlayer/MoreDetails.dart';
import 'package:e3/BestPlayer/Related.dart';
import 'package:flutter/material.dart';

class PageTab extends StatefulWidget {
  final int videoId;
  PageTab(this.videoId);

  @override
  _PageTabState createState() => _PageTabState();
}

class _PageTabState extends State<PageTab> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black87,
              toolbarHeight: 50,
              // flexibleSpace: Container(
              //   decoration: BoxDecoration(
              //     gradient: LinearGradient(
              //       colors: [Colors.black38, Colors.black87],
              //       begin: Alignment.bottomRight,
              //       end: Alignment.topLeft,
              //     ),
              //   ),
              // ),
              bottom: new TabBar(
                //isScrollable: true,

                indicatorColor: Colors.white,
                indicatorWeight: 2,
                tabs: [
                  Tab(text: 'Related'),
                  Tab(text: 'More details'),
                ],
              ),
              elevation: 20,
              titleSpacing: 20,
            ),
            body: TabBarView(
              physics:
                  //ClampingScrollPhysics(),
                  NeverScrollableScrollPhysics(),
              children: [
                Related(widget.videoId),
                MoreDetails(),
              ],
            ),
          ),
        ),
      );

  Widget buildPage(String text) => Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 28),
        ),
      );
}
