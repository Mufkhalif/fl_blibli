import 'package:flutter/material.dart';

class CardOfficial extends StatelessWidget {
  const CardOfficial({
    Key? key,
    required this.size,
    required this.url,
    required this.isLarge,
  }) : super(key: key);

  final Size size;
  final String url;
  final bool isLarge;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width / 2 - 16,
      height: isLarge ? 204 : 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          url,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
