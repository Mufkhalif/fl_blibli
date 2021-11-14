import 'package:fl_blibli/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ButtonOtherLogin extends StatelessWidget {
  const ButtonOtherLogin({
    Key? key,
    required this.isGoogle,
  }) : super(key: key);

  final bool isGoogle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 16.0,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: isGoogle ? googleColor : fbColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(isGoogle
                  ? 'assets/images/ic_google.svg'
                  : 'assets/images/ic_facebook.svg'),
              const SizedBox(width: 8),
              Text(
                isGoogle ? 'Google' : 'Facebook',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Effra",
                  fontWeight: FontWeight.w600,
                  color: isGoogle ? Colors.grey : Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
