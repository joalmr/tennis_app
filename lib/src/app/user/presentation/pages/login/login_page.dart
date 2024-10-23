import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_app/src/styles/colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                "Iniciar sesión",
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
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(color: Color(0xFF9B9C9D)),
                  prefix: Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Image(
                      image: AssetImage("assets/images/mail.png"),
                      height: 16,
                      width: 16,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 12,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
              child: TextFormField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Contraseña",
                  labelStyle: TextStyle(color: Color(0xFF9B9C9D)),
                  prefix: Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Image(
                      image: AssetImage("assets/images/lock.png"),
                      height: 16,
                      width: 16,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 12,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 24),
              child: GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Colors.black38, width: 0.5),
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Text("Recordar contraseña"),
                  ],
                ),
              ),
            ),
            const Center(
              child: Text(
                "¿Olvidaste tu contraseña?",
                style: TextStyle(
                  color: Color(0xFF346BC3),
                  fontSize: 16,
                ),
              ),
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
                onPressed: () => context.go('/home'),
                child: const Text("Iniciar sesión"),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 54),
                child: Text.rich(
                  TextSpan(
                    text: "¿Aun no tienes cuenta? ",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                        text: "Regístrate",
                        style: const TextStyle(
                          color: Color(0xFF346BC3),
                          fontSize: 16,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => context.push('/register'),
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
