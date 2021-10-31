import 'package:fl_blibli/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavItem extends StatelessWidget {
  const NavItem({
    Key? key,
    required this.asset,
    required this.isActive,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String asset;
  final bool isActive;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        padding: const EdgeInsets.only(top: 4),
        duration: Duration(milliseconds: 400),
        child: Column(
          children: [
            SvgPicture.asset(asset),
            SizedBox(height: 2),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Effra",
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: isActive ? primary : greyColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
