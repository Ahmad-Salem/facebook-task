import 'package:flutter/foundation.dart';

class Post with ChangeNotifier {
  final String _post_id;
  final String _post_user_name;
  final String _post_date;
  final String _post_photo;
  final List<String> _post_photos;
  final String _post_text;
  final String _post_likes;
  final String _post_comments;


  Post(
      @required this._post_id,
      @required this._post_user_name,
      @required this._post_date,
      @required this._post_photo,
      @required this._post_photos,
      @required this._post_text,
      @required this._post_likes,
      @required this._post_comments);

  String get post_comments => _post_comments;

  String get post_likes => _post_likes;

  String get post_photo => _post_photo;

  List<String> get post_photos => _post_photos;

  String get post_text => _post_text;

  String get post_date => _post_date;

  String get post_user_name => _post_user_name;

  String get post_id => _post_id;
}
