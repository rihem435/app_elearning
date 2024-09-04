import 'package:app/controllers/profile_controller.dart';
import 'package:app/core/networking/app_api.dart';
import 'package:app/core/widgets/custom_input_text.dart';
import 'package:app/core/widgets/custom_title.dart';
import 'package:app/models/user/user_login_model.dart';
import 'package:app/screens/home/home_screen.dart';
import 'package:app/screens/profile/sing_up_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateScreen extends GetView<ProfileController> {
  const UpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: controller.keyForm,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              const CustomTitle(
                title: 'Log In',
              ),
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                "assets/images/login.png",
                width: 200,
                height: 200,
              ),
              CustomInputText(
                controller: controller.emailController,
                label: 'Email',
                hintText: "Enter your email",
                prefixIcon: Icons.email,
              ),
              const SizedBox(
                height: 20,
              ),
              GetBuilder<ProfileController>(
                builder: (controller) => CustomInputText(
                  controller: controller.nameController,
                  label: 'Name',
                  hintText: "Enter your name",
                  prefixIcon: Icons.lock,
                  obscureText: controller.obscureText,
                  suffixIcon: IconButton(
                    onPressed: () => controller.showPassword(),
                    // condition ? contenuCasTrue : contenuCasFalse
                    icon: Icon(
                      controller.obscureText
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.facebook_outlined,
                      color: Colors.blueAccent,
                      size: 36,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.facebook_outlined,
                      color: Colors.blueAccent,
                      size: 36,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  controller.updateUser(context);
                },
                style: ButtonStyle(
                  minimumSize: WidgetStateProperty.all(const Size(130, 40)),
                  elevation: WidgetStateProperty.all(0),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                child: const Text("Update"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
