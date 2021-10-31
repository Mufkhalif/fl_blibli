// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unnecessary_const, import_of_legacy_library_into_null_safe, avoid_print, non_constant_identifier_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:fl_blibli/canvas/bottom_canvas.dart';
import 'package:fl_blibli/theme/theme.dart';
import 'package:fl_blibli/widgets/cards/card_official.dart';
import 'package:fl_blibli/widgets/cards/card_product.dart';
import 'package:fl_blibli/widgets/cards/card_product_fullsize.dart';
import 'package:fl_blibli/widgets/carousel_home.dart';
import 'package:fl_blibli/widgets/icons/icon_all.dart';
import 'package:fl_blibli/widgets/icons/icon_row.dart';
import 'package:fl_blibli/widgets/sections/flash_sale_section.dart';
import 'package:fl_blibli/widgets/sections/offical_store_section.dart';
import 'package:fl_blibli/widgets/sections/promo_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

final List<String> imgList = [
  'assets/images/mastercard-30okt-desktop.jpeg',
  'assets/images/chromebook-30okt-destop.jpeg',
  'assets/images/IS-sepeda-30okt-desktop.jpeg',
  'assets/images/IS-sepeda-30okt-desktop.jpeg',
  'assets/images/IS-sepeda-30okt-desktop.jpeg',
  'assets/images/IS-sepeda-30okt-desktop.jpeg',
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;
  bool isHideLocation = false;

  ScrollController con = ScrollController();
  final CarouselController _controller = CarouselController();

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

  int currentIndex = 0;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Stack(
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
                      SizedBox(
                        height: 12,
                      ),
                      CarouselHome(
                        controller: _controller,
                        onPageChanged: (index) {
                          setState(() {
                            _current = index;
                          });
                        },
                        current: _current,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 80,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
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
            Align(
              alignment: Alignment.topCenter,
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: 44,
                      left: 12,
                      right: 12,
                      bottom: 24,
                    ),
                    decoration: BoxDecoration(color: primary),
                    width: double.infinity,
                    child: !isHideLocation
                        ? Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.white,
                                size: 18,
                              ),
                              SizedBox(width: 4),
                              Text(
                                'Tambah alamat',
                                style: TextStyle(
                                  fontFamily: "Effra",
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 4),
                              Text(
                                'biar belanja lebih asyik',
                                style: TextStyle(
                                  fontFamily: "Effra",
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white.withOpacity(0.6),
                                ),
                              ),
                              SizedBox(width: 4),
                              Icon(
                                Icons.chevron_right,
                                color: Colors.white,
                                size: 18,
                              ),
                            ],
                          )
                        : Container(height: 20),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: AnimatedContainer(
                      margin: EdgeInsets.only(
                        top: !isHideLocation ? 68 : 44,
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                      ),
                      duration: const Duration(milliseconds: 200),
                      child: Header(),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
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
                  padding: EdgeInsets.all(14),
                  child: Image.asset(
                    'assets/images/ic_blibli.png',
                    width: 12,
                    height: 12,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size(
                      double.infinity,
                      (440 * 0.1502086230876217).toDouble(),
                    ),
                    painter: CustomePointerBottomNavigation(),
                  ),
                  Container(
                    width: size.width,
                    height: 44,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        NavItem(
                          asset: 'assets/images/ic_home.svg',
                          title: 'Beranda',
                          isActive: true,
                        ),
                        NavItem(
                          asset: 'assets/images/ic_kategori.svg',
                          title: 'Kategori',
                          isActive: false,
                        ),
                        Container(
                          width: size.width * 0.20,
                        ),
                        NavItem(
                          asset: 'assets/images/ic_official.svg',
                          title: 'Official',
                          isActive: false,
                        ),
                        NavItem(
                          asset: 'assets/images/ic_account.svg',
                          title: 'Akun',
                          isActive: false,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  const NavItem({
    Key? key,
    required this.asset,
    required this.isActive,
    required this.title,
  }) : super(key: key);

  final String asset;
  final bool isActive;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 4),
      child: Column(
        children: [
          SvgPicture.asset(asset),
          SizedBox(height: 2),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Effra",
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: isActive ? primary : greyColor,
            ),
          )
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: placeHolderColor,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.only(left: 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'RTX 3070',
                  style: TextStyle(
                    fontFamily: "Effra",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.chevron_right,
                color: primary,
                size: 24,
              ),
              Text(
                'Masuk',
                style: TextStyle(
                  fontFamily: "Effra",
                  fontWeight: FontWeight.w600,
                  color: primary,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
