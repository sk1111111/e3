// import 'package:e3/BestPlayer/videoplayer.dart';
// import 'package:e3/Color/color.dart';
// import 'package:e3/category/VideoCollections.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import 'Db.dart';
// import 'Models/classFile.dart';
//
// class Demo extends StatefulWidget {
//   const Demo({Key? key}) : super(key: key);
//
//   @override
//   _DemoState createState() => _DemoState();
// }
//
// class _DemoState extends State<Demo> {
//   List<VideoDetails> list = [];
//   var imgs = [];
//
//   Future<List<VideoDetails>> getData() async {
//     list.clear();
//     list.addAll(await Database.GetVideos());
//     return list;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: [
//           GestureDetector(
//             onTap: () {
//               Get.to(videocollections());
//             },
//             child: Padding(
//               padding: const EdgeInsets.only(top: 10.0, bottom: 10),
//               child: Text(
//                 'Latest videos >',
//                 style: TextStyle(
//                     color: mBackgroundColor, fontWeight: FontWeight.bold),
//               ),
//             ),
//           ),
//           Container(
//             height: 100,
//             child: Padding(
//               padding: const EdgeInsets.all(2.0),
//               child: FutureBuilder<List<VideoDetails>>(
//                   future: getData(), // function where you call your api
//                   builder: (BuildContext context,
//                       AsyncSnapshot<List<VideoDetails>> snapshot) {
//                     // AsyncSnapshot<Your object type>
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return Center(child: Text('Please wait its loading...'));
//                     } else {
//                       if (snapshot.hasError)
//                         return Center(child: Text('Error: ${snapshot.error}'));
//                       else
//                         return ListView.builder(
//                           itemCount: list.length,
//                           padding: EdgeInsets.only(left: 1.0, right: 16),
//                           scrollDirection: Axis.horizontal,
//                           itemBuilder: (BuildContext context, index) {
//                             imgs = list[index]
//                                 .bannerImagePath1
//                                 .toString()
//                                 .split(',');
//
//                             return Padding(
//                               padding: const EdgeInsets.all(2.0),
//                               child: Container(
//                                 height: 100,
//                                 width: 180,
//                                 child: GestureDetector(
//                                   onTap: () {
//                                     Get.to(videoplayer(list[index].videoId));
//                                   },
//                                   child: Container(
//                                     alignment: Alignment.center,
//                                     child: Text(
//                                       list[index].title,
//                                       style: TextStyle(
//                                           color: Colors.white, fontSize: 20),
//                                     ),
//                                     decoration: BoxDecoration(
//                                         color: Colors.amber,
//                                         image: DecorationImage(
//                                           fit: BoxFit.cover,
//                                           image: NetworkImage(
//                                             Database.baseURL +
//                                                 imgs[0].toString(),
//                                           ),
//                                         ),
//                                         borderRadius: BorderRadius.circular(5)),
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                         ); // snapshot.data  :- get your object which is pass from your downloadData() function
//                     }
//                   }),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class ChildApp extends StatefulWidget {
  ChildAppState createState() => ChildAppState();
}

class ChildAppState extends State<ChildApp> {
  final textController = TextEditingController();

  int charLength = 0;

  bool status = false;

  _onChanged(String value) {
    setState(() {
      charLength = value.length;
    });

    if (charLength == 10) {
      setState(() {
        status = true;
      });
    } else {
      setState(() {
        status = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(8.0),
              child:
                  Text("Length = $charLength", style: TextStyle(fontSize: 20))),
          Container(
              width: 280,
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: textController,
                autocorrect: true,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'Enter Number Here'),
                onChanged: _onChanged,
              )),
          Visibility(
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: status,
              child: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Center(
                    child: RaisedButton(
                      child: Text('Submit Your Data'),
                      onPressed: () => {print('Button Clicked')},
                      color: Colors.green,
                      textColor: Colors.white,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    ),
                  ))),
        ],
      ),
    ));
  }
}
