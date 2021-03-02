import 'package:flutter/material.dart';
import 'package:news_clone/api/api.dart';
import 'package:news_clone/models/models.dart';

class PostNews extends StatefulWidget {
  @override
  _PostNewsState createState() => _PostNewsState();
}

class _PostNewsState extends State<PostNews> {
  Future<NewsModel> _news;

  @override
  void initState() {
    _news = Api_Manager().getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<NewsModel>(
        future: _news,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data.articles.length,
              itemBuilder: (context, index) {
                var news = snapshot.data.articles[index];
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      setState(() {});
                    },
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 300,
                            height: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                news.urlToImage,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    news.title,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    news.description,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  // SizedBox(
                                  //   height: 30,
                                  // ),
                                  // Text(
                                  //   news.content,
                                  //   style: TextStyle(
                                  //     fontSize: 16,
                                  //     color: Colors.black,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.pink,
                strokeWidth: 4,
              ),
            );
          }
        },
      ),
    );
  }
}
