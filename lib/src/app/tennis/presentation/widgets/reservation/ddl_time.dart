import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tennis_app/src/app/tennis/presentation/provider/courts_provider.dart';
import 'package:tennis_app/src/app/tennis/presentation/provider/reservation_provider.dart';
import 'package:tennis_app/src/styles/colors.dart';

class SelectTimeStart extends StatefulWidget {
  const SelectTimeStart({
    super.key,
    required this.label,
  });

  final String label;

  @override
  State<SelectTimeStart> createState() => _SelectTimeStartState();
}

class _SelectTimeStartState extends State<SelectTimeStart> {
  @override
  Widget build(BuildContext context) {
    final providerCourt = context.read<CourtsProvider>();
    final providerReservation = context.read<ReservationProvider>();

    return DropdownMenu<DdlTime>(
      width: (MediaQuery.of(context).size.width - 32) * 0.48,
      label: Text(widget.label),
      initialSelection: providerCourt.listTime.first,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: kGrey),
        ),
      ),
      onSelected: (DdlTime? value) {
        setState(() {
          providerReservation.timeStart = value!.value;
        });
      },
      dropdownMenuEntries:
          providerCourt.listTime.map<DropdownMenuEntry<DdlTime>>(
        (DdlTime value) {
          return DropdownMenuEntry<DdlTime>(
            value: value,
            label: value.description,
          );
        },
      ).toList(),
    );
  }
}
