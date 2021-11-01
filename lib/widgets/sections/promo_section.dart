// ignore_for_file: prefer_const_constructors

import 'package:fl_blibli/theme/theme.dart';
import 'package:fl_blibli/widgets/cards/card_product.dart';
import 'package:fl_blibli/widgets/cards/card_product_fullsize.dart';
import 'package:flutter/material.dart';

class PromoSection extends StatelessWidget {
  const PromoSection({
    Key? key,
  }) : super(key: key);

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
              const SizedBox(height: 12),
              Container(
                height: 254,
                padding: EdgeInsets.only(bottom: 12),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  children: const [
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
                      terjual: 20,
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
                      terjual: 20,
                      showStock: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
