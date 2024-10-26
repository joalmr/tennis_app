import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tennis_app/src/app/tennis/presentation/provider/courts_provider.dart';
import 'package:tennis_app/src/app/tennis/presentation/provider/reservation_provider.dart';
import 'package:tennis_app/src/app/tennis/presentation/widgets/home/canchas_widget.dart';
import 'package:tennis_app/src/app/tennis/presentation/widgets/home/reservas_widget.dart';
import 'package:tennis_app/src/shared/date_format.dart';
import 'package:tennis_app/src/shared/storage.data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CourtsProvider>();
    final providerReservation = context.watch<ReservationProvider>();

    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 12),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: MediaQuery.of(context).size.width,
          child: Text("Hola ${MyStorage().name}!",
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
                          location: item.location!,
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
        providerReservation.reservations.isEmpty
            ? const Center(child: Text("No hay reservas programadas"))
            : Column(
                children: [
                  for (var item in providerReservation.reservations)
                    ReservasWidget(
                      courtImg: item.courts!.image!,
                      courtTitle: item.courts!.name!,
                      courtSurface: item.courts!.surfaceType!,
                      location: item.courts!.location!,
                      personReserved: item.customers!.name!,
                      date:
                          formattedDate(DateTime.parse(item.reservationDate!)),
                      dt: item.reservationDate!,
                      timeStart: item.startTime!,
                      hours: item.timePlay.toString(),
                      price: item.totalPrice.toString(),
                    ),
                ],
              ),
      ],
    );
  }
}
