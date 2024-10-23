import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_app/src/styles/colors.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            image: const AssetImage("assets/images/bg.png"),
            fit: BoxFit.cover,
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.1,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.15,
                image: const AssetImage("assets/logo/logo.png"),
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.189,
            right: MediaQuery.of(context).size.width * 0.06,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.045,
                backgroundColor: kPrimaryColor,
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.1,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    margin:
                        const EdgeInsets.only(left: 32, right: 32, bottom: 20),
                    width: MediaQuery.of(context).size.width,
                    height: 53,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(kPrimaryColor),
                          foregroundColor:
                              WidgetStatePropertyAll(kTextColorContrast),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                          ),
                          textStyle: WidgetStatePropertyAll(
                            TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      onPressed: () => context.push('/login'),
                      child: const Text("Iniciar sesión"),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 32),
                    width: MediaQuery.of(context).size.width,
                    height: 53,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.white24),
                          foregroundColor:
                              WidgetStatePropertyAll(kTextColorContrast),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                          ),
                          textStyle: WidgetStatePropertyAll(
                            TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      onPressed: () => context.push('/register'),
                      child: const Text("Registrarme"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
