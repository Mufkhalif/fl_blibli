// ignore_for_file: prefer_const_constructors

import 'package:fl_blibli/theme/theme.dart';
import 'package:fl_blibli/widgets/cards/card_official.dart';
import 'package:flutter/material.dart';

class OfficialSection extends StatelessWidget {
  const OfficialSection({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          color: Color(0xffF1F1F1),
        ),
        Container(
          margin: EdgeInsets.only(top: 12),
          padding: EdgeInsets.symmetric(
            vertical: 6,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                child: Row(
                  children: [
                    Image.network(
                      'https://www.static-src.com/siva/asset//06_2021/Icon-OS-MVG.jpg',
                      width: 24,
                      height: 24,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Official Store',
                      style: TextStyle(
                        fontFamily: "Effra",
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 12),
                    Spacer(),
                    Text(
                      'Lihat semua',
                      style: TextStyle(
                        fontFamily: "Effra",
                        fontWeight: FontWeight.w600,
                        color: primary,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        CardOfficial(
                            size: size,
                            url:
                                'https://www.static-src.com/siva/asset//10_2021/fs-os-fotoplus-656x656-desktop.jpg',
                            isLarge: true),
                        SizedBox(
                          height: 8,
                        ),
                        CardOfficial(
                            size: size,
                            url:
                                'https://www.static-src.com/siva/asset//10_2021/Desktop-OS-Banner-2-dapurfit.png',
                            isLarge: false)
                      ],
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Column(
                      children: [
                        CardOfficial(
                            size: size,
                            url:
                                'https://www.static-src.com/siva/asset//10_2021/Desktop-OS-Banner-3-dji.png',
                            isLarge: false),
                        SizedBox(
                          height: 4,
                        ),
                        CardOfficial(
                            size: size,
                            url:
                                'https://www.static-src.com/siva/asset//10_2021/Desktop-OS-Banner-4-sparkle-new2.png',
                            isLarge: false),
                        SizedBox(
                          height: 4,
                        ),
                        CardOfficial(
                            size: size,
                            url:
                                'https://www.static-src.com/siva/asset//10_2021/Desktop-OS-Banner-5-milklife.png',
                            isLarge: false),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
