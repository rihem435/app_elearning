import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../storage/app_storage.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
            accountName: Text(
              AppStorage.readName(),
              style: const TextStyle(color: Colors.black),
            ),
            accountEmail: Text(AppStorage.readEmail(),
                style: const TextStyle(color: Colors.black)),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
            leading: const Icon(Icons.home),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .02,
          ),
          ListTile(
            title: const Text('Profile'),
            onTap: () {
              Navigator.pop(context);
            },
            leading: const Icon(Icons.person),
          ),
          ListTile(
            title: const Text('Logout'),
            onTap: () {
              Navigator.pop(context);
            },
            leading: const Icon(Icons.logout),
          )
        ],
      ),
    );
  }
}
