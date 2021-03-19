import 'package:comics/model/Comic.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  test('Test get random event', () async {
    final dynamic  json= {
      "safe_title":"comic",
      "img": "img"
    };
     var comic=Comic.fromJson(json);
     expect(comic, Comic('comic','img'));
    
  });
}