import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tennis_app/src/app/tennis/presentation/provider/courts_provider.dart';
import 'package:tennis_app/src/app/tennis/presentation/provider/reservation_provider.dart';
import 'package:tennis_app/src/shared/date_format.dart';
import 'package:tennis_app/src/styles/colors.dart';

class ReservationCheckPage extends StatefulWidget {
  const ReservationCheckPage({
    super.key,
    required this.idReservation,
  });

  final int idReservation;

  @override
  State<ReservationCheckPage> createState() => _ReservationCheckPageState();
}

class _ReservationCheckPageState extends State<ReservationCheckPage> {
  @override
  void initState() {
    super.initState();
    final provider = context.read<ReservationProvider>();
    provider.getReservationById(widget.idReservation);
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ReservationProvider>();
    final providerCourt = context.watch<CourtsProvider>();

    return Scaffold(
      body: provider.reservation == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Image(
                        width: MediaQuery.of(context).size.width,
                        height: 220,
                        image: AssetImage(
                            "assets/images/${provider.reservation?.courts!.image}"),
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
                            child: const Icon(Icons.arrow_back,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.0325,
                        right: 32,
                        child: IconButton(
                          onPressed: () {
                            providerCourt
                                .putFavorite(provider.reservation!.courts!.id!);
                          },
                          icon: Icon(
                            providerCourt.isFavorite(
                                    provider.reservation!.courts!.id!)
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: providerCourt.isFavorite(
                                    provider.reservation!.courts!.id!)
                                ? kPrimaryColor
                                : Colors.white,
                            size: 32,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(24, 32, 24, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                provider.reservation!.courts!.name!,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '\$${provider.reservation!.courts!.price}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: kBlue),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                provider.reservation!.courts!.surfaceType!,
                                style: Theme.of(context).textTheme.bodySmall,
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
                          Row(
                            children: [
                              Text(
                                "Disponible",
                                style: Theme.of(context).textTheme.bodySmall,
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
                                "${provider.reservation!.courts!.startString} a ${provider.reservation!.courts!.endString}",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
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
                              Text(provider.reservation!.courts!.location!,
                                  style: Theme.of(context).textTheme.bodySmall),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                      provider
                                          .reservation!.courts!.surfaceType!,
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Image(
                                      width: 12,
                                      height: 12,
                                      image:
                                          AssetImage("assets/images/icon.png"),
                                      fit: BoxFit.fill,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      'Instructor: ${provider.reservation!.instructors!.name!}',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                      f().format(DateTime.parse(provider
                                          .reservation!.reservationDate!)),
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Image(
                                      width: 12,
                                      height: 12,
                                      image:
                                          AssetImage("assets/images/watch.png"),
                                      fit: BoxFit.fill,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      provider.reservation!.timePlay! > 1
                                          ? '${provider.reservation!.timePlay!} horas'
                                          : '${provider.reservation!.timePlay!} hora',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total pagado',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '\$${provider.reservation!.totalPrice}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: kBlue),
                                ),
                                Text(
                                  provider.reservation!.timePlay! > 1
                                      ? 'Por ${provider.reservation!.timePlay!} horas'
                                      : 'Por ${provider.reservation!.timePlay!} hora',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: kGrey),
                                ),
                              ],
                            ),
                          ],
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
