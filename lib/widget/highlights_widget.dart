import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class NewsHighlights extends StatelessWidget {
  const NewsHighlights({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      width: 150,
      // color: Colors.red,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              children: [
                FadeInImage(
                  height: 150,
                  placeholder: AssetImage("assets/img/placeHolder.png"),
                  image: NetworkImage(
                    Faker().image.image(random: true, keywords: ["news"]),
                  ),
                  fit: BoxFit.cover,
                ),
                Positioned.fill(
                  top: 100,
                  child: Container(
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
                Positioned(
                  left: 10,
                  bottom: 25,
                  child: Text(
                    Faker().sport.name(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  bottom: 7,
                  child: Text(
                    Faker().lorem.sentence(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
