import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tennis_app/src/app/tennis/presentation/pages/home/home_page.dart';
import 'package:tennis_app/src/app/user/presentation/pages/login/login_page.dart';
import 'package:tennis_app/src/app/user/presentation/pages/register/register_page.dart';
import 'package:tennis_app/src/app/user/presentation/pages/welcome/welcome_page.dart';

final supabase = Supabase.instance.client;

final GoRouter goRoute = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) {
        return supabase.auth.currentUser != null
            ? const HomePage()
            : const WelcomePage();
      },
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) {
        return LoginPage();
      },
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) {
        return RegisterPage();
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
