import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_api/models/detail_data_model.dart';

class DataController extends GetxController {
  RxList<DetailDataModel> _dataList = <DetailDataModel>[].obs;
  List<DetailDataModel> get dataList => _dataList.value;
  RxList<DetailDataModel> _dataTempList = <DetailDataModel>[].obs;
  List<DetailDataModel> get dataTempList => _dataTempList.value;
  var _data = DetailDataModel(
          name: "", title: "", text: "", img: "", time: "", prize: "")
      .obs;
  get data => _data.value;
  RxBool _isLoading = true.obs;
  bool get isloading => _isLoading.value;
  set isloading(bool val) => _isLoading.value = val;
  @override
  void onInit() {
    super.onInit();
    loadJsonData();
    print("onInit is called");
    // _isLoading.value = false;
    print("onInit changed loading value ${_isLoading.value}");
  }

  Future<void> loadJsonData() async {
    final String jsonString = await rootBundle.loadString('json/detail.json');
    print("JsonString ${jsonString}");
    final List<dynamic> JsonData = jsonDecode(jsonString);

    _dataList.value =
        JsonData.map((item) => DetailDataModel.fromJson(item)).toList();
  }

  void updateTempList(int index) {
    List<DetailDataModel> sortedList = List.from(_dataList);
    DetailDataModel targetItem = sortedList[index];
    sortedList.removeAt(index);
    sortedList.insert(0, targetItem);
    _dataTempList.assignAll(sortedList);
  }

  @override
  void onClose() {
    super.onClose();
    print("onClose  is called");
  }
}
