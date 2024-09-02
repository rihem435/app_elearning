import 'package:app/core/networking/app_api.dart';
import 'package:app/core/storage/app_storage.dart';
import 'package:app/models/user/user_login_model.dart';
import 'package:app/screens/home/home_screen.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  TextEditingController? emailController;
  TextEditingController? passwordController;
  bool obscureText = true;

  final keyForm = GlobalKey<FormState>();
  dio.Dio? _dio;

  UserLoginModel? userLoginModel;
  showPassword() {
    obscureText = !obscureText;
    update();
  }

  login() async {
    try {
      Map<String, String> data = {
        "email": emailController!.text,
        "password": passwordController!.text,
      };
      dio.Response response = await _dio!.post(
        AppApi.loginUrl,
        data: data,
      );
      if (response.statusCode == 200) {
        print('Login success');
        userLoginModel = UserLoginModel.fromJson(response.data);

        AppStorage.saveName(userLoginModel!.user!.name!);
        AppStorage.saveEmail(userLoginModel!.user!.email!);

        Get.to(HomeScreen());
        
        print(userLoginModel!.user!.role);
      }
    } catch (e) {
      print("error=====>$e");
    }
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    _dio = dio.Dio();
    super.onInit();
  }
}
