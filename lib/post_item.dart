import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'items/comments.dart';
import 'models/comment.dart';
import '../data/example_data.dart' as Example;

class PostItem extends StatefulWidget {
  final List<Reaction> reactions;
  final String post_id;
  final String post_user_name;
  final String post_date;
  final String post_photo;
  final List<String> post_photos;
  final String post_text;
  final String post_likes;
  final String post_comments;

  PostItem(this.reactions,
      this.post_id,
      this.post_user_name,
      this.post_date,
      this.post_photo,
      this.post_photos,
      this.post_text,
      this.post_likes,
      this.post_comments);

  @override
  _PostItemState createState() =>
      _PostItemState(
          post_id,
          post_user_name,
          post_date,
          post_photo,
          post_photos,
          post_text,
          post_likes,
          post_comments);
}

class _PostItemState extends State<PostItem> {
  late final String post_id;
  late final String post_user_name;
  late final String post_date;
  late final String post_photo;
  late final List<String> post_photos;
  late final String post_text;
  late final String post_likes;
  late final String post_comments;

  _PostItemState(this.post_id,
      this.post_user_name,
      this.post_date,
      this.post_photo,
      this.post_photos,
      this.post_text,
      this.post_likes,
      this.post_comments);

  bool get wantKeepAlive => true;

  List<Comment> _comments = [];

  _showBottomSheetCommets() {
    showBottomSheet(
      context: context,
      builder: (context) => Comments(_comments),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          elevation: 1,
          margin: EdgeInsets.all(5),
          child: Column(
            children: <Widget>[
            Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(
                            top: 10, bottom: 10, left: 10, right: 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0),
                          child: Image.asset(
                            "assets/icons/facebook.png",
                            height: 40,
                            width: 40,
                          ),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.all(10),
                          child: Stack(
                            overflow: Overflow.visible,
                            children: [
                              Container(
                                  height: 20,
                                  child: Text(
                                    post_user_name,
                                    style: GoogleFonts.cairo(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black),
                                  )),
                              Container(
                                  margin: EdgeInsets.only(top: 15),
                                  child: Text(
                                    post_date,
                                    style: GoogleFonts.cairo(
                                        fontSize: 12, color: Colors.grey),
                                  )),
                            ],
                          ))
                    ],
                  ),
                ),
                Container(
                  child: IconButton(
                    icon: FaIcon(FontAwesomeIcons.ellipsisH),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          post_text != ""
              ? Container(
            child: Text(
              post_text,
              style: GoogleFonts.cairo(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Colors.grey,
              ),
            ),
          )
              : Container(),
          post_photo != ""
              ? Container(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
                child: Image.asset(
                  post_photo,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ))
              : Container(),
          post_photos.isNotEmpty
              ? CarouselSlider(
            items: [
              for (var i = 0; i < post_photos.length; i++)
                new Image.asset(post_photos[i])
            ],
            options: CarouselOptions(
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                scrollPhysics: BouncingScrollPhysics(),
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 4),
                autoPlayAnimationDuration: Duration(seconds: 2)),
          ): Container(),
      Container(
        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              post_likes,
              style: GoogleFonts.cairo(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Colors.grey,
              ),
            ),
            Text(
              post_comments,
              style: GoogleFonts.cairo(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        height: 1,
        color: Colors.grey[300],
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * .2,
              child: FittedBox(
                child: FlutterReactionButtonCheck(
                  onReactionChanged: (reaction, index, isChecked) {
                    print('reaction selected index: $index');
                  },
                  reactions: widget.reactions,
                  initialReaction: Example.defaultInitialReaction,
                  selectedReaction: widget.reactions[1],
                ),
              ),
            ),
            InkWell(
              onTap: () => _showBottomSheetCommets(),
              child: Row(
                children: [
                  Icon(
                    Icons.message,
                    size: 20,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Comment',
                    style: GoogleFonts.cairo(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () =>
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(seconds: 2),
                    content: Text(
                      'Share image Successfuly done!',
                      style: GoogleFonts.cairo(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  )),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.share,
                    size: 20,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(width: 5),
                  Text('Share',
                      style: GoogleFonts.cairo(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey)),
                ],
              ),
            )
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        height: 1,
        color: Colors.grey[200],
      ),
      ],
    ),)
    ,
    );
  }
}
