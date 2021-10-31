import 'package:fl_blibli/theme/theme.dart';
import 'package:flutter/material.dart';

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
      margin: const EdgeInsets.only(
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
            offset: const Offset(0, 4),
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
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(
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
                  style: const TextStyle(
                    fontFamily: "Effra",
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
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
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Text(
                      beforePrice,
                      style: const TextStyle(
                        fontFamily: "Effra",
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                        decorationColor: Colors.black,
                        decorationStyle: TextDecorationStyle.solid,
                        decoration: TextDecoration.lineThrough,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
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
                              padding: const EdgeInsets.symmetric(
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
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment
                                      .topRight, // 10% of the width, so there are ten blinds.
                                  colors: <Color>[
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
                                        style: const TextStyle(
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
