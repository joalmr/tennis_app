import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tennis_app/src/app/tennis/domain/entities/weather_entity.dart';
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

  final controllerDDLInstructor = TextEditingController();

  bool isEvaluated = false;

  bool isFavorite = false;

  ValueNotifier<WeatherForecastEntity?> weatherEntity = ValueNotifier(null);

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
  void dispose() {
    isEvaluated = false;
    super.dispose();
  }

  Future<WeatherForecastEntity> getWeather() async {
    final providerCourts = context.read<CourtsProvider>();
    final provider = context.read<ReservationProvider>();

    return await providerCourts.getForecastWeather(
      providerCourts.court!.location!,
      provider.date!.toIso8601String(),
      provider.timeStart,
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ReservationProvider>();
    final providerCourt = context.watch<CourtsProvider>();

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
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? kPrimaryColor : Colors.white,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
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
                              const SizedBox(width: 4),
                              const Image(
                                width: 16,
                                height: 16,
                                image: AssetImage("assets/images/calendar.png"),
                                fit: BoxFit.fill,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "${providerCourt.court?.startString} a ${providerCourt.court?.endString}",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ],
                          ),
                          Row(children: [
                            weatherEntity.value?.forecast == null
                                ? const SizedBox()
                                : Image.network(
                                    'http:${weatherEntity.value!.forecast!.forecastday!.first.hour!.first.condition!.icon}',
                                    height: 32,
                                  ),
                            weatherEntity.value?.forecast == null
                                ? const SizedBox()
                                : Text(weatherEntity.value!.forecast!
                                    .forecastday!.first.hour!.first.tempC
                                    .toString()),
                          ]),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        const Image(
                          width: 16,
                          height: 16,
                          image: AssetImage("assets/images/location.png"),
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(width: 2),
                        Text(providerCourt.court?.location ?? ''),
                      ],
                    ),
                    isEvaluated
                        ? const SizedBox()
                        : Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: SelectInstructor(
                              controller: controllerDDLInstructor,
                            ),
                          )
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(16, 32, 16, 12),
              width: MediaQuery.of(context).size.width,
              color: kSkyBlue,
              child: isEvaluated
                  //!
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
                          width: MediaQuery.of(context).size.width,
                          color: kSkyBlue,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Resumen',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Image(
                                            width: 12,
                                            height: 12,
                                            image: AssetImage(
                                                "assets/images/tennis.png"),
                                            fit: BoxFit.fill,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            providerCourt.court?.surfaceType ??
                                                '',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        children: [
                                          const Image(
                                            width: 12,
                                            height: 12,
                                            image: AssetImage(
                                                "assets/images/icon.png"),
                                            fit: BoxFit.fill,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            'Instructor: ${controllerDDLInstructor.text}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Image(
                                            width: 12,
                                            height: 12,
                                            image: AssetImage(
                                                "assets/images/calendar.png"),
                                            fit: BoxFit.fill,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            controllerDate.text,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        children: [
                                          const Image(
                                            width: 12,
                                            height: 12,
                                            image: AssetImage(
                                                "assets/images/watch.png"),
                                            fit: BoxFit.fill,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            provider.timePlay > 1
                                                ? '${provider.timePlay} horas'
                                                : '${provider.timePlay} hora',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(24, 32, 24, 12),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total a pagar',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '\$${provider.totalPrice}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: kBlue),
                                      ),
                                      Text(
                                        provider.timePlay > 1
                                            ? 'Por ${provider.timePlay} horas'
                                            : 'Por ${provider.timePlay} hora',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(color: kGrey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(32, 32, 32, 0),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 36,
                                  child: OutlinedButton(
                                    style: const ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(
                                            Colors.white),
                                        foregroundColor:
                                            WidgetStatePropertyAll(kBlue),
                                        side: WidgetStatePropertyAll(
                                            BorderSide(color: kBlue)),
                                        shape: WidgetStatePropertyAll(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8)),
                                          ),
                                        ),
                                        textStyle: WidgetStatePropertyAll(
                                          TextStyle(fontSize: 16),
                                        )),
                                    onPressed: () {
                                      setState(() {
                                        isEvaluated = false;
                                      });
                                    },
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image(
                                          width: 12,
                                          height: 12,
                                          image: AssetImage(
                                              "assets/images/calendar_blue.png"),
                                          fit: BoxFit.fill,
                                        ),
                                        SizedBox(width: 8),
                                        Text('Reprogramar reserva'),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 32, bottom: 8),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 53,
                                  child: KPrimaryButton(
                                    textButton: 'Pagar',
                                    onPressed: () async {
                                      await provider.createReservation(
                                        controllerComment.text,
                                        isFavorite,
                                      );

                                      if (provider.createdReservation == null) {
                                        if (!context.mounted) return;
                                        return;
                                      } else {
                                        if (!context.mounted) return;
                                        context.go('/home');
                                      }
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 12, bottom: 8),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 53,
                                  child: OutlinedButton(
                                    style: const ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(
                                            Colors.white),
                                        foregroundColor:
                                            WidgetStatePropertyAll(kTextColor),
                                        shape: WidgetStatePropertyAll(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8)),
                                          ),
                                        ),
                                        textStyle: WidgetStatePropertyAll(
                                          TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
                                    onPressed: () {
                                      context.pop();
                                    },
                                    child: const Text('Cancelar'),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 32),
                            ],
                          ),
                        ),
                      ],
                    )
                  //!
                  : Column(
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
                                lastDate: DateTime.now()
                                    .add(const Duration(days: 12)),
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
                            textCapitalization: TextCapitalization.sentences,
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

                              provider.evaluatingReservation().then((value) {
                                if (value['status'] == 'error') {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: kRed,
                                      content: Text(value['message']),
                                    ),
                                  );
                                } else {
                                  final totalPrice = provider.court!.price! *
                                      (provider.timeEnd! - provider.timeStart!);
                                  final timePlay =
                                      provider.timeEnd! - provider.timeStart!;

                                  provider.isEvaluatedData(
                                    totalPrice,
                                    timePlay,
                                  );
                                  //!
                                  getWeather().then((value) {
                                    setState(() {
                                      weatherEntity.value = value;
                                    });
                                  });

                                  setState(() {
                                    isEvaluated = true;
                                  });
                                }
                              });
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
