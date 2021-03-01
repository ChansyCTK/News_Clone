import 'package:flutter/material.dart';
import 'package:news_clone/models/models.dart';

class PostNews extends StatefulWidget {
  @override
  _PostNewsState createState() => _PostNewsState();
}

class _PostNewsState extends State<PostNews> {
  ModelsNews news;
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.img.length,
      itemBuilder: (context, index) => InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        child: Container(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    news.img[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(news.title[index]),
            ],
          ),
        ),
      ),
    );
  }
}
