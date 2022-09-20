import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:task_flutter/page/NewsDescription/NewsDescription.dart';

import '../../../Model/News.dart';

class NewsListTile extends StatelessWidget {
  int index = 0;
  NewsListTile({required this.index});
  @override
  Widget build(BuildContext context) {
    News news = Provider.of<News>(context);
    List<Artical> list = news.articals_list;
    Artical artical = list[index];
    if (artical.urlToImage.contains("carscoops") ||
        artical.urlToImage.contains("svg")) return Container();
    try {
      return GestureDetector(
        onTap: () {
          openPage(page: NewsDescription(index: index), context: context);
        },
        child: Card(
          elevation: 5,
          margin: EdgeInsets.only(top: 12, bottom: 12, left: 16, right: 16),
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: "${artical.urlToImage}",
                height: 230,
                fit: BoxFit.fill,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              Container(
                height: 230,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black12,
                    Colors.black87,
                  ],
                )),
                child: BodyListTile(index: index),
              )
            ],
          ),
        ),
      );

    } on Exception catch (e) {
      return Container();
    }
  }

  void openPage({required var page, required BuildContext context}) {
    Navigator.push(context, route(page));
  }

  MaterialPageRoute route(var page) {
    return MaterialPageRoute(builder: (context) => page);
  }
}

class BodyListTile extends StatelessWidget {
  int index = 0;
  BodyListTile({required this.index});
  @override
  Widget build(BuildContext context) {
    News news = Provider.of<News>(context);
    List<Artical> list = news.articals_list;

    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${list[index].title}",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(186, 186, 186, 1)),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                "${list[index].source}",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 9,
                    color: Color.fromRGBO(186, 186, 186, 1)),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "${list[index].publishedAt}",
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 9,
                    color: Color.fromRGBO(186, 186, 186, 1)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
