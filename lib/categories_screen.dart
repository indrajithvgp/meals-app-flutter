import "package:flutter/material.dart";
import 'package:meals_app/category_item.dart';
import "./dummy_data.dart";

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Finger Lickin"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          
          child: GridView(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              children: DUMMY_CATEGORIES
                  .map((category) =>
                      CategoryItem(category.title, category.color, category.id))
                  .toList()),
        ));
  }
}
