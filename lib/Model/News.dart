import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
final String tableName="ArticalTable";
class News extends ChangeNotifier {
  String? _status;
  News.verdict({required String staus}) : _status = staus;
  List<Artical> _articals_list = [];

  News({
    required String status,
    required List<Artical> articals_list,
  })  : _articals_list = List.from(articals_list),
        _status = status;

  get articals_list => this._articals_list;
  get status => this._status;
}

class ArticalField{
  static List<String> values=[
    id,source,title,discription,urlToImage,publishedAt
  ];
  static final String id='_id';
 static final String source="source";
  static final String title="title";
  static final String discription="discription";
  static final String urlToImage="urlToImage";
  static final String publishedAt="publishedAt";
}
class Artical {
  String? _source;
  String? _title;
  String? _discription;
  String? _urlToImage;
  String? _publishedAt;
  String? get source => this._source;

  get title => this._title;

  get discription => this._discription;

  get urlToImage => this._urlToImage;

  get publishedAt => this._publishedAt;


  Artical({
    required String source,
    required String title,
    required String discription,
    required String urlToImage,
    required String publishedAt,
  })  : _source = source,
        _title = title,
        _discription = discription,
        _urlToImage = urlToImage,
        _publishedAt = publishedAt;
  Map<String,String> toJson()=>{
    ArticalField.source:source!,
    ArticalField.title:title,
    ArticalField.discription:discription,
    ArticalField.urlToImage:urlToImage,
    ArticalField.publishedAt:publishedAt,
  };
}
