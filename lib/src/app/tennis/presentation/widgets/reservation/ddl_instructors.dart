import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tennis_app/src/app/tennis/presentation/provider/instructors_provider.dart';
import 'package:tennis_app/src/app/tennis/presentation/provider/reservation_provider.dart';
import 'package:tennis_app/src/styles/colors.dart';

class SelectInstructor extends StatefulWidget {
  const SelectInstructor({
    super.key,
    this.controller,
  });

  final TextEditingController? controller;

  @override
  State<SelectInstructor> createState() => _SelectInstructorState();
}

class _SelectInstructorState extends State<SelectInstructor> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<InstructorsProvider>();
    final providerReservation = context.read<ReservationProvider>();

    return provider.listInstructors.isEmpty
        ? const SizedBox()
        : DropdownMenu<DdlInstructor>(
            controller: widget.controller,
            width: 220,
            label: const Text('Instructor'),
            initialSelection: provider.listInstructors.first,
            inputDecorationTheme: InputDecorationTheme(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: kGrey),
              ),
            ),
            onSelected: (DdlInstructor? value) {
              setState(() {
                providerReservation.instructor = value!.value;
              });
            },
            dropdownMenuEntries:
                provider.listInstructors.map<DropdownMenuEntry<DdlInstructor>>(
              (DdlInstructor value) {
                return DropdownMenuEntry<DdlInstructor>(
                  value: value,
                  label: value.description,
                );
              },
            ).toList(),
          );
  }
}
