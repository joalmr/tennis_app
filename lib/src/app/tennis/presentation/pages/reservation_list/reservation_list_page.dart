import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tennis_app/src/app/tennis/presentation/provider/reservation_provider.dart';
import 'package:tennis_app/src/app/tennis/presentation/widgets/reservation_list/my_reservas_widget.dart';
import 'package:tennis_app/src/shared/date_format.dart';
import 'package:tennis_app/src/styles/colors.dart';

class ReservationListPage extends StatefulWidget {
  const ReservationListPage({super.key});

  @override
  State<ReservationListPage> createState() => _ReservationListPageState();
}

class _ReservationListPageState extends State<ReservationListPage> {
  @override
  void initState() {
    final provider = context.read<ReservationProvider>();
    provider.getReservations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ReservationProvider>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 8),
              child: Text(
                "Mis Reservas",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            provider.myReservations.isEmpty
                ? const Center(child: Text('No tienes reservas'))
                : Column(
                    children: [
                      for (var item in provider.myReservations)
                        Dismissible(
                          key: UniqueKey(),
                          direction: DismissDirection.endToStart,
                          background: Container(color: kRed),
                          confirmDismiss: (direction) {
                            return showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text(
                                  'Eliminar',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                content: const Text(
                                    'Seguro que desea eliminar la reserva?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      provider.deleteReservation(item.id!);
                                      context.pop();
                                    },
                                    child: const Text('Eliminar'),
                                  ),
                                  TextButton(
                                    onPressed: () => context.pop(),
                                    child: const Text('Cancelar'),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: MyReservasWidget(
                            courtImg: item.courts!.image!,
                            courtTitle: item.courts!.name!,
                            personReserved: item.customers!.name!,
                            date: formattedDate(
                                DateTime.parse(item.reservationDate!)),
                            hours: item.timePlay.toString(),
                            price: item.totalPrice.toString(),
                            courtSurface: item.courts!.surfaceType!,
                          ),
                        ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
