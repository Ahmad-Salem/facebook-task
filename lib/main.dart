import './post_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'SplashScreen.dart';
import 'data/example_data.dart' as Example;
import './data/post.dart';
import './data/posts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Init.instance.initialize(),
        builder: (context, AsyncSnapshot snapshot) {
          // Show splash screen while waiting for app resources to load:
          if (snapshot.connectionState == ConnectionState.waiting) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                // This is the theme of your application.
                //
                // Try running your application with "flutter run". You'll see the
                // application has a blue toolbar. Then, without quitting the app, try
                // changing the primarySwatch below to Colors.green and then invoke
                // "hot reload" (press "r" in the console where you ran "flutter run",
                // or simply save your changes to "hot reload" in a Flutter IDE).
                // Notice that the counter didn't reset back to zero; the application
                // is not restarted.
                primaryColor: Colors.indigo,
              ),
              home: Splash(),
            );
          } else {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                // This is the theme of your application.
                //
                // Try running your application with "flutter run". You'll see the
                // application has a blue toolbar. Then, without quitting the app, try
                // changing the primarySwatch below to Colors.green and then invoke
                // "hot reload" (press "r" in the console where you ran "flutter run",
                // or simply save your changes to "hot reload" in a Flutter IDE).
                // Notice that the counter didn't reset back to zero; the application
                // is not restarted.
                primaryColor: Colors.indigo,
              ),
              home: MyHomePage(),
            );
          }
        });
  }
}

class MyHomePage extends StatelessWidget {

  List<Post> postsItems = Posts().postsItems;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Row(
          children: <Widget>[
            Container(
              child: IconButton(
                icon: FaIcon(FontAwesomeIcons.facebook),
                onPressed: () {},
              ),
            ),
            Container(
              child: Text("Facebook", style: GoogleFonts.cairo()),
            ),
          ],
        ),
      ),
      body: FutureBuilder(
          future: Init1.instance.initialize(),
          builder: (context, AsyncSnapshot snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting)
              {
               return Center(child: CircularProgressIndicator(),);
              }else{
              return SingleChildScrollView(
                child: Column(children: postsItems.map(
                      (postData) => PostItem(Example.reactions,postData.post_id, postData.post_user_name, postData.post_date,
                          postData.post_photo, postData.post_likes, postData.post_comments),
                )
                    .toList(),),
              );
              
            }

          }),
    );
  }
}

class Init1 {
  Init1._();

  static final instance = Init1._();

  Future initialize() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    await Future.delayed(Duration(seconds: 5));
  }
}
