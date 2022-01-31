import 'package:flutter/material.dart';

class MoreDetails extends StatelessWidget {
  const MoreDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text(
                  'Genres',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  'Drama',
                  style: TextStyle(color: Colors.white54),
                ),
              ),
              Divider(
                color: Colors.white,
              ),
              ListTile(
                title: Text(
                  'Directors',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  'Gnanvel',
                  style: TextStyle(color: Colors.white54),
                ),
              ),
              Divider(
                color: Colors.white,
              ),
              ListTile(
                title: Text(
                  'Starring',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  'Surya, Prakask Raj, Ramesh',
                  style: TextStyle(color: Colors.white54),
                ),
              ),
              Divider(
                color: Colors.white,
              ),
              ListTile(
                title: Text(
                  'StaStudiosrring',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  '2D Entertainment',
                  style: TextStyle(color: Colors.white54),
                ),
              ),
              Divider(
                color: Colors.white,
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Costomer reviews',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 5,
                    ),
                    Text('We don\'t have any cutomer reviews',
                        style: TextStyle(color: Colors.white)),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Did you know?',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 5,
                    ),
                    Text('This is inspired by real life case.',
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
