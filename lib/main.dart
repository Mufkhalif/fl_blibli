// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unnecessary_const, import_of_legacy_library_into_null_safe

import 'package:carousel_slider/carousel_slider.dart';
import 'package:fl_blibli/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
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
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 58,
                    left: 12,
                    right: 12,
                    bottom: 24,
                  ),
                  decoration: BoxDecoration(color: primary),
                  width: double.infinity,
                  child: Row(
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
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 84,
                    ),
                    padding: EdgeInsets.symmetric(
                      // horizontal: 12,
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
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
                                      'RTX 3060',
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
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          child: CarouselSlider(
                            carouselController: _controller,
                            options: CarouselOptions(
                                autoPlay: false,
                                height: 140,
                                viewportFraction: 0.9,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    _current = index;
                                  });
                                }),
                            items: [
                              ...imgList.map((e) => Container(
                                    margin: EdgeInsets.all(8),
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
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(
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
                                      onTap: () =>
                                          _controller.animateToPage(entry.key),
                                      child: _current == entry.key
                                          ? Container(
                                              width: 18,
                                              height: 8,
                                              margin: EdgeInsets.only(right: 8),
                                              decoration: BoxDecoration(
                                                color: primary,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                            )
                                          : Indicator(),
                                    );
                                  },
                                ).toList(),
                              ),
                              Spacer(),
                              Text(
                                'Lihat semua promo',
                                style: TextStyle(
                                    fontFamily: "Effra",
                                    fontWeight: FontWeight.w600,
                                    color: primary),
                              )
                            ],
                          ),
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
                              Container(
                                width: 52,
                                color: Colors.white,
                                margin: EdgeInsets.only(right: 14),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/ic_all.svg',
                                      height: 38,
                                      width: 38,
                                    ),
                                    SizedBox(height: 4),
                                    Text(
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
                              ),
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
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: sectionColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/flash_sale.png',
                                      fit: BoxFit.cover,
                                      height: 18,
                                    ),
                                    SizedBox(width: 12),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      child: Text(
                                        '10:00:29',
                                        style: TextStyle(
                                          fontFamily: "Effra",
                                          fontWeight: FontWeight.w600,
                                          color: orangeColor,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      'Lihat semua',
                                      style: TextStyle(
                                        fontFamily: "Effra",
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 12),
                              Container(
                                height: 280,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  clipBehavior: Clip.none,
                                  children: [
                                    SizedBox(width: 12),
                                    CardProduct(
                                      url:
                                          'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/medium/MTA-7089389/xiaomi_xiaomi_mi_led_4_android_tv_-43_inch-_full06_e0deicop.png',
                                      title:
                                          'Xiaomi Mi LED 4 Android TV [43 Inch]',
                                      beforePrice: 'Rp5.999.0000',
                                      price: 'Rp3.999.0000',
                                      discount: '19%',
                                      terjual: '30% Terjual',
                                      showStock: true,
                                    ),
                                    CardProduct(
                                      url:
                                          'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/medium/MTA-13530011/samsung_samsung_ua43au8000kxxd_crystal_uhd_4k_smart_tv_with_airslim_design_-43_inch-_full07_oakyjbq5.jpeg',
                                      title:
                                          'Samsung UA43AU8000KXXD Crystal UHD 4K Smart TV with AirSlim Design [43 Inch]',
                                      beforePrice: 'Rp5.899.000',
                                      price: 'Rp5.699.000',
                                      discount: '3%',
                                      terjual: '30% Terjual',
                                      showStock: true,
                                    ),
                                    CardProduct(
                                      url:
                                          'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/medium/MTA-13530011/samsung_samsung_ua43au8000kxxd_crystal_uhd_4k_smart_tv_with_airslim_design_-43_inch-_full07_oakyjbq5.jpeg',
                                      title:
                                          'Samsung UA43AU8000KXXD Crystal UHD 4K Smart TV with AirSlim Design [43 Inch]',
                                      beforePrice: 'Rp5.899.000',
                                      price: 'Rp5.699.000',
                                      discount: '3%',
                                      terjual: '30% Terjual',
                                      showStock: true,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        // SizedBox(height: 12),
                        Stack(
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
                                        Text(
                                          'Promo Bliblimart',
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
                                  SizedBox(height: 12),
                                  Container(
                                    height: 243,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      clipBehavior: Clip.none,
                                      children: [
                                        SizedBox(width: 12),
                                        CardProductFullSize(
                                          url:
                                              'https://www.static-src.com/siva/asset//10_2021/3110-PH1-D.jpg',
                                        ),
                                        CardProduct(
                                          url:
                                              'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/medium//99/MTA-23853645/prochiz_keju_prochiz_paket_terlaris_kombo_cheddar_dan_gold_slice_-paris-_full01_p9bqf2jk.jpg?output-format=webp',
                                          title:
                                              'Keju PROCHIZ Paket Terlaris Kombo Cheddar dan Gold Slice (PARIS) ',
                                          beforePrice: 'Rp5.899.000',
                                          price: 'Rp5.699.000',
                                          discount: '3%',
                                          terjual: '30% Terjual',
                                          showStock: false,
                                        ),
                                        CardProduct(
                                          url:
                                              'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/medium//99/MTA-23850368/prochiz_keju_prochiz_gold_slices_5-s_1_renceng_full01_f921mz9c.jpg?output-format=webp',
                                          title:
                                              'Samsung UA43AU8000KXXD Crystal UHD 4K Smart TV with AirSlim Design [43 Inch]',
                                          beforePrice: 'Rp5.899.000',
                                          price: 'Rp5.699.000',
                                          discount: '3%',
                                          terjual: '30% Terjual',
                                          showStock: false,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CardProductFullSize extends StatelessWidget {
  const CardProductFullSize({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 8,
      ),
      width: 140,
      // height: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 7,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.network(
              url, fit: BoxFit.fill,
              // height: 140,
              // width: 140,
            ),
          ),
        ],
      ),
    );
  }
}

class CardProduct extends StatelessWidget {
  const CardProduct({
    Key? key,
    required this.url,
    required this.title,
    required this.price,
    required this.beforePrice,
    required this.discount,
    required this.terjual,
    required this.showStock,
  }) : super(key: key);

  final String url;
  final String title;
  final String price;
  final String beforePrice;
  final String discount;
  final String terjual;
  final bool showStock;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 8,
      ),
      width: 140,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 7,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.network(
              url,
              height: 140,
              width: 140,
            ),
          ),
          SizedBox(height: 4),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.left,
                  maxLines: 2,
                  style: TextStyle(
                    fontFamily: "Effra",
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  price,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: "Effra",
                    fontWeight: FontWeight.w600,
                    color: orangeColor,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Text(
                      beforePrice,
                      style: TextStyle(
                        fontFamily: "Effra",
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                        decorationColor: Colors.black,
                        decorationStyle: TextDecorationStyle.solid,
                        decoration: TextDecoration.lineThrough,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: redColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Text(
                        discount,
                        style: TextStyle(
                            fontFamily: "Effra",
                            fontWeight: FontWeight.w600,
                            color: redColor,
                            fontSize: 12),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: showStock ? 24 : 0,
                ),
                showStock
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(
                          32,
                        ),
                        child: Stack(
                          children: [
                            Container(
                              height: 22,
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xffF7B161).withOpacity(0.5),
                                borderRadius: BorderRadius.circular(
                                  32,
                                ),
                              ),
                            ),
                            Container(
                              height: 22,
                              width: 100,
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment
                                      .topRight, // 10% of the width, so there are ten blinds.
                                  colors: const <Color>[
                                    Color(0xffF7B161),
                                    Color(0xffEE8936)
                                  ], // red to yellow
                                  tileMode: TileMode
                                      .repeated, // repeats the gradient over the canvas
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/ic_flash.png',
                                        height: 12,
                                        width: 12,
                                      ),
                                      Text(
                                        terjual,
                                        style: TextStyle(
                                          fontFamily: "Effra",
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    : Container()
              ],
            ),
          )
        ],
      ),
    );
  }
}

class IconRow extends StatelessWidget {
  const IconRow({
    Key? key,
    required this.url,
    required this.title,
  }) : super(key: key);

  final String url;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52,
      color: Colors.white,
      margin: EdgeInsets.only(right: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            url,
            height: 38,
            width: 38,
          ),
          SizedBox(height: 4),
          Text(
            title,
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

class Indicator extends StatelessWidget {
  const Indicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: placeHolderColor,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
