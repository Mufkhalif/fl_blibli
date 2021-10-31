import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconAll extends StatelessWidget {
  const IconAll({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52,
      color: Colors.white,
      margin: const EdgeInsets.only(right: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/ic_all.svg',
            height: 38,
            width: 38,
          ),
          const SizedBox(height: 4),
          const Text(
            'Lihat semua',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Effra",
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
