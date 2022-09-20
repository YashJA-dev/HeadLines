import 'package:intl/intl.dart';

class Api {
  String _url_news =
      "https://newsapi.org/v2/everything?q=tesla&from=${DateFormat()
            .addPattern("dd-mm-yyyy")
            .format(DateTime.now())
            .toString()}&sortBy=publishedAt&apiKey=3822aa009b08429fa18f8303d3eeb129";
  String get url_news => this._url_news;
}
