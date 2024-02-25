import 'package:flutter/material.dart';
import 'package:new_app/widget/highlights_widget.dart';

class NewsGridView extends StatelessWidget {
  const NewsGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
        title: Text(
          "Grid view",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          mainAxisExtent: 150, //height
          maxCrossAxisExtent: 200, //width
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        itemCount: 50,
        itemBuilder: (context, index) {
          return NewsHighlights();
        },
      ),
    );
  }
}
