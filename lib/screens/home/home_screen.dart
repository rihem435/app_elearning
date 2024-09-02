import 'package:app/core/storage/app_storage.dart';
import 'package:app/core/widgets/custom_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
        //leading: const Icon(Icons.home),
      ),
      drawer: const CustomDrawer(),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Liste of ',
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * .2,
            width: double.infinity,
            child: ListView.builder(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) => Card(
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width * .8,
                        height: MediaQuery.sizeOf(context).height * .1,
                        child: const Center(
                          child: ListTile(
                            leading: Icon(Icons.child_care),
                            title: Text('title Name'),
                            subtitle: Text.rich(
                                TextSpan(text: "description", children: [
                              TextSpan(
                                text: "duree",
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              )
                            ])),
                            trailing: Text("Formateur"),
                          ),
                        ),
                      ),
                    )),
          ),

          // Expanded(
          //   child: SizedBox(
          //     height: 300,
          //     width: double.infinity,
          //     child: ListView.builder(
          //       scrollDirection: Axis.horizontal,
          //       itemCount: 5,
          //       shrinkWrap: true,
          //       physics: const ClampingScrollPhysics(),
          //       itemBuilder: (context, index) {
          //         return const Card(
          //           child: ListTile(
          //             leading: Icon(Icons.child_care),
          //             title: Text('title Name'),
          //             subtitle:
          //                 Text.rich(TextSpan(text: "description", children: [
          //               TextSpan(
          //                 text: "duree",
          //                 style: TextStyle(
          //                   color: Colors.red,
          //                 ),
          //               )
          //             ])),
          //             trailing: Text("Formateur"),
          //           ),
          //         );
          //       },
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
