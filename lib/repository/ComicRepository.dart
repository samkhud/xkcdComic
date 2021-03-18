import 'package:comics/model/Comic.dart';
import 'package:comics/repository/Repositroy.dart';
import 'package:comics/services/ComicService.dart';

class ComicRepository implements Repository<Comic>{
  ComicService _service= ComicService();
  @override
  Future<Comic> get(int id) {
   return _service.getComic(id);

    
  }

}