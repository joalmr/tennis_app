import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tennis_app/di.dart';
import 'package:tennis_app/src/routers/routes.dart';
import 'package:tennis_app/src/styles/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Tennis App',
      theme: themeData,
      routerConfig: goRoute,
    );
    // return MultiProvider(
    //   providers: const [],
    //   child:
    // );
  }
}
