import 'package:fl_blibli/screens/account_screen.dart';
import 'package:fl_blibli/screens/category_screen.dart';
import 'package:fl_blibli/screens/home_screen.dart';
import 'package:fl_blibli/screens/login_screen.dart';
import 'package:fl_blibli/screens/offical_screen.dart';
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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      home: LoginScreen(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget currentScreen = const HomeScreen();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        {
          currentScreen = const HomeScreen();
          break;
        }
      case 1:
        {
          currentScreen = const CategoryScreen();
          break;
        }
      case 2:
        {
          currentScreen = const OfficalScreen();
          break;
        }
      case 3:
        {
          currentScreen = const AccountScreen();
          break;
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          currentScreen,
          OrangeIconCenter(size: size),
          NavigationBar(onItemTapped: _onItemTapped, current: _selectedIndex)
        ],
      ),
    );
  }
}
