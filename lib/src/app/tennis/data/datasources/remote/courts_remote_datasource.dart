import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tennis_app/src/app/tennis/data/models/courts_model.dart';

abstract class CourtsRemoteDatasource {
  Future<List<CourtsModel>> getCourts();
}

class CourtsRemoteDatasourceImpl implements CourtsRemoteDatasource {
  final supabase = Supabase.instance.client;

  @override
  Future<List<CourtsModel>> getCourts() async {
    final response = await supabase.from('courts').select('*');

    return response.map((json) => CourtsModel.fromJson(json)).toList();
  }

  // final response = await supabase.from('courts').select('*').eq('id', 1);
}
