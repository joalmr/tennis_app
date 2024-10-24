import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_app/src/shared/primary_button.dart';
import 'package:tennis_app/src/shared/secondary_button.dart';
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
                    child: KPrimaryButton(
                      textButton: "Iniciar sesión",
                      onPressed: () => context.push('/login'),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 32),
                    width: MediaQuery.of(context).size.width,
                    height: 53,
                    child: KSecondaryButton(
                      textButton: "Registrarme",
                      onPressed: () => context.push('/register'),
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
