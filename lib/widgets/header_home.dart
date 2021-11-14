import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:fl_blibli/blocs/authentication/blocs/authentication_bloc.dart';
import 'package:fl_blibli/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({
    Key? key,
    required this.isHideLocation,
  }) : super(key: key);

  final bool isHideLocation;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 44,
              left: 12,
              right: 12,
              bottom: 24,
            ),
            decoration: BoxDecoration(color: primary),
            width: double.infinity,
            child: !isHideLocation
                ? BlocBuilder<AuthenticationBloc, AuthenticationState>(
                    builder: (context, state) {
                    return Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.white,
                          size: 18,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          state.status == AuthenticationStatus.authenticated
                              ? state.user.username
                              : "Tambah Alamat",
                          style: const TextStyle(
                            fontFamily: "Effra",
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'biar belanja lebih asyik',
                          style: TextStyle(
                            fontFamily: "Effra",
                            fontWeight: FontWeight.w600,
                            color: Colors.white.withOpacity(0.6),
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.chevron_right,
                          color: Colors.white,
                          size: 18,
                        ),
                      ],
                    );
                  })
                : Container(height: 20),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: AnimatedContainer(
              margin: EdgeInsets.only(
                top: !isHideLocation ? 68 : 44,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 8,
              ),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              duration: const Duration(milliseconds: 200),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 12,
                  right: 12,
                  top: 4,
                ),
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
                        padding: const EdgeInsets.only(left: 12),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: AnimatedTextKit(
                            repeatForever: true,
                            animatedTexts: [
                              FadeAnimatedText(
                                'Popok bayi',
                                textStyle: const TextStyle(
                                  fontFamily: "Effra",
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              FadeAnimatedText(
                                'Iphone 13 pro',
                                textStyle: const TextStyle(
                                  fontFamily: "Effra",
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    BlocBuilder<AuthenticationBloc, AuthenticationState>(
                        builder: (context, state) {
                      return GestureDetector(
                        onTap: () {
                          state.status == AuthenticationStatus.authenticated
                              ? context
                                  .read<AuthenticationBloc>()
                                  .add(AuthenticationLogoutRequested())
                              : null;
                        },
                        child: Row(
                          children: [
                            const SizedBox(width: 4),
                            Icon(
                              Icons.login,
                              color: primary,
                              size: 18,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              state.status == AuthenticationStatus.authenticated
                                  ? 'Keluar'
                                  : 'Masuk',
                              style: TextStyle(
                                fontFamily: "Effra",
                                fontWeight: FontWeight.w600,
                                color: primary,
                              ),
                            )
                          ],
                        ),
                      );
                    })
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
