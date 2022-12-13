import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../screens/details.dart';

class HorizontalPlaceItem extends StatelessWidget {
  final Map? place;

  HorizontalPlaceItem({this.place});

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: Column(
        children: AnimationConfiguration.toStaggeredList(
            duration: const Duration(seconds: 1),
            childAnimationBuilder: (p0) => FlipAnimation(
                  child: SlideAnimation(
                    child: FadeInAnimation(
                      child: p0,
                    ),
                  ),
                ),
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: InkWell(
                  child: Container(
                    height: 250.0,
                    width: 140.0,
                    child: Column(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "${place!["img"]}",
                            height: 178.0,
                            width: 140.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 7.0),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "${place!["name"]}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),
                            maxLines: 2,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(height: 3.0),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "${place!["location"]}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13.0,
                              color: Colors.blueGrey[300],
                            ),
                            maxLines: 1,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return Details();
                        },
                      ),
                    );
                  },
                ),
              ),
            ]),
      ),
    );
  }
}
