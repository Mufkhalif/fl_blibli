// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:authentication_repository/authentication_repository.dart';
import 'package:fl_blibli/screens/login/bloc/login_bloc.dart';
import 'package:fl_blibli/theme/theme.dart';
import 'package:fl_blibli/widgets/button/button_otherlogin.dart';
import 'package:fl_blibli/widgets/textfield/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:user_repository/user_repository.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
            authenticationRepository:
                RepositoryProvider.of<AuthenticationRepository>(context),
            userRepository: UserRepository(),
          );
        },
        child: LoginScreen(),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => LoginScreen());
  }

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    var _blocBuilder = BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return InkWell(
          onTap: state.status.isValidated
              ? () => context.read<LoginBloc>().add(LoginSubmitted())
              : null,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 16.0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: state.status.isValidated ? primary : inputPlaceholderColor,
            ),
            child: Text(
              'Masuk',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Effra",
                fontWeight: FontWeight.w600,
                color: state.status.isValidated ? Colors.white : Colors.grey,
                fontSize: 16,
              ),
            ),
          ),
        );
      },
    );

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
                const SnackBar(content: Text('Authentication Failure')));
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
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
                      BlocBuilder<LoginBloc, LoginState>(
                        buildWhen: (previous, current) =>
                            previous.username != current.username,
                        builder: (context, state) {
                          return TextInput(
                            key: const Key('loginForm_usernameInput_textField'),
                            placeholder: "Email/nomor HP",
                            isPassword: false,
                            onChanged: (value) => context.read<LoginBloc>().add(
                                  LoginUsernameChanged(value),
                                ),
                            errorText: state.username.invalid
                                ? 'Email/nomor HP tidak valid'
                                : null,
                          );
                        },
                      ),
                      BlocBuilder<LoginBloc, LoginState>(
                        buildWhen: (previous, current) =>
                            previous.password != current.password,
                        builder: (context, state) {
                          return TextInput(
                            key: const Key('loginForm_passwordInput_textField'),
                            placeholder: "Kata sandi",
                            isPassword: true,
                            onChanged: (value) => context.read<LoginBloc>().add(
                                  LoginPasswordChanged(value),
                                ),
                            errorText: state.password.invalid
                                ? 'Password tidak boleh kosong'
                                : null,
                          );
                        },
                      ),
                      _blocBuilder,
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
        ),
      ),
    );
  }
}
