import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  final Function saveFilters;
  static const routeName = '/filters';

  FilterScreen(this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      subtitle: Text(description),
      title: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final _selectedFilters = {
                "gluten": _glutenFree,
                "lactose": _lactoseFree,
                "vegan": _vegan,
                "vegetarian": _vegetarian,
              };
              widget.saveFilters(_selectedFilters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Adjust your meal selection",
                  style: Theme.of(context).textTheme.title,
                )),
            Expanded(
                child: ListView(
              children: [
                _buildSwitchListTile(
                    'Gluten-Free', "Only gluten-free meals", _glutenFree,
                    (newVal) {
                  setState(() {
                    _glutenFree = newVal;
                  });
                }),
                _buildSwitchListTile(
                    'Vegetarian', "Only veg meals", _vegetarian, (newVal) {
                  setState(() {
                    _vegetarian = newVal;
                  });
                }),
                _buildSwitchListTile('Vegan', "Only vegan meals", _vegan,
                    (newVal) {
                  setState(() {
                    _vegan = newVal;
                  });
                }),
                _buildSwitchListTile(
                    'Lactose-Free', "Only lactose-free itens", _lactoseFree,
                    (newVal) {
                  setState(() {
                    _lactoseFree = newVal;
                  });
                }),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
