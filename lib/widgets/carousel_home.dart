// ignore_for_file: avoid_unnecessary_containers

import 'package:carousel_slider/carousel_slider.dart';
import 'package:fl_blibli/theme/theme.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  'assets/images/mastercard-30okt-desktop.jpeg',
  'assets/images/chromebook-30okt-destop.jpeg',
  'assets/images/IS-sepeda-30okt-desktop.jpeg',
];

class CarouselHome extends StatefulWidget {
  const CarouselHome({
    Key? key,
  }) : super(key: key);

  @override
  State<CarouselHome> createState() => _CarouselHomeState();
}

class _CarouselHomeState extends State<CarouselHome> {
  int _current = 0;

  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CarouselSlider(
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: true,
                height: 160,
                viewportFraction: 0.9,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
            items: [
              ...imgList.map(
                (e) => Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: placeHolderColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      e,
                      fit: BoxFit.cover,
                      height: 140,
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Row(
                  children: imgList.asMap().entries.map(
                    (entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: _current == entry.key ? 18 : 8,
                          height: 8,
                          margin: const EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            color: _current == entry.key
                                ? primary
                                : placeHolderColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
                const Spacer(),
                Text(
                  'Lihat semua promo',
                  style: TextStyle(
                    fontFamily: "Effra",
                    fontWeight: FontWeight.w600,
                    color: primary,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
