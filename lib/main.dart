import 'package:authentication_repository/authentication_repository.dart';
import 'package:fl_blibli/blocs/authentication/blocs/authentication_bloc.dart';
import 'package:fl_blibli/screens/account_screen.dart';
import 'package:fl_blibli/screens/category_screen.dart';
import 'package:fl_blibli/screens/home_screen.dart';
import 'package:fl_blibli/screens/login/login_screen.dart';
import 'package:fl_blibli/screens/official_screen.dart';
import 'package:fl_blibli/screens/splash_screen.dart';
import 'package:fl_blibli/widgets/icons/icon_orange_center.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';
import 'navigation/navigation_bar.dart';

void main() async {
  runApp(App(
    authenticationRepository: AuthenticationRepository(),
    userRepository: UserRepository(),
  ));
}

class App extends StatelessWidget {
  const App({
    Key? key,
    required this.authenticationRepository,
    required this.userRepository,
  }) : super(key: key);

  final AuthenticationRepository authenticationRepository;
  final UserRepository userRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authenticationRepository,
      child: BlocProvider(
        create: (_) => AuthenticationBloc(
          authenticationRepository: authenticationRepository,
          userRepository: userRepository,
        ),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            switch (state.status) {
              case AuthenticationStatus.authenticated:
                _navigator.pushAndRemoveUntil<void>(
                  HomePage.route(),
                  (route) => false,
                );
                break;
              case AuthenticationStatus.unauthenticated:
                _navigator.pushAndRemoveUntil<void>(
                  LoginPage.route(),
                  (route) => false,
                );
                break;
              default:
                break;
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => SplashScreen.route(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget currentScreen = const HomeScreen();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        {
          currentScreen = const HomeScreen();
          break;
        }
      case 1:
        {
          currentScreen = const CategoryScreen();
          break;
        }
      case 2:
        {
          currentScreen = const OfficalScreen();
          break;
        }
      case 3:
        {
          currentScreen = const AccountScreen();
          break;
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          currentScreen,
          OrangeIconCenter(size: size),
          NavigationBar(onItemTapped: _onItemTapped, current: _selectedIndex)
        ],
      ),
    );
  }
}
