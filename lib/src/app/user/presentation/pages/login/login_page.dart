import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tennis_app/src/app/user/presentation/provider/auth_provider.dart';
import 'package:tennis_app/src/shared/primary_button.dart';
import 'package:tennis_app/src/shared/storage.data.dart';
import 'package:tennis_app/src/styles/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (MyStorage().email.isNotEmpty && MyStorage().password.isNotEmpty) {
      controllerEmail.text = MyStorage().email;
      controllerPassword.text = MyStorage().password;
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AuthProvider>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
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
                        child:
                            const Icon(Icons.arrow_back, color: Colors.white),
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
                color: kBlue,
                height: 8,
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
                child: TextFormField(
                  controller: controllerEmail,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese email';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(color: kGrey),
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
                  controller: controllerPassword,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese contraseña';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: "Contraseña",
                    labelStyle: TextStyle(color: kGrey),
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
                  onTap: () async {
                    setState(() {
                      MyStorage().isRemember = !MyStorage().isRemember;
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: MyStorage().isRemember
                              ? kPrimaryColor
                              : Colors.white,
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
                    color: kBlue,
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 32, right: 32, top: 42),
                  width: MediaQuery.of(context).size.width,
                  height: 53,
                  child: KPrimaryButton(
                    textButton: "Iniciar sesión",
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        //! sign in
                        provider
                            .signIn(
                                controllerEmail.text, controllerPassword.text)
                            .then((value) {
                          if (value != null) {
                            if (MyStorage().isRemember) {
                              MyStorage().email = controllerEmail.text;
                              MyStorage().password = controllerPassword.text;
                            } else {
                              MyStorage().email = "";
                              MyStorage().password = "";
                            }
                            if (!context.mounted) return;
                            context.go('/home');
                          }
                        });
                      }
                    },
                  )),
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
                            color: kBlue,
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
      ),
    );
  }
}
