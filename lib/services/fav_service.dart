import 'package:getx_api/repository/fav_repository.dart';

class  FavService{
  final FavRepository _favRepository= FavRepository();
  Future<void> updateFav(bool val, String project_id ) async{
    await _favRepository.saveFav(val,project_id);
  }
 }