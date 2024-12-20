import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tennis_app/di.dart';
import 'package:tennis_app/src/app/tennis/presentation/provider/courts_provider.dart';
import 'package:tennis_app/src/app/tennis/presentation/provider/instructors_provider.dart';
import 'package:tennis_app/src/app/tennis/presentation/provider/reservation_provider.dart';
import 'package:tennis_app/src/app/user/presentation/provider/auth_provider.dart';
import 'package:tennis_app/src/routers/routes.dart';
import 'package:tennis_app/src/styles/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await GetStorage.init();
  await Supabase.initialize(
    url: dotenv.env['SUPA_URL']!,
    anonKey: dotenv.env['SUPA_KEY']!,
  );
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => GetIt.instance.get<AuthProvider>()),
        ChangeNotifierProvider(
            create: (_) => GetIt.instance.get<CourtsProvider>()),
        ChangeNotifierProvider(
            create: (_) => GetIt.instance.get<InstructorsProvider>()),
        ChangeNotifierProvider(
            create: (_) => GetIt.instance.get<ReservationProvider>()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Tennis App',
        theme: themeData,
        routerConfig: goRoute,
      ),
    );
  }
}
