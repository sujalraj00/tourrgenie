import 'package:flutter/material.dart';
import 'package:tourgenie/screens/nav_pages/bar_item_page.dart';
import 'package:tourgenie/screens/home_page.dart';
import 'package:tourgenie/screens/nav_pages/my_page.dart';
import 'package:tourgenie/screens/nav_pages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    HomePage(),
    BarItemPage(),
    SearchPage(),
    MyPage(),
  ];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          // fixedColor: Colors.white,
          backgroundColor: Colors.white,
          unselectedFontSize: 0,
          selectedFontSize: 0,
          onTap: onTap,
          type: BottomNavigationBarType.shifting,
          currentIndex: currentIndex,
          selectedItemColor: Colors.black54,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          showUnselectedLabels: false,
          showSelectedLabels: false,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.apps),
              backgroundColor:
                  Colors.white, // Set background color for this item
            ),
            BottomNavigationBarItem(
              label: 'Bar',
              icon: Icon(Icons.bar_chart_sharp),
              backgroundColor:
                  Colors.white, // Set background color for this item
            ),
            BottomNavigationBarItem(
              label: 'Search',
              icon: Icon(Icons.search),
              backgroundColor:
                  Colors.white, // Set background color for this item
            ),
            BottomNavigationBarItem(
              label: 'My',
              icon: Icon(Icons.person),
              backgroundColor:
                  Colors.white, // Set background color for this item
            ),
          ]),
    );
  }
}
