import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_flutter/page/HomePage/NewsListBuilder/NewListTile.dart';

import '../../../Model/News.dart';

class NewsListBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    News news = Provider.of<News>(context);
    int length = news.articals_list.length;
    return Container(
      decoration: BoxDecoration(color: Color.fromRGBO(70, 70, 70, 1)),
      child: length == 0
          ? Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/netUnstable.png"),
                    fit: BoxFit.scaleDown),
              ),
            )
          : ListView.builder(
              itemCount: length,
              itemBuilder: (context, index) {
                return NewsListTile(index: index);
              },
            ),
    );
  }
}
