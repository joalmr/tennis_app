import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tennis_app/src/app/tennis/presentation/provider/courts_provider.dart';
import 'package:tennis_app/src/styles/colors.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 8),
              child: Text(
                "Favoritos",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            context.watch<CourtsProvider>().favoriteCourts.isEmpty
                ? const Center(child: Text('No tienes favoritos'))
                : Column(
                    children: [
                      for (var item
                          in context.watch<CourtsProvider>().favoriteCourts)
                        Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 2),
                          child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 16,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: kSkyBlue,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      height: 60,
                                      child: Image(
                                        image: AssetImage(
                                            "assets/images/${item.courts!.image}"),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 3,
                                    child: SizedBox(
                                      width: double.maxFinite,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item.courts!.name!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(item.courts!.surfaceType!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium!),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        )
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
