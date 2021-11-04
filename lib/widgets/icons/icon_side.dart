import 'package:fl_blibli/theme/theme.dart';
import 'package:flutter/material.dart';

class IconSide extends StatelessWidget {
  const IconSide({
    Key? key,
    required this.asset,
    required this.isSelected,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String asset;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        height: 90,
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? primary : Colors.white,
            width: 2,
          ),
          boxShadow: !isSelected
              ? [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    blurRadius: 1,
                    offset: const Offset(0, 1),
                  ),
                ]
              : null,
        ),
        duration: const Duration(milliseconds: 400),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                asset,
                width: 32,
                height: 32,
              ),
              const SizedBox(height: 4),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: "Effra",
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
