import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_app/src/shared/date_format.dart';
import 'package:tennis_app/src/styles/colors.dart';

class CanchasWidget extends StatelessWidget {
  const CanchasWidget({
    super.key,
    required this.id,
    required this.canchaImg,
    required this.canchaTitle,
    required this.canchaSubtitle,
    required this.startTime,
    required this.endTime,
    required this.fecha,
  });
  final int id;
  final String canchaImg;
  final String canchaTitle;
  final String canchaSubtitle;
  final String startTime;
  final String endTime;
  final DateTime fecha;

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
              image: AssetImage("assets/images/$canchaImg"),
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
                        canchaTitle,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const Text('30°'),
                      //TODO: cambiar por los grados consumidos del servicio weatherapi
                    ],
                  ),
                  Text(
                    canchaSubtitle,
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
                          formattedDate(fecha),
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
                          "$startTime a $endTime",
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
                          context.push('/reservation/$id');
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
