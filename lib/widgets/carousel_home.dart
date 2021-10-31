// ignore_for_file: avoid_unnecessary_containers

import 'package:carousel_slider/carousel_slider.dart';
import 'package:fl_blibli/main.dart';
import 'package:fl_blibli/theme/theme.dart';
import 'package:flutter/material.dart';

class CarouselHome extends StatelessWidget {
  const CarouselHome({
    Key? key,
    required this.controller,
    required this.onPageChanged,
    required this.current,
  }) : super(key: key);

  final CarouselController controller;
  final int current;
  final Function(int) onPageChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CarouselSlider(
            carouselController: controller,
            options: CarouselOptions(
                autoPlay: false,
                height: 140,
                viewportFraction: 0.9,
                onPageChanged: (index, reason) {
                  onPageChanged(index);
                  // setState(() {
                  //   _current = index;
                  // });
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
                        onTap: () => controller.animateToPage(entry.key),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: current == entry.key ? 18 : 8,
                          height: 8,
                          margin: const EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            color: current == entry.key
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
