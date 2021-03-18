
import 'dart:convert';

import 'package:comics/model/Comic.dart';
import 'package:http/http.dart' as http;
class ComicService{
  String _urlPrefix="https://xkcd.com/";
  String _urlSuffix="/info.0.json";
  http.Client _client = new http.Client();

  Future<Comic> getComic(int id) async{
    String _url = _urlPrefix+id.toString()+_urlSuffix;
    var response= await _client.get(Uri.parse(_url));
    print(response.body);
    return Comic.fromJson(jsonDecode( response.body));

    }
  
}