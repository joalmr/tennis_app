import 'package:intl/intl.dart';

DateFormat f() {
  return DateFormat('dd/MM/yyyy');
}

String formattedDate(DateTime date) {
  final months = [
    'Enero',
    'Febrero',
    'Marzo',
    'Abril',
    'Mayo',
    'Junio',
    'Julio',
    'Agosto',
    'Septiembre',
    'Octubre',
    'Noviembre',
    'Diciembre'
  ];

  final temp = f().format(date).split('/');
  return '${temp[0]} de ${months[int.parse(temp[1]) - 1]} ${temp[2]}';
}
