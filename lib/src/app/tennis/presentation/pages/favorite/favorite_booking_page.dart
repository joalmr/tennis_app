import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tennis_app/src/app/tennis/presentation/provider/reservation_provider.dart';
import 'package:tennis_app/src/app/tennis/presentation/widgets/reservation_list/my_reservas_widget.dart';
import 'package:tennis_app/src/shared/date_format.dart';

class FavoriteBookingPage extends StatelessWidget {
  const FavoriteBookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ReservationProvider>();

    return provider.myReservationsFavorites.isEmpty
        ? const Center(child: Text('No tienes reservas favoritas'))
        : SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            for (var item in provider.myReservationsFavorites)
              MyReservasWidget(
                idReservation: item.id!,
                courtImg: item.courts!.image!,
                courtTitle: item.courts!.name!,
                courtSurface: item.courts!.surfaceType!,
                location: item.courts!.location!,
                personReserved: item.customers!.name!,
                date: formattedDate(DateTime.parse(item.reservationDate!)),
                dt: item.reservationDate!,
                timeStart: item.startTime!,
                hours: item.timePlay.toString(),
                price: item.totalPrice.toString(),
                instructor: item.instructors!.name!,
              ),
          ]));
  }
}
