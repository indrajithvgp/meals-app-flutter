import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/filter_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegetarian": false,
  };

  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favoriteMeals = [];

  void toggleFavorites(String mealId) {
    final index = favoriteMeals.indexWhere((element) => element.id == mealId);
    if (index >= 0) {
      setState(() {
        favoriteMeals.removeAt(index);
      });
    } else {
      favoriteMeals
          .add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
    }
  }

  bool isMealFavorite(String id) {
    return favoriteMeals.any((meal) => id == meal.id);
  }

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] == true && !meal.isVegetarian) {
          return false;
        }
        if (_filters['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }

        return true;
      }).toList();
    });
  }

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
        "/": (context) => TabScreen(favoriteMeals),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(availableMeals),
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen(toggleFavorites, isMealFavorite),
        FilterScreen.routeName: (context) =>
            FilterScreen(_setFilters, _filters),
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
