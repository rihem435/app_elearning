import 'package:app/core/widgets/custom_card.dart';
import 'package:app/screens/home/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CoursScreen extends StatelessWidget {
  const CoursScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cours"),
      ),
      drawer: const Drawer(),
      body: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.75,
        ),
        itemCount: 8,
        itemBuilder: (context, index) => CustomCard(
          title: "Flutter",
          description: "flutter et dart",
          duree: "1 mois",
          image: "login.png",
          onTap: () => Get.to(const DetailsScreen()),
        ),
      ),
    );
  }
}
