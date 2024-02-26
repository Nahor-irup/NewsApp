import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:new_app/news_detailspage.dart';
import 'package:new_app/widget/highlights_widget.dart';
import 'package:new_app/widget/list_widget.dart';

import 'widget/gridview_widget.dart';

class NewsHomepage extends StatelessWidget {
  const NewsHomepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final faker = Faker();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "News Nepal",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Stories Text
              Text(
                "Stories",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15),
              //Stories image
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  // color: Colors.red,
                  height: 200,
                  // width: MediaQuery.of(context).size.width,
                  // width: double.infinity,
                  child: Stack(
                    children: [
                      FadeInImage(
                        width: double.infinity,
                        placeholder: AssetImage("assets/img/placeHolder.png"),
                        image: NetworkImage(
                          faker.image.image(random: true, keywords: ["news"]),
                        ),
                        fit: BoxFit.cover,
                      ),
                      Positioned.fill(
                        top: 130,
                        child: Container(
                          height: 70,
                          color: Colors.black.withOpacity(0.4),
                        ),
                      ),
                      Positioned(
                        left: 10,
                        bottom: 35,
                        child: Text(
                          Faker().sport.name(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Positioned(
                        left: 10,
                        bottom: 15,
                        child: Text(
                          Faker().lorem.sentence(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              //Highlights Text
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Highlights",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsGridView(),
                        ),
                      );
                    },
                    child: Text.rich(
                      TextSpan(
                        text: "view all",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.red,
                        ),
                        children: [
                          TextSpan(
                            text: "...",
                            style: TextStyle(
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              //Highlights list view
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      height: 150,
                      // color: Colors.green,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return NewsHighlights();
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              //Headlines Text
              Text(
                "Headlines",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15),
              //Headlines list view
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => NewsDetail(),));
                },
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return NewsList();
                  },
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
