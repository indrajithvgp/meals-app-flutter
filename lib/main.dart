import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/filter_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // print(context);
    return MaterialApp(
      title: 'Finger Lickin',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: "Raleway",
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              title: TextStyle(
                  fontSize: 24,
                  fontFamily: "RobotoCondensed",
                  fontWeight: FontWeight.bold))),
      // home: CategoriesScreen(),
      initialRoute: "/",
      routes: {
        "/": (context) => TabScreen(),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
        FilterScreen.routeName: (context) => FilterScreen(),
      },
      // onGenerateRoute: (settings) {
      //   print(settings.arguments);
      //   if(settings.name == "/"){
      //     return ...;
      //   }

      //   return MaterialPageRoute(builder: (ctx) => CategoryMealsScreen());
      // },
    );
  }
}
