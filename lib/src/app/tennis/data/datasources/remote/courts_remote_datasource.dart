import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tennis_app/src/app/tennis/data/models/courts_model.dart';
import 'package:tennis_app/src/app/tennis/data/models/favorite_courts_model.dart';

abstract class CourtsRemoteDatasource {
  Future<List<CourtsModel>> getCourts();
  Future<bool> favoriteCourt(String idCustomer, int idCourt);
  Future<List<FavoriteCourtsModel>> getFavoriteCourts(String idCustomer);
}

class CourtsRemoteDatasourceImpl implements CourtsRemoteDatasource {
  final supabase = Supabase.instance.client;

  @override
  Future<List<CourtsModel>> getCourts() async {
    final response = await supabase.from('courts').select('*');

    return response.map((json) => CourtsModel.fromJson(json)).toList();
  }

  @override
  Future<bool> favoriteCourt(String idCustomer, int idCourt) async {
    //TODO: implementar
    final evaluateFavorite = await supabase
        .from('favorite_courts')
        .select("*")
        .eq('customer_id', idCustomer)
        .eq('court_id', idCourt);

    if (evaluateFavorite.isEmpty) {
      await supabase.from('favorite_courts').insert([
        {'customer_id': idCustomer, 'court_id': idCourt},
      ]).select();
      return true;
    } else {
      await supabase
          .from('favorite_courts')
          .delete()
          .eq('customer_id', idCustomer)
          .eq('court_id', idCourt);
      return false;
    }
  }

  @override
  Future<List<FavoriteCourtsModel>> getFavoriteCourts(String idCustomer) async {
    //TODO: implementar en vista
    final response = await supabase
        .from('favorite_courts')
        .select("*,courts(*)")
        .eq('customer_id', idCustomer);

    return response.map((json) => FavoriteCourtsModel.fromJson(json)).toList();
  }
}
