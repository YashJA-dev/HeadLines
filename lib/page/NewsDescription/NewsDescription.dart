import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:task_flutter/Model/News.dart';

import '../HomePage/NewsListBuilder/NewListTile.dart';
import 'DescriptionContent.dart';

class NewsDescription extends StatelessWidget {
  int index = 0;
  NewsDescription({required this.index});
  @override
  Widget build(BuildContext context) {
    News news = Provider.of<News>(context);
    List<Artical> list = news.articals_list;
    Artical artical = list[index];
    var backButton = Container(
      margin: EdgeInsets.only(left: 10),
      height: 10,
      width: 10,
      child: FittedBox(
        child: ClipOval(
          child: Material(
            color: Colors.black45, // Button color
            child: InkWell(
                splashColor: Colors.black, // Splash color
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: SizedBox(
                    width: 46, height: 46, child: Icon(Icons.arrow_back))),
          ),
        ),
      ),
    );
    return Stack(
      children: [
        CachedNetworkImage(
                imageUrl: "${artical.urlToImage}",
                  height: double.infinity * 1.0,

                fit: BoxFit.fill,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
        Container(
          height: double.infinity * 1.0,
          width: double.infinity * 1.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black12,
                Colors.black87,
              ],
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              leading: backButton),
          body: DescriptionContent(index: index),
        ),
      ],
    );
  }
}
