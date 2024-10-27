import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tennis_app/src/app/user/presentation/provider/auth_provider.dart';
import 'package:tennis_app/src/shared/primary_button.dart';
import 'package:tennis_app/src/styles/colors.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final formKey = GlobalKey<FormState>();

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
                color: kBlue,
                height: 8,
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
                child: TextFormField(
                  controller: controllerFullName,
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese nombre y apellido';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: "Nombre y apellido",
                    labelStyle: TextStyle(color: kGrey),
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
                  controller: controllerPhone,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(11),
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese teléfono';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: "Teléfono",
                    labelStyle: TextStyle(color: kGrey),
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese contraseña';
                    }
                    if (value.length < 6) {
                      return 'La contraseña debe tener al menos 6 caracteres';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Contraseña",
                    labelStyle: const TextStyle(color: kGrey),
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese contraseña';
                    }
                    if (value.length < 6) {
                      return 'La contraseña debe tener al menos 6 caracteres';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Confirmar contraseña",
                    labelStyle: const TextStyle(color: kGrey),
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
                child: KPrimaryButton(
                  textButton: "Registrarme",
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      //! sign up
                      provider
                          .signUp(
                              controllerEmail.text,
                              controllerPassword.text,
                              controllerPasswordRepeat.text,
                              controllerFullName.text,
                              controllerPhone.text)
                          .then((value) {
                        if (value['status'] == 'error') {
                          if (!context.mounted) return;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(value['message']),
                              backgroundColor: kRed,
                            ),
                          );
                        } else {
                          if (!context.mounted) return;
                          context.go('/home');
                        }
                      });
                    }
                  },
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
                            color: kBlue,
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
      ),
    );
  }
}
