import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_clone/api/api.dart';
import 'package:news_clone/components/components.dart';
import 'package:news_clone/components/post_news.dart';
import 'package:news_clone/models/models.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.pink,
      statusBarIconBrightness: Brightness.light,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<NewsModel> _news;
  int i = 0;

  @override
  void initState() {
    _news = Api_Manager().getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: BodyPage(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.pink,
      elevation: 0,
      title: Text(
        "Daily News",
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: FutureBuilder<NewsModel>(
            future: _news,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (i < snapshot.data.articles.length) {
                  i++;
                }
                return Stack(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                    Positioned(
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.10),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 4),
                          child: Text(
                            "${i}",
                            style: TextStyle(
                              color: Colors.pink,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                );
              } else {
                return null;
              }
            },
          ),
        ),
      ],
    );
  }
}

class BodyPage extends StatefulWidget {
  @override
  _BodyPageState createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Categorise(),
        PostNews(),
      ],
    );
  }
}
