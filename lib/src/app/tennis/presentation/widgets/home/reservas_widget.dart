import 'package:flutter/material.dart';

class ReservasWidget extends StatelessWidget {
  const ReservasWidget(
      {super.key,
      required this.canchaImg,
      required this.canchaTitle,
      required this.personReserved,
      required this.date,
      required this.hours,
      required this.price});
  final String canchaImg;
  final String canchaTitle;
  final String personReserved;
  final String date;
  final String hours;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 2),
      child: Container(
          color: const Color(0xFFF4F7FC),
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
                    image: AssetImage("assets/images/$canchaImg.png"),
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
                      Text(
                        canchaTitle,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontWeight: FontWeight.bold),
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
                            date,
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
                            personReserved,
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
                            "$hours horas",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const VerticalDivider(
                            thickness: 1,
                            width: 16,
                          ),
                          Text(
                            "\$ $price",
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
