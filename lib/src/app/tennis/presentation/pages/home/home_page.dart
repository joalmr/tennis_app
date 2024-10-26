import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tennis_app/src/app/tennis/presentation/provider/courts_provider.dart';
import 'package:tennis_app/src/app/tennis/presentation/provider/reservation_provider.dart';
import 'package:tennis_app/src/app/tennis/presentation/widgets/home/canchas_widget.dart';
import 'package:tennis_app/src/app/tennis/presentation/widgets/home/reservas_widget.dart';
import 'package:tennis_app/src/app/user/presentation/provider/auth_provider.dart';
import 'package:tennis_app/src/shared/date_format.dart';
import 'package:tennis_app/src/styles/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final providerAuth = context.read<AuthProvider>();
    final provider = context.watch<CourtsProvider>();
    final providerReservation = context.watch<ReservationProvider>();

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Colors.black,
                kPrimaryColor,
              ],
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
                        onPressed: () {
                          //! Cerrar sesion en supabase
                          //TODO: corregir
                          providerAuth.signOut();
                          if (context.mounted) context.go("/");
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
            child: Text(
                "Hola Alonso!", //TODO: Cambiar por el nombre del usuario traido de storage
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: provider.courts.isEmpty
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Row(
                      children: [
                        for (var item in provider.courts)
                          CanchasWidget(
                            id: item.id!,
                            canchaImg: item.image!,
                            canchaTitle: item.name!,
                            canchaSubtitle: item.surfaceType!,
                            fecha: DateTime.now(),
                            startTime: item.startString!,
                            endTime: item.endString!,
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
          Column(
            children: [
              for (var item in providerReservation.reservations)
                ReservasWidget(
                  canchaImg: item.courts!.image!,
                  canchaTitle: item.courts!.name!,
                  personReserved: item.customers!.name!,
                  date: formattedDate(DateTime.parse(item.reservationDate!)),
                  hours: item.timePlay.toString(),
                  price: item.totalPrice.toString(),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
