// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unnecessary_const, import_of_legacy_library_into_null_safe, avoid_print, non_constant_identifier_names
import 'package:fl_blibli/screens/category_screen.dart';
import 'package:fl_blibli/screens/home_screen.dart';
import 'package:fl_blibli/widgets/icons/icon_orange_center.dart';
import 'package:flutter/material.dart';
import 'navigation/navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget currentScreen = HomeScreen();
  int _selectedIndex = 0;
  int currentIndex = 0;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        {
          currentScreen = HomeScreen();
          break;
        }
      case 1:
        {
          currentScreen = CategoryScreen();
          break;
        }
      case 2:
        {
          currentScreen = CategoryScreen();
          break;
        }
      case 3:
        {
          currentScreen = CategoryScreen();
          break;
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            currentScreen,
            OrangeIconCenter(size: size),
            NavigationBar(onItemTapped: _onItemTapped, current: _selectedIndex)
          ],
        ),
      ),
    );
  }
}
