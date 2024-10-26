import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tennis_app/src/app/tennis/presentation/pages/favorite/favorite_page.dart';
import 'package:tennis_app/src/app/tennis/presentation/pages/home/home_page.dart';
import 'package:tennis_app/src/app/tennis/presentation/pages/reservation_list/reservation_list_page.dart';
import 'package:tennis_app/src/app/user/presentation/provider/auth_provider.dart';
import 'package:tennis_app/src/styles/colors.dart';

class HomePageNav extends StatefulWidget {
  const HomePageNav({super.key});

  @override
  State<HomePageNav> createState() => _HomePageNavState();
}

class _HomePageNavState extends State<HomePageNav> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final providerAuth = context.read<AuthProvider>();

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Colors.black,
                kPrimaryColor,
              ],
            ),
          ),
        ),
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Stack(
            children: [
              const Text(
                'Tennis court',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.01,
                right: MediaQuery.of(context).size.width * 0.069,
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.016,
                  backgroundColor: kPrimaryColor,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('¿Deseas cerrar sesión?'),
                    actions: [
                      TextButton(
                        style: const ButtonStyle(
                          foregroundColor: WidgetStatePropertyAll(Colors.red),
                        ),
                        onPressed: () {
                          providerAuth
                              .signOut()
                              .then((value) => context.go("/login"));
                        },
                        child: const Text('Cerrar sesión'),
                      ),
                      TextButton(
                        onPressed: () => context.pop(),
                        child: const Text('Cancelar'),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(
              Icons.person_outline,
              color: Colors.white,
            ),
          ),
          const IconButton(
            onPressed: null,
            icon: Icon(
              Icons.notifications_none_outlined,
              color: Colors.white,
            ),
          ),
          const IconButton(
            onPressed: null,
            icon: Icon(
              Icons.menu_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        height: 60,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: kPrimaryColor,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            icon: Icon(Icons.home_outlined),
            label: 'Inicio',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.calendar_month,
              color: Colors.white,
            ),
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Reservas',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            icon: Icon(Icons.favorite_border_outlined),
            label: 'Favoritos',
          ),
        ],
      ),
      body: IndexedStack(
        index: currentPageIndex,
        children: const [
          HomePage(),
          ReservationListPage(),
          FavoritePage(),
        ],
      ),
    );
  }
}
