import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tennis_app/src/app/user/presentation/provider/auth_provider.dart';
import 'package:tennis_app/src/styles/colors.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerPasswordRepeat = TextEditingController();
  final controllerFullName = TextEditingController();
  final controllerPhone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = context.read<AuthProvider>();
    final pWatch = context.watch<AuthProvider>();

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
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
              child: TextFormField(
                controller: controllerFullName,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  labelText: "Nombre y apellido",
                  labelStyle: TextStyle(color: Color(0xFF9B9C9D)),
                  prefix: Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Image(
                      image: AssetImage("assets/images/person.png"),
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
                controller: controllerEmail,
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
                controller: controllerPhone,
                keyboardType: TextInputType.phone,
                maxLength: 11,
                decoration: const InputDecoration(
                  labelText: "Teléfono",
                  labelStyle: TextStyle(color: Color(0xFF9B9C9D)),
                  prefix: Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Image(
                      image: AssetImage("assets/images/phone.png"),
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
                controller: controllerPassword,
                keyboardType: TextInputType.visiblePassword,
                obscureText: pWatch.togglePasswordVisibility,
                decoration: InputDecoration(
                  labelText: "Contraseña",
                  labelStyle: const TextStyle(color: Color(0xFF9B9C9D)),
                  prefix: const Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Image(
                      image: AssetImage("assets/images/lock.png"),
                      height: 16,
                      width: 16,
                    ),
                  ),
                  suffix: GestureDetector(
                    onTap: () => provider.togglePassword(),
                    child: const Image(
                      image: AssetImage("assets/images/visibility.png"),
                      height: 16,
                      width: 16,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 12,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
              child: TextFormField(
                controller: controllerPasswordRepeat,
                keyboardType: TextInputType.visiblePassword,
                obscureText: pWatch.togglePasswordVisibilityRepeat,
                decoration: InputDecoration(
                  labelText: "Confirmar contraseña",
                  labelStyle: const TextStyle(color: Color(0xFF9B9C9D)),
                  prefix: const Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Image(
                      image: AssetImage("assets/images/lock.png"),
                      height: 16,
                      width: 16,
                    ),
                  ),
                  suffix: GestureDetector(
                    onTap: () => provider.togglePasswordRepeat(),
                    child: const Image(
                      image: AssetImage("assets/images/visibility.png"),
                      height: 16,
                      width: 16,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 12,
                  ),
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
                onPressed: () async {
                  //! sign up con provider
                  if (controllerPassword.text ==
                      controllerPasswordRepeat.text) {
                    await provider.signUp(
                      controllerEmail.text,
                      controllerPassword.text,
                      controllerFullName.text,
                      controllerPhone.text,
                    );

                    if (provider.registerUser) {
                      if (!context.mounted) return;
                      context.go('/home');
                    }
                  }
                },
                child: const Text("Registrarme"),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 54, bottom: 32),
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
