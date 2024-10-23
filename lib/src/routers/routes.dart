import 'package:go_router/go_router.dart';
import 'package:tennis_app/src/app/tennis/presentation/pages/home/home_page.dart';
import 'package:tennis_app/src/app/user/presentation/pages/login/login_page.dart';
import 'package:tennis_app/src/app/user/presentation/pages/register/register_page.dart';
import 'package:tennis_app/src/app/user/presentation/pages/welcome/welcome_page.dart';

final GoRouter goRoute = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const WelcomePage();
      },
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) {
        return const LoginPage();
      },
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) {
        return const RegisterPage();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) {
        return const HomePage();
      },
    ),
  ],
);
