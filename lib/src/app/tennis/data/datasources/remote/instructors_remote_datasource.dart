import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tennis_app/src/app/tennis/data/models/instructors_model.dart';

abstract class InstructorsRemoteDatasource {
  Future<List<InstructorsModel>> getInstructors();
}

class InstructorsRemoteDatasourceImpl implements InstructorsRemoteDatasource {
  final supabase = Supabase.instance.client;

  @override
  Future<List<InstructorsModel>> getInstructors() async {
    final response = await supabase.from('instructors').select('*');

    return response.map((json) => InstructorsModel.fromJson(json)).toList();
  }
}
