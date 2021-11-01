// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fl_blibli/theme/theme.dart';
import 'package:fl_blibli/widgets/cards/card_recomended.dart';
import 'package:fl_blibli/widgets/carousel_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SectionRight extends StatefulWidget {
  const SectionRight({
    Key? key,
    required this.title,
    required this.bannerUrl,
  }) : super(key: key);

  final String title;
  final String bannerUrl;

  @override
  State<SectionRight> createState() => _SectionRightState();
}

class _SectionRightState extends State<SectionRight> {
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return ListView(
      children: [
        Container(
          margin: EdgeInsets.only(right: 16),
          child: SvgPicture.network(
            widget.bannerUrl,
            width: size.width / 1.5,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Promo',
            style: const TextStyle(
              fontFamily: "Effra",
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(height: 12),
        CarouselSlider(
          carouselController: _controller,
          options: CarouselOptions(
            enableInfiniteScroll: false,
            autoPlay: false,
            height: 120,
            viewportFraction: 0.94,
          ),
          items: [
            ...imgList.map(
              (e) => Container(
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  color: white1Color,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    e,
                    fit: BoxFit.cover,
                    height: 120,
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.only(left: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  fontFamily: "Effra",
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 12),
              Wrap(
                children: const [
                  CardRecomended(
                    title: 'Makanan',
                    url:
                        'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/medium/102/MTA-1937586/fortune_fortune-minyak-goreng-pouch--2000-ml-6-pouch-_full02.jpg',
                  ),
                  CardRecomended(
                    title: 'Kebutuhan ibu & Anak',
                    url:
                        'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/medium/KOS-13967-00093-00001/sgm_sgm_eksplor_1-_complinutri_madu_-900_gr-_full01_fp6xviwp.jpeg',
                  ),
                  CardRecomended(
                    title: 'Minyak masakan',
                    url:
                        'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/medium/89/MTA-9001409/vipco_vipco_minyak_goreng_pouch_-900ml_x_12_pcs-_full02_dreajf9l.jpg',
                  ),
                  CardRecomended(
                    title: 'Minuman',
                    url:
                        'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/medium/MTA-2468792/bear-brand_nestle-bear-brand-susu-sapi-steril-siap-minum-putih-kaleng-189ml_full11.jpg',
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
