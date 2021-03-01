import 'package:flutter/material.dart';

class Categorise extends StatefulWidget {
  @override
  _CategoriseState createState() => _CategoriseState();
}

class _CategoriseState extends State<Categorise> {
  List<String> catagorise = [
    "Political",
    "Econimic",
    "Covid 19",
    "Enviroment",
    "Weather",
    "Daily New"
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      height: 45,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 20),
        itemCount: catagorise.length,
        itemBuilder: (context, index) => InkWell(
          borderRadius: BorderRadius.circular(50),
          splashColor: Colors.white,
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: selectedIndex == index ? Colors.pink : Colors.transparent,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Text(
                catagorise[index],
                style: TextStyle(
                  color: selectedIndex == index ? Colors.white : Colors.black,
                  fontWeight: selectedIndex == index
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
