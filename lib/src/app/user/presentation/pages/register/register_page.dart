import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_app/src/styles/colors.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image(
                  width: MediaQuery.of(context).size.width,
                  image: const AssetImage("assets/images/appbar.png"),
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.0525,
                  left: 32,
                  child: GestureDetector(
                    onTap: () => context.pop(),
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32, top: 42),
              child: Text(
                "Registro",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Divider(
              thickness: 1,
              indent: 32,
              endIndent: MediaQuery.of(context).size.width * 0.7,
              color: const Color(0xFF346BC3),
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
              child: TextFormField(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
              child: TextFormField(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
              child: TextFormField(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
              child: TextFormField(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
              child: TextFormField(),
            ),
            Container(
              margin: const EdgeInsets.only(left: 32, right: 32, top: 42),
              width: MediaQuery.of(context).size.width,
              height: 53,
              child: ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(kPrimaryColor),
                    foregroundColor: WidgetStatePropertyAll(kTextColorContrast),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                    textStyle: WidgetStatePropertyAll(
                      TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                onPressed: () {},
                child: const Text("Registrarme"),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 54),
                child: Text.rich(
                  TextSpan(
                    text: "Ya tengo cuenta ",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                        text: "Iniciar sesión",
                        style: const TextStyle(
                          color: Color(0xFF346BC3),
                          fontSize: 16,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => context.push('/login'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
