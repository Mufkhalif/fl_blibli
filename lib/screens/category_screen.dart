// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:fl_blibli/models/side_icon.dart';
import 'package:fl_blibli/static/side_icon_item.dart';
import 'package:fl_blibli/theme/theme.dart';
import 'package:fl_blibli/widgets/carousel_home.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int _currentTab = 0;

  Widget content = SectionRight(
    title: 'Fashion Muslim Rekomendasi',
  );

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final List<SideIcon> listCinema =
        sideIconItem.map((e) => SideIcon.fromJson(e)).toList();

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: white1Color,
            width: size.width / 4,
            height: size.height,
            child: ListView(
              children: [
                ...listCinema.map((item) {
                  return IconSide(
                    asset: item.asset,
                    isSelected: _currentTab == item.id,
                    title: item.title,
                    onTap: () {
                      setState(() {
                        _currentTab = item.id;
                        content = SectionRight(
                          title: item.title,
                        );
                      });
                    },
                  );
                }),
                SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
          Container(
            width: size.width - (size.width / 4),
            color: white1Color,
            height: size.height,
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 600),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return SlideTransition(
                  position:
                      Tween<Offset>(begin: Offset(0, -1.2), end: Offset(0, 0))
                          .animate(animation),
                  child: child,
                );
              },
              child: _currentTab == 1
                  ? SectionRight(
                      key: UniqueKey(),
                      title: 'Fashion Muslim Rekomendasi',
                    )
                  : SectionRight(
                      key: UniqueKey(),
                      title: 'Fashion Muslim Rekomendasi',
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class SectionRight1 extends StatefulWidget {
  const SectionRight1({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<SectionRight1> createState() => _SectionRight1State();
}

class _SectionRight1State extends State<SectionRight1> {
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
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
        SizedBox(height: 24),
        Container(
          padding: EdgeInsets.only(left: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  fontFamily: "Effra",
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 12),
              Wrap(
                children: [
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

class SectionRight extends StatefulWidget {
  const SectionRight({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<SectionRight> createState() => _SectionRightState();
}

class _SectionRightState extends State<SectionRight> {
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
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
        SizedBox(height: 24),
        Container(
          padding: EdgeInsets.only(left: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  fontFamily: "Effra",
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 12),
              Wrap(
                children: [
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

class CardRecomended extends StatelessWidget {
  const CardRecomended({
    Key? key,
    required this.url,
    required this.title,
  }) : super(key: key);

  final String url;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 12, bottom: 12),
      width: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                color: white1Color,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.4),
                  width: 1,
                )),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                url,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Effra",
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

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
        margin: EdgeInsets.all(8.0),
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
        duration: Duration(milliseconds: 400),
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
              SizedBox(height: 4),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Effra",
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
