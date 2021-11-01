import 'package:fl_blibli/models/side_icon.dart';
import 'package:fl_blibli/static/side_icon_item.dart';
import 'package:fl_blibli/theme/theme.dart';
import 'package:fl_blibli/widgets/icons/icon_side.dart';
import 'package:fl_blibli/widgets/sections/category_section.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int _currentTab = 0;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final List<SideIcon> listIconSide =
        sideIconItem.map((e) => SideIcon.fromJson(e)).toList();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: white1Color,
          width: size.width / 4,
          height: size.height,
          child: ListView(
            children: [
              ...listIconSide.map((item) {
                return IconSide(
                  asset: item.asset,
                  isSelected: _currentTab == item.id,
                  title: item.title,
                  onTap: () {
                    setState(() {
                      _currentTab = item.id;
                    });
                  },
                );
              }),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ),
        Container(
          width: size.width - (size.width / 4),
          color: white1Color,
          height: size.height,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 600),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, -1.2),
                  end: const Offset(0, 0),
                ).animate(animation),
                child: child,
              );
            },
            child: _currentTab == 1
                ? SectionRight(
                    key: UniqueKey(),
                    title: listIconSide[_currentTab].title,
                    bannerUrl: listIconSide[_currentTab].bannerUrl,
                  )
                : SectionRight(
                    key: UniqueKey(),
                    title: listIconSide[_currentTab].title,
                    bannerUrl: listIconSide[_currentTab].bannerUrl,
                  ),
          ),
        ),
      ],
    );
  }
}
