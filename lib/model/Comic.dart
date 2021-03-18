class Comic{
  String _title;
  String _img;
  Comic(this._title,this._img);
  get title => _title;
  get img => _img;
  factory Comic.fromJson(Map<String,dynamic> json) {
 
    print(json.runtimeType);
    Comic comic = Comic(json['safe_title'] as String,json['img'] as String);

    return comic;
  }

}