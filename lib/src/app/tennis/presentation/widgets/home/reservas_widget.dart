import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tennis_app/src/app/tennis/domain/entities/weather/weather_entity.dart';
import 'package:tennis_app/src/app/tennis/presentation/provider/courts_provider.dart';
import 'package:tennis_app/src/styles/colors.dart';

class ReservasWidget extends StatefulWidget {
  const ReservasWidget({
    super.key,
    required this.canchaImg,
    required this.canchaTitle,
    required this.personReserved,
    required this.date,
    required this.hours,
    required this.price,
    required this.dt,
    required this.timeStart,
    required this.timeEnd,
    required this.location,
  });
  final String canchaImg;
  final String canchaTitle;
  final String personReserved;
  final String date;
  final String hours;
  final String price;
  final String dt;
  final int timeStart;
  final int timeEnd;
  final String location;

  @override
  State<ReservasWidget> createState() => _ReservasWidgetState();
}

class _ReservasWidgetState extends State<ReservasWidget> {
  ValueNotifier<WeatherEntity?> weatherEntity = ValueNotifier(null);

  @override
  initState() {
    super.initState();
    getWeather();
  }

  getWeather() async {
    final providerCourts = context.read<CourtsProvider>();
    weatherEntity.value = await providerCourts.getForecastWeather(
        widget.location, widget.dt, null);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 2),
      child: Container(
          color: kSkyBlue,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
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
                    image: AssetImage("assets/images/${widget.canchaImg}"),
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
                            widget.canchaTitle,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              weatherEntity.value?.current == null
                                  ? const SizedBox()
                                  : Image.network(
                                      'http:${weatherEntity.value!.current!.condition!.icon}',
                                      height: 32,
                                    ),
                              weatherEntity.value?.current == null
                                  ? const SizedBox()
                                  : Text(weatherEntity.value!.current!.tempC
                                      .toString()),
                            ],
                          ),
                        ],
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
    );
  }
}
