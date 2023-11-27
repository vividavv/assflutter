import 'package:flutter/material.dart';
import 'package:flutter_application_1/Table.dart';
import 'package:flutter_application_1/cart.dart';
import 'package:flutter_application_1/home_screen.dart';
import 'package:flutter_application_1/input.dart';
class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<Nav> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    Home(),
    MyList(),
    TablePage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home_outlined),
          ),
          BottomNavigationBarItem(
            label: 'shop',
            icon: Icon(Icons.shopping_cart_outlined),
          ),
          BottomNavigationBarItem(
            label: 'list',
            icon: Icon(Icons.post_add),
          ),
        ],
      ),
    );
  }
}