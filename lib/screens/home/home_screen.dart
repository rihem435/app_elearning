import 'package:app/controllers/home_controller.dart';
import 'package:app/core/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Screen',
        ),
        centerTitle: true,
      ),
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          const Text('List of'),
          const SizedBox(height: 20),
          Expanded(
            child: GetBuilder<HomeController>(
              builder: (controller) => FutureBuilder(
                future: controller.getFormations(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Text(
                      snapshot.error.toString(),
                      style: const TextStyle(color: Colors.red),
                    );
                  } else if (snapshot.hasData) {
                    if (snapshot.data!.formations!.isEmpty) {
                      return const Text('No data');
                    } else if (snapshot.data!.formations!.isNotEmpty) {
                      return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 0.75,
                          ),
                          itemCount: snapshot.data!.formations!.length,
                          itemBuilder: (context, index) => Center(
                                child: ListTile(
                                  leading: const Icon(Icons.child_care),
                                  title: Text(
                                      'Title: ${snapshot.data!.formations![index].nameF} '),
                                  subtitle: Text.rich(TextSpan(
                                    text:
                                        "Description : ${snapshot.data!.formations![index].descriptionF}",
                                    children: [
                                      TextSpan(
                                        text:
                                            "\nDuree:${snapshot.data!.formations![index].dureeF}",
                                        style: const TextStyle(
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  )),
                                  trailing: const Text("Formateur "),
                                ),
                              ));
                    }
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
