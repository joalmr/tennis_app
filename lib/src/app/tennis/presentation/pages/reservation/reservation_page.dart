import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:tennis_app/src/app/tennis/presentation/widgets/reservation/ddl_instructors.dart';
import 'package:tennis_app/src/app/tennis/presentation/widgets/reservation/ddl_time.dart';
import 'package:tennis_app/src/app/tennis/presentation/widgets/reservation/ddl_time_end.dart';
import 'package:tennis_app/src/app/tennis/presentation/provider/courts_provider.dart';
import 'package:tennis_app/src/app/tennis/presentation/provider/reservation_provider.dart';
import 'package:tennis_app/src/shared/date_format.dart';
import 'package:tennis_app/src/shared/primary_button.dart';
import 'package:tennis_app/src/styles/colors.dart';

class ReservationPage extends StatefulWidget {
  const ReservationPage({super.key, required this.id});

  final int id;

  @override
  State<ReservationPage> createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  final controllerDate = TextEditingController();
  final controllerComment = TextEditingController();

  @override
  void initState() {
    super.initState();

    final provider = context.read<ReservationProvider>();
    final providerCourt = context.read<CourtsProvider>();

    providerCourt.getCourt(widget.id);

    provider.court = providerCourt.court;
    provider.timeStart = providerCourt.listTime.first.value;
    provider.timeEnd = providerCourt.listTime.length == 1
        ? providerCourt.listTime.first.value
        : providerCourt.listTime[1].value;
    provider.instructor = 1;

    controllerDate.text = f().format(provider.date!);
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ReservationProvider>();
    final providerCourt = context.read<CourtsProvider>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image(
                  width: MediaQuery.of(context).size.width,
                  height: 220,
                  image:
                      AssetImage("assets/images/${providerCourt.court?.image}"),
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
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.0325,
                  right: 32,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Container(
                margin: const EdgeInsets.only(top: 16),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          providerCourt.court?.name ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$${providerCourt.court?.price}',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                  fontWeight: FontWeight.bold, color: kBlue),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          providerCourt.court?.surfaceType ?? '',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          'Por hora',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(color: kGrey),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          Text(
                            "Disponible",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const SizedBox(width: 4),
                          Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                              color: kBlue,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          const Icon(
                            Icons.calendar_month_outlined,
                            color: Colors.black54,
                            size: 20,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "${providerCourt.court?.startString} a ${providerCourt.court?.endString}",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.black54,
                          size: 20,
                        ),
                        SizedBox(width: 2),
                        Text('Lima'),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: SelectInstructor(),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(16, 32, 16, 12),
              width: MediaQuery.of(context).size.width,
              color: kSkyBlue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Establecer fecha y hora',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 12),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      readOnly: true,
                      controller: controllerDate,
                      decoration: InputDecoration(
                        labelText: 'Fecha',
                        labelStyle: const TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: const Icon(
                          Icons.arrow_drop_down,
                          grade: 220,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                            color: kGrey,
                            style: BorderStyle.solid,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                            color: kGrey,
                            style: BorderStyle.solid,
                            width: 1,
                          ),
                        ),
                      ),
                      onTap: () {
                        final f = DateFormat('dd/MM/yyyy');
                        showDatePicker(
                          context: context,
                          initialDate: provider.date,
                          firstDate: DateTime.now(),
                          lastDate:
                              DateTime.now().add(const Duration(days: 12)),
                        ).then((value) {
                          if (value != null) {
                            controllerDate.text = f.format(value);
                            provider.date = value;
                          }
                        });
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SelectTimeStart(label: 'Hora de inicio'),
                        SelectTimeEnd(label: 'Hora de fin'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      'Agregar un comentario',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 24),
                    child: TextFormField(
                      controller: controllerComment,
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: 'Agregar un comentario',
                        hintStyle: const TextStyle(color: kGrey),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                            color: kGrey,
                            style: BorderStyle.solid,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                            color: kGrey,
                            style: BorderStyle.solid,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 53,
                    child: KPrimaryButton(
                      textButton: 'Reservar',
                      onPressed: () async {
                        Logger().i('Datos reserva');
                        if (provider.timeEnd! <= provider.timeStart!) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: kRed,
                              content: Text(
                                  'La hora de fin debe ser mayor a la hora de inicio'),
                            ),
                          );
                          return;
                        }

                        await provider
                            .createReservation(controllerComment.text);

                        if (provider.createdReservation != null) {
                          if (!context.mounted) return;
                          context.go('/home');
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
