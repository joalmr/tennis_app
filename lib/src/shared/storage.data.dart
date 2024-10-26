import 'package:get_storage/get_storage.dart';

class MyStorage {
  final box = GetStorage();

  String get uid => box.read('uid') ?? '';
  set uid(String value) => box.write('uid', value);

  String get name => box.read('name') ?? '';
  set name(String value) => box.write('name', value);

  String get email => box.read('email') ?? '';
  set email(String value) => box.write('email', value);

  String get password => box.read('password') ?? '';
  set password(String value) => box.write('password', value);

  bool get isRemember => box.read('isRemember') ?? false;
  set isRemember(bool value) => box.write('isRemember', value);
}
