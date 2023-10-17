// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nodusterworkerapp/common/list_tile_widget.dart';
import 'package:nodusterworkerapp/common/snackbar.dart';
import 'package:nodusterworkerapp/view/home_screen/home_screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.white,
        child: SizedBox(
            child: Column(children: [
          const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Center(
                  child: Text(
                'NO DUSTER Worker App',
                style: TextStyle(color: Colors.white),
              ))),
          ListTileWidget(
            IconColor: const Color(0xff2b2b29),
            Title: 'Home',
            LeadIcon: Icons.home,
            Ontap: () => Get.to(const HomeScreen()),
          ),
          ListTileWidget(
            IconColor: const Color(0xff2b2b29),
            Title: 'Log Out',
            LeadIcon: Icons.logout,
            Ontap: () async {
              await FirebaseAuth.instance.signOut();

              Utils.showSnackBar(context: context, text: 'Logoutted');
            },
          ),
        ])));
  }
}
