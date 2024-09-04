import 'package:app/core/networking/app_api.dart';
import 'package:app/core/storage/app_storage.dart';
import 'package:app/models/user/user_login_model.dart';
import 'package:app/models/user/user_model.dart';
import 'package:app/screens/home/home_screen.dart';
import 'package:app/screens/profile/login_screen.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  TextEditingController? emailController;
  TextEditingController? passwordController;
  TextEditingController? nameController;

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
        AppStorage.saveId(userLoginModel!.user!.sId!);
        Get.to(const HomeScreen());

        print(userLoginModel!.user!.role);
      }
    } catch (e) {
      print("error=====>$e");
    }
  }

  logout() async {
    try {
      dio.Response response = await _dio!.post(
        AppApi.logOutURL,
      );
      if (response.statusCode == 200) {
        Get.to(const LoginScreen());
        print('logOut successfully');
      }
    } catch (e) {
      print('error ======>$e ');
    }
  }

  UserModel? userModel;
  getUser() async {
    try {
      dio.Response response = await _dio!.get(
        "${AppApi.userURL}${AppStorage.readId()}",
      );
      if (response.statusCode == 200) {
        print('get success success');
        userModel = UserModel.fromJson(response.data);
        emailController!.text = userModel!.data!.email!;
        nameController!.text = userModel!.data!.name!;
      }
    } catch (e) {
      print("error=====>$e");
    }
  }

  updateUser(BuildContext? context) async {
    try {
      Map<String, String> data = {
        "email": emailController!.text,
        "name": nameController!.text,
      };
      dio.Response response = await _dio!.put(
        "${AppApi.userURL}${AppStorage.readId()}",
        data: data,
      );
      if (response.statusCode == 200) {
        print('upadate success');

        ScaffoldMessenger.of(context!).showSnackBar(
          const SnackBar(content: Text('Update success')),
        );

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
