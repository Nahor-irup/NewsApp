import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:new_app/widget/highlights_widget.dart';

class NewsDetail extends StatelessWidget {
  const NewsDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
        title: Text(
          "Detail Page",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // color: Colors.red,
                height: 200,
                // width: MediaQuery.of(context).size.width,
                // width: double.infinity,
                child: FadeInImage(
                  width: MediaQuery.of(context).size.width,
                  placeholder: AssetImage("assets/img/placeHolder.png"),
                  image: NetworkImage(
                    Faker().image.image(random: true, keywords: ["sports"]),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10),
              Text(
                Faker().sport.name(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "2024/2/26",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  text: Faker().sport.name() + " ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: Faker().lorem.sentences(28).join(" "),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Related News",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return NewsHighlights();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
