import 'package:flutter/material.dart';

import './post.dart';

class Posts with ChangeNotifier {
  List<Post> postsItems = [
    Post(
      '1',
      'Ahmed Salem',
      'Monday at 11:00 Am',
      'assets/images/img1.jpg',
      '88 likes',
      '34 comments',
    ), Post(
      '2',
      'Ahmed Salem',
      'Sunday at 12:00 Am',
      'assets/images/img2.jpg',
      '5 likes',
      '77 comments',
    ),
    Post(
      '3',
      'Ahmed Salem',
      'Monday at 9:00 Am',
      'assets/images/img3.jpg',
      '55 likes',
      '55',
    ),
    Post(
      '4',
      'Ahmed Salem',
      'Monday at 5:00 Am',
      'assets/images/img4.jpg',
      '65 likes',
      '85 comments',
    ),
    Post(
      '5',
      'Ahmed Salem',
      'Saturday at 4:00 Pm',
      'assets/images/img5.jpg',
      '5 likes',
      '55 comments',
    ),
  ];
  // var _showFavoritesOnly = false;

  List<Post> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [...postsItems];
  }






}
