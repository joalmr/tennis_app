import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tennis_app/src/app/tennis/presentation/widgets/home/canchas_widget.dart';
import 'package:tennis_app/src/app/tennis/presentation/widgets/home/reservas_widget.dart';
import 'package:tennis_app/src/app/user/presentation/provider/auth_provider.dart';
import 'package:tennis_app/src/styles/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final providerAuth = context.read<AuthProvider>();

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Colors.black, Color(0xFF82BC00)],
            ),
          ),
        ),
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Stack(
            children: [
              const Text(
                'Tennis court',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.01,
                right: MediaQuery.of(context).size.width * 0.069,
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.016,
                  backgroundColor: kPrimaryColor,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('¿Deseas cerrar sesión?'),
                    actions: [
                      TextButton(
                        style: const ButtonStyle(
                          foregroundColor: WidgetStatePropertyAll(Colors.red),
                        ),
                        onPressed: () async {
                          //! Cerrar sesion en supabase
                          await providerAuth.signOut();
                          if (!context.mounted) return;
                          context.go("/");
                        },
                        child: const Text('Cerrar sesión'),
                      ),
                      TextButton(
                        onPressed: () => context.pop(),
                        child: const Text('Cancelar'),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(
              Icons.person_outline,
              color: Colors.white,
            ),
          ),
          const IconButton(
            onPressed: null,
            icon: Icon(
              Icons.notifications_none_outlined,
              color: Colors.white,
            ),
          ),
          const IconButton(
            onPressed: null,
            icon: Icon(
              Icons.menu_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 12),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: MediaQuery.of(context).size.width,
            child: Text("Hola Alonso!",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    )),
          ),
          const Divider(color: Colors.black12),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 8),
            child: Text(
              "Canchas",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Row(
                children: [
                  CanchasWidget(
                    canchaImg: "epic_tennis",
                    canchaTitle: "Epic Box",
                    canchaSubtitle: "Cancha tipo A",
                    fecha: "20 de Octubre 2024",
                    disponible: "7:00 am a 4:00 pm",
                  ),
                  CanchasWidget(
                    canchaImg: "rusty_tennis",
                    canchaTitle: "Rusty Tennis",
                    canchaSubtitle: "Cancha tipo C",
                    fecha: "21 de Octubre 2024",
                    disponible: "7:00 am a 4:00 pm",
                  ),
                  CanchasWidget(
                    canchaImg: "multiple_tennis",
                    canchaTitle: "Cancha Multiple",
                    canchaSubtitle: "Cancha tipo B",
                    fecha: "22 de Octubre 2024",
                    disponible: "7:00 am a 4:00 pm",
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Divider(color: Colors.black12),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 8),
            child: Text(
              "Reservas programadas",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const Column(
            children: [
              ReservasWidget(
                canchaImg: "rusty_tennis",
                canchaTitle: "Rusty Tennis",
                personReserved: "Alonso Massa",
                date: "21 de Octubre 2024",
                hours: "2",
                price: "50",
              ),
              ReservasWidget(
                canchaImg: "rusty_tennis",
                canchaTitle: "Rusty Tennis",
                personReserved: "Alonso Massa",
                date: "24 de Octubre 2024",
                hours: "2",
                price: "50",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
