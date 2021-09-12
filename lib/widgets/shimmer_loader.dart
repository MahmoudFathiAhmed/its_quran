import 'package:flutter/material.dart';
import 'package:fade_shimmer/fade_shimmer.dart';

class ShimmerLoader extends StatelessWidget {
  const ShimmerLoader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (int i = 0; i < 10; i++)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: FadeShimmer(
                    height: 126,
                    width: 126,
                    radius: 10,
                    baseColor: Colors.grey.withOpacity(0.6),
                    highlightColor: Theme.of(context).accentColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: FadeShimmer(
                    height: 6,
                    width: 126,
                    radius: 10,
                    baseColor: Colors.grey,
                    highlightColor: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: FadeShimmer(
                    height: 8,
                    width: 50,
                    radius: 10,
                    baseColor: Colors.grey,
                    highlightColor: Colors.white,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
