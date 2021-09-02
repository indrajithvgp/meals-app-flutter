// import 'package:flutter/material.dart';
// import 'package:meals_app/models/meal.dart';
// import 'package:meals_app/screens/categories_screen.dart';
// import 'package:meals_app/screens/favorites_screen.dart';

// class TabScreen extends StatefulWidget {
//   final List<Meal> favoriteMeals;
//   TabScreen(this.favoriteMeals);
//   @override
//   _TabScreenState createState() => _TabScreenState();
// }

// class _TabScreenState extends State<TabScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//         length: 2,
//         initialIndex: 0,
//         child: Scaffold(
//           appBar: AppBar(
//             title: Text("Meals"),
//             bottom: TabBar(
//               tabs: [
//                 Tab(icon: Icon(Icons.category), text: 'Categories'),
//                 Tab(icon: Icon(Icons.star), text: 'Favorites'),
//               ],
//             ),
//           ),
//           body: TabBarView(
//             children: [CategoriesScreen(), FavoritesScreen()],
//           ),
//         ));
//   }
// }
