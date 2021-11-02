// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:fl_blibli/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                left: 12,
                right: 12,
                top: 63,
                bottom: 12,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 3,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(Icons.close, color: Colors.black, size: 18),
                  SizedBox(width: 12),
                  Text(
                    'Masuk',
                    style: const TextStyle(
                      fontFamily: "Effra",
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.red,
              width: size.width,
              child: Image.asset('assets/images/login_banner.png',
                  fit: BoxFit.fitWidth),
            ),
            SizedBox(height: 24),
            Text(
              'Masuk ke akunmu',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Effra",
                fontWeight: FontWeight.w600,
                color: primary,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 3,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  TextInput(
                    placeholder: "Email/nomor HP",
                    isPassword: false,
                  ),
                  TextInput(
                    placeholder: "Kata sandi",
                    isPassword: true,
                  ),
                  InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Tap'),
                      ));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 16.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: inputPlaceholderColor,
                      ),
                      child: Text(
                        'Masuk',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Effra",
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Masuk dengan sms',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Effra",
                            fontWeight: FontWeight.w600,
                            color: primary,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Lupa Kata sandi?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Effra",
                            fontWeight: FontWeight.w600,
                            color: primary,
                          ),
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
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonOtherLogin(isGoogle: false),
                  SizedBox(width: 8),
                  ButtonOtherLogin(isGoogle: true),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  Text(
                    'Tidak punyak akun?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Effra",
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Daftar',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Effra",
                        fontWeight: FontWeight.w600,
                        color: primary,
                      ),
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

class ButtonOtherLogin extends StatelessWidget {
  const ButtonOtherLogin({
    Key? key,
    required this.isGoogle,
  }) : super(key: key);

  final bool isGoogle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 16.0,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: isGoogle ? googleColor : fbColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(isGoogle
                  ? 'assets/images/ic_google.svg'
                  : 'assets/images/ic_facebook.svg'),
              SizedBox(width: 8),
              Text(
                isGoogle ? 'Google' : 'Facebook',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Effra",
                  fontWeight: FontWeight.w600,
                  color: isGoogle ? Colors.grey : Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TextInput extends StatefulWidget {
  const TextInput({
    Key? key,
    required this.placeholder,
    required this.isPassword,
  }) : super(key: key);

  final String placeholder;
  final bool isPassword;

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  Color _bgColor = inputPlaceholderColor;

  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: Focus(
        onFocusChange: (hasFocus) {
          setState(
              () => _bgColor = hasFocus ? Colors.white : inputPlaceholderColor);
        },
        child: TextFormField(
          obscureText: widget.isPassword
              ? true
              : _passwordVisible
                  ? true
                  : false,
          decoration: InputDecoration(
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  )
                : null,
            filled: true,
            fillColor: _bgColor,
            hoverColor: Colors.red,
            focusColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            labelText: widget.placeholder,
            hintStyle: TextStyle(
              fontFamily: "Effra",
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: inputPlaceholderColor,
              ),
              borderRadius: BorderRadius.circular(18),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: primary,
              ),
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          style: TextStyle(
            fontFamily: "Effra",
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
