import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen(
  //     {@required this.categoryId, @required this.categoryTitle});

  @override
  Widget build(BuildContext context) {

    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String title = routeArgs['title'];
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text('The Recipes for category'),
      ),
    );
  }
}
