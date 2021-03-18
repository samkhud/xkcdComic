import 'package:comics/model/Comic.dart';

abstract class ComicEvent{
  Comic _comic;
  ComicEvent(this._comic);
  Comic get comic =>_comic;


}
class LikeEvent extends ComicEvent{
  
  LikeEvent(Comic comic):super(comic);

}
class DislikeComic extends ComicEvent{
  
  DislikeComic(Comic comic):super(comic);
}
class RequestNewEvent extends ComicEvent{
  RequestNewEvent() : super(null);

}