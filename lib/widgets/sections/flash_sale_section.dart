import 'package:fl_blibli/theme/theme.dart';
import 'package:fl_blibli/widgets/cards/card_product.dart';
import 'package:flutter/material.dart';

class FlashSaleSection extends StatelessWidget {
  const FlashSaleSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: sectionColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/flash_sale.png',
                  fit: BoxFit.cover,
                  height: 18,
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
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
                const Spacer(),
                const Text(
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
          const SizedBox(height: 12),
          SizedBox(
            height: 280,
            child: ListView(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              children: const [
                SizedBox(width: 12),
                CardProduct(
                  url:
                      'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/medium/MTA-7089389/xiaomi_xiaomi_mi_led_4_android_tv_-43_inch-_full06_e0deicop.png',
                  title: 'Xiaomi Mi LED 4 Android TV [43 Inch]',
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
          )
        ],
      ),
    );
  }
}
