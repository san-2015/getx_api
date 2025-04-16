import 'package:get/get.dart';
import 'package:getx_api/services/fav_service.dart';

class FavController extends GetxController {
  RxBool _fav = false.obs;
  bool get fav => _fav.value;
  final FavService _favService = FavService();

  void setFav(bool val, String project_id) {
    _fav.value = val;
    _favService.updateFav(val, project_id);
  }
  // set fav(bool val) => _fav.value = val;
}
