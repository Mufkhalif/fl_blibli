// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:fl_blibli/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        SvgPicture.asset(
          'assets/images/bg_account.svg',
          width: size.width,
        ),
        Container(
          padding: EdgeInsets.only(
            top: 58,
            right: 16,
            left: 16,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Akun',
                    style: const TextStyle(
                      fontFamily: "Effra",
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  SvgPicture.asset(
                    'assets/images/ic_chat.svg',
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Image.asset(
                      'assets/images/profile_basic.png',
                      // fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mufkhalif',
                        style: const TextStyle(
                          fontFamily: "Effra",
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Classic Member',
                        style: const TextStyle(
                          fontFamily: "Effra",
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 3,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BankIcon(
                      asset: 'assets/images/ic_blipay.svg',
                      iconName: 'Blipay',
                      value: 'Rp. 0',
                    ),
                    BankIcon(
                      asset: 'assets/images/ic_paylater.svg',
                      iconName: 'Paylater',
                      value: 'Rp. 10',
                    ),
                    BankIcon(
                      asset: 'assets/images/ic_rewards.svg',
                      iconName: 'Rewards',
                      value: '80 poin',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Image.asset('assets/images/banner_account.png'),
              SizedBox(
                height: 24,
              ),
              Container(
                padding: EdgeInsets.all(12),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 3,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Daftar Pesanan',
                      style: const TextStyle(
                        fontFamily: "Effra",
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Kategori belanja',
                      style: TextStyle(
                        fontFamily: "Effra",
                        fontWeight: FontWeight.w600,
                        color: greyColor,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconOrder(
                          asset: 'assets/images/order_now.png',
                          title: 'Menunggu',
                        ),
                        IconOrder(
                          asset: 'assets/images/order_now.png',
                          title: 'Saat ini',
                        ),
                        IconOrder(
                          asset: 'assets/images/order_done.png',
                          title: 'Selesai',
                        ),
                        IconOrder(
                          asset: 'assets/images/order_review.png',
                          title: 'Ulasan',
                        ),
                      ],
                    ),
                    Container(
                      color: Colors.grey.withOpacity(0.1),
                      height: 1,
                      margin: EdgeInsets.symmetric(
                        vertical: 14,
                      ),
                    ),
                    Row(children: [
                      Text(
                        'Kategori lainnya',
                        style: TextStyle(
                          fontFamily: "Effra",
                          fontWeight: FontWeight.w600,
                          color: greyColor,
                          fontSize: 16,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.chevron_right, color: greyColor)
                    ])
                  ],
                ),
              )
            ],
          ),
        ),
        // Container(
      ],
    );
  }
}

class IconOrder extends StatelessWidget {
  const IconOrder({
    Key? key,
    required this.asset,
    required this.title,
  }) : super(key: key);

  final String asset;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              asset,
              width: 52,
              height: 52,
            ),
          ],
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Effra",
            fontWeight: FontWeight.w600,
            fontSize: 12,
            color: greyColor,
          ),
        ),
      ],
    );
  }
}

class BankIcon extends StatelessWidget {
  const BankIcon({
    Key? key,
    required this.asset,
    required this.iconName,
    required this.value,
  }) : super(key: key);

  final String asset;
  final String iconName;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(asset),
            SizedBox(width: 8),
            Text(
              iconName,
              style: const TextStyle(
                fontFamily: "Effra",
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: Color(
                  0xff858585,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontFamily: "Effra",
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
