import 'package:fl_blibli/theme/theme.dart';
import 'package:flutter/material.dart';

class OrangeIconCenter extends StatelessWidget {
  const OrangeIconCenter({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 28,
      left: size.width / 2 - 28,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: orangeColor,
            borderRadius: BorderRadius.circular(32),
          ),
          width: 52,
          height: 52,
          padding: const EdgeInsets.all(14),
          child: Image.asset(
            'assets/images/ic_blibli.png',
            width: 12,
            height: 12,
          ),
        ),
      ),
    );
  }
}
