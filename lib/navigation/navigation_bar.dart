import 'package:fl_blibli/canvas/bottom_canvas.dart';
import 'package:fl_blibli/navigation/nav_item.dart';
import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({
    Key? key,
    required this.onItemTapped,
    required this.current,
  }) : super(key: key);

  final Function(int) onItemTapped;
  final int current;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(
              double.infinity,
              (440 * 0.1502086230876217).toDouble(),
            ),
            painter: CustomePointerBottomNavigation(),
          ),
          SizedBox(
            width: size.width,
            height: 44,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NavItem(
                  asset: 'assets/images/ic_home.svg',
                  title: 'Beranda',
                  isActive: current == 0,
                  onTap: () {
                    onItemTapped(0);
                  },
                ),
                NavItem(
                  asset: 'assets/images/ic_kategori.svg',
                  title: 'Kategori',
                  isActive: current == 1,
                  onTap: () {
                    onItemTapped(1);
                  },
                ),
                Container(
                  width: size.width * 0.20,
                ),
                NavItem(
                  asset: 'assets/images/ic_official.svg',
                  title: 'Official',
                  isActive: current == 2,
                  onTap: () {
                    onItemTapped(2);
                  },
                ),
                NavItem(
                  asset: 'assets/images/ic_account.svg',
                  title: 'Akun',
                  isActive: current == 3,
                  onTap: () {
                    onItemTapped(3);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
