import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:task_flutter/Database/NewsDataBase.dart';

import '../Model/News.dart';
import 'Api.dart';
import 'package:http/http.dart' as http;

class NewsFetcher {
  String url = "";
  NewsFetcher() {
    url = Api().url_news;
  }
  Future<News> fetchNews() async {
    Uri uri = Uri.parse(url);
    var response = await http.get(uri);
    var decodeResponce = jsonDecode(response.body);
    String status = decodeResponce["status"];
    var articals = decodeResponce["articles"];
    if (status != "ok") {
      return News.verdict(staus: status);
    } else {
      List<Artical> articals_list = [];
      for (var artical in articals) {
        if (inValidArtical(artical)) {
          continue;
        }
        String source = artical["source"]["name"];
        String title = artical["title"];
        String discription = artical["description"];
        String urlToImage = artical["urlToImage"];
        String publishedAt = artical["publishedAt"];
        Artical articalData = Artical(
            discription: discription,
            publishedAt: publishedAt,
            source: source,
            title: title,
            urlToImage: urlToImage);
        articals_list.add(articalData);
      }
      return News(status: status, articals_list: articals_list);
    }

  }

  bool inValidArtical(artical) {
    return artical["source"]["name"] == null ||
        artical["title"] == null ||
        artical["description"] == null ||
        artical["urlToImage"] == null ||
        artical["publishedAt"] == null||
        artical["urlToImage"].contains("sg.hu");
  }
  getArticals() async{
     News news=News.verdict(staus: "notFound");
    try{
     news =await fetchNews();
    }on Exception catch (e) {
      
    }
    if(news.status=="ok"&&news.articals_list.length>0){
      ArticalsDataBase.instance.deleteAll();
      for(Artical artical in news.articals_list){
          ArticalsDataBase.instance.create(artical);
      }
      return news;
    }else{
      List<Artical> articals_list=[];
      List<Map<String, Object?>> map_list= await ArticalsDataBase.instance.readAllArticals();
      for(Map<String, Object?> articalMap in map_list){
         String source = articalMap["source"] as String;
        String title = articalMap["title"] as String;
        String discription = articalMap["discription"] as String;
        String urlToImage = articalMap["urlToImage"] as String;
        String publishedAt = articalMap["publishedAt"] as String;
        Artical articalData = Artical(
            discription: discription,
            publishedAt: publishedAt,
            source: source,
            title: title,
            urlToImage: urlToImage);
        articals_list.add(articalData);
      }
      return News(articals_list: articals_list,status: "Ok");
    }
      
  }
}
