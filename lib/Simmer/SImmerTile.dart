import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerTile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 12, bottom: 12, left: 16, right: 16),

      child: Shimmer.fromColors(
        baseColor: Colors.grey[500]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          height: 230,
          width: double.infinity,
          color: Colors.white,
        ),
      ),
    );
  }
}