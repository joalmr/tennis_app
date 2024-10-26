import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tennis_app/src/app/tennis/domain/entities/weather_entity.dart';
import 'package:tennis_app/src/app/tennis/presentation/provider/courts_provider.dart';

class MyReservasWidget extends StatefulWidget {
  const MyReservasWidget({
    super.key,
    required this.idReservation,
    required this.courtImg,
    required this.courtTitle,
    required this.personReserved,
    required this.date,
    required this.hours,
    required this.price,
    required this.courtSurface,
    required this.dt,
    required this.location,
    required this.timeStart,
    required this.instructor,
  });
  final int idReservation;
  final String courtImg;
  final String courtTitle;
  final String personReserved;
  final String date;
  final String hours;
  final String price;
  final String dt;
  final String courtSurface;
  final String location;
  final int timeStart;
  final String instructor;

  @override
  State<MyReservasWidget> createState() => _MyReservasWidgetState();
}

class _MyReservasWidgetState extends State<MyReservasWidget> {
  ValueNotifier<WeatherForecastEntity?> weatherEntity = ValueNotifier(null);

  @override
  initState() {
    super.initState();
    getWeather().then((value) {
      if (mounted) {
        setState(() {
          weatherEntity.value = value;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<WeatherForecastEntity> getWeather() async {
    final providerCourts = context.read<CourtsProvider>();
    return await providerCourts.getForecastWeather(
        widget.location, widget.dt, widget.timeStart);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/reservationcheck/${widget.idReservation}');
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 2, left: 8, right: 8),
        child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
              border: Border.all(color: Colors.black12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    height: 60,
                    child: Image(
                      image: AssetImage("assets/images/${widget.courtImg}"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.courtTitle,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(fontWeight: FontWeight.bold),
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
                        const SizedBox(height: 2),
                        Text(
                          widget.courtSurface,
                          style: Theme.of(context).textTheme.titleMedium!,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_month_outlined,
                              color: Colors.black54,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              widget.date,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              "Reservado por:",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const SizedBox(width: 4),
                            const CircleAvatar(
                              backgroundColor: Colors.black,
                              radius: 10,
                              child: Icon(
                                Icons.person_outline,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              widget.personReserved,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            const Icon(
                              Icons.watch_later_outlined,
                              color: Colors.black54,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "${widget.hours} horas",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const VerticalDivider(
                              thickness: 1,
                              width: 16,
                            ),
                            Text(
                              "\$ ${widget.price}",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
