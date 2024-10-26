import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tennis_app/src/app/tennis/domain/entities/weather_entity.dart';
import 'package:tennis_app/src/app/tennis/presentation/provider/courts_provider.dart';
import 'package:tennis_app/src/shared/date_format.dart';
import 'package:tennis_app/src/styles/colors.dart';

class CanchasWidget extends StatefulWidget {
  const CanchasWidget({
    super.key,
    required this.id,
    required this.canchaImg,
    required this.canchaTitle,
    required this.canchaSubtitle,
    required this.startTime,
    required this.endTime,
    required this.fecha,
    required this.location,
  });
  final int id;
  final String canchaImg;
  final String canchaTitle;
  final String canchaSubtitle;
  final String startTime;
  final String endTime;
  final DateTime fecha;
  final String location;

  @override
  State<CanchasWidget> createState() => _CanchasWidgetState();
}

class _CanchasWidgetState extends State<CanchasWidget> {
  ValueNotifier<WeatherForecastEntity?> weatherEntity = ValueNotifier(null);

  @override
  initState() {
    getWeather(widget.location).then((value) {
      if (mounted) {
        setState(() {
          weatherEntity.value = value;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<WeatherForecastEntity> getWeather(String location) async {
    final providerCourts = context.read<CourtsProvider>();
    return await providerCourts.getForecastWeather(
        location, DateTime.now().toIso8601String().split('T')[0], null);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, right: 20),
      child: Container(
        width: 280,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.black12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage("assets/images/${widget.canchaImg}"),
              height: 200,
              fit: BoxFit.fill,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.canchaTitle,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Row(children: [
                        weatherEntity.value?.current == null
                            ? const SizedBox()
                            : Image.network(
                                'http:${weatherEntity.value!.current!.condition!.icon}',
                                height: 32,
                              ),
                        weatherEntity.value?.current == null
                            ? const SizedBox()
                            : Text(
                                weatherEntity.value!.current!.tempC.toString()),
                      ]),
                    ],
                  ),
                  Text(
                    widget.canchaSubtitle,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.calendar_month_outlined,
                          color: Colors.black54,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          formattedDate(widget.fecha),
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
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
                          "${widget.startTime} a ${widget.endTime}",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(0, 24, 0, 12),
                      height: 32,
                      child: ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(kPrimaryColor),
                          foregroundColor:
                              WidgetStatePropertyAll(kTextColorContrast),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                          ),
                          textStyle: WidgetStatePropertyAll(
                            TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          padding: WidgetStatePropertyAll(EdgeInsets.symmetric(
                            horizontal: 41,
                            vertical: 6,
                          )),
                        ),
                        onPressed: () {
                          context.push('/reservation/${widget.id}');
                        },
                        child: const Text("Reservar"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
