import 'package:flutter/material.dart';
import 'package:flutter_meal_app/screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking up!',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(height: 20),
          buildListTileMethod('Meals', Icons.restaurant, () {
            Navigator.of(context).pushNamed('/');
          }),
          BuildListTileWidget(
            title: 'Settings',
            icon: Icons.settings,
            tapHandlerWidget: () {
              Navigator.of(context).pushNamed(FilterScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}

//Here below I have the method and the widget for the same buildListTile, one is a method and one is a widget
//I wanted to try both so that's why we have both of the method bellow
ListTile buildListTileMethod(String title, IconData icon, Function tapHandler) {
  return ListTile(
    leading: Icon(icon, size: 26),
    title: Text(
      title,
      style: TextStyle(
        fontFamily: 'RobotoCondensed',
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
    onTap: tapHandler,
  );
}

class BuildListTileWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function tapHandlerWidget;

  const BuildListTileWidget({
    Key key,
    this.title,
    this.icon,
    @required this.tapHandlerWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandlerWidget,
    );
  }
}
