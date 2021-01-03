import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kablosuzbeyin/models/Recommendations.dart';

class EventDetails extends StatelessWidget {
  final RecommendedModel cafedetails;
  EventDetails(this.cafedetails);
  var top = 0.0;
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.transparent,
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              leading: IconButton(
                icon: Icon(Icons.keyboard_arrow_left),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: [
                IconButton(icon: Icon(Icons.more_horiz), onPressed: () {}),
              ],
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  //print('constraints=' + constraints.toString());
                  top = constraints.biggest.height;
                  return Stack(
                    overflow: Overflow.visible,
                    alignment: Alignment.center,
                    children: [
                      Image(
                        width: MediaQuery.of(context).size.width,
                        image: NetworkImage(cafedetails.image),
                        height: MediaQuery.of(context).size.height / 3.3,
                        fit: BoxFit.cover,
                      ),
                      Text(cafedetails.name)
                    ],
                  );
                },
              ),
            ),
          ];
        },
        body: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 80)),
          ],
        ),
      ),
    );
  }
}
