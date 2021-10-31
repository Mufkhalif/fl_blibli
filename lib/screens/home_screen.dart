// ignore_for_file: prefer_const_constructors

import 'package:fl_blibli/theme/theme.dart';
import 'package:fl_blibli/widgets/carousel_home.dart';
import 'package:fl_blibli/widgets/header_home.dart';
import 'package:fl_blibli/widgets/icons/icon_all.dart';
import 'package:fl_blibli/widgets/icons/icon_row.dart';
import 'package:fl_blibli/widgets/sections/flash_sale_section.dart';
import 'package:fl_blibli/widgets/sections/offical_store_section.dart';
import 'package:fl_blibli/widgets/sections/promo_section.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isHideLocation = false;

  ScrollController con = ScrollController();

  @override
  void initState() {
    con = ScrollController();
    con.addListener(() {
      if (con.offset > 240) {
        setState(() {
          isHideLocation = true;
        });
      } else {
        setState(() {
          isHideLocation = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        ListView(
          controller: con,
          scrollDirection: Axis.vertical,
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 48,
              ),
              padding: EdgeInsets.symmetric(
                vertical: 12,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 12),
                  CarouselHome(),
                  SizedBox(height: 12),
                  Container(
                    height: 80,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        IconAll(),
                        IconRow(
                          url: 'assets/images/ic_tagihan.png',
                          title: 'Tagihan',
                        ),
                        IconRow(
                          url: 'assets/images/ic_travel.png',
                          title: 'Travel',
                        ),
                        IconRow(
                          url: 'assets/images/ic_gratis_ongkir.png',
                          title: 'Gratis Ongkir',
                        ),
                        IconRow(
                          url: 'assets/images/ic_bca.png',
                          title: 'KK BCA Blibli',
                        ),
                        IconRow(
                          url: 'assets/images/ic_emoney.png',
                          title: 'Uang Elektronik',
                        ),
                        IconRow(
                          url: 'assets/images/ic_promo.png',
                          title: 'Promo Bank',
                        ),
                        IconRow(
                          url: 'assets/images/ic_promo.png',
                          title: 'Promo Bank',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: placeHolderColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/newloreal-LB1200x150.jpeg',
                        fit: BoxFit.cover,
                        height: 80,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: placeHolderColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        'https://www.static-src.com/siva/asset//10_2021/zona-member-desktop-30okt.jpg',
                        fit: BoxFit.cover,
                        height: 60,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  FlashSaleSection(),
                  PromoSection(),
                  OfficialSection(size: size),
                ],
              ),
            )
          ],
        ),
        HeaderHome(isHideLocation: isHideLocation),
      ],
    );
  }
}
