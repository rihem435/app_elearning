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
      drawer: Drawer(
        backgroundColor: Colors.blue,
        width: MediaQuery.of(context).size.width * .8,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              currentAccountPicture: Image.asset(
                'assets/images/login.png',
              ),
              currentAccountPictureSize: const Size(80, 80),
              accountName: const Text(
                'Name',
                style: TextStyle(color: Colors.black),
              ),
              accountEmail:
                  const Text('Email', style: TextStyle(color: Colors.black)),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
              leading: const Icon(Icons.home),
            )
          ],
        ),
      ),
    );
  }
}
