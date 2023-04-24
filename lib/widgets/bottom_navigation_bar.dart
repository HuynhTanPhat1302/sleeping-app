import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const MyBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color.fromRGBO(20, 39, 86, 1), // set background color
      selectedItemColor: Colors.white, // set selected item color
      unselectedItemColor:
          Color.fromRGBO(157, 145, 254, 1), // set unselected item color
      selectedFontSize: 18, // set selected item font size
      unselectedFontSize: 14, // set unselected item font size
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Add',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Add',
        ),
      ],
    );
  }
}
