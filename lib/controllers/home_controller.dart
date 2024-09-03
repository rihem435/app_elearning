import 'package:app/core/networking/app_api.dart';
import 'package:app/models/formations/formations_model.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/state_manager.dart';

class HomeController extends GetxController {
  dio.Dio? _dio;
  FormationsModel? formationsModel;

  @override
  void onInit() {
    _dio = dio.Dio();
    super.onInit();
  }

  Future<FormationsModel?> getFormations() async {
    try {
      dio.Response response = await _dio!.get(AppApi.getFormationUrl);
      if (response.statusCode == 200) {
        formationsModel =  FormationsModel.fromJson(response.data);
        print('formations $formationsModel');
        return formationsModel;
      }
      return null;
    } catch (e) {
      print("error $e");
      return null;
    }
  }
}
