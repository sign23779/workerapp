import 'package:flutter/material.dart';
import 'package:nodusterworkerapp/common/drawer_widget.dart';
import 'package:nodusterworkerapp/view/home_screen/finished_work_screen/finished_work_screen.dart';
import 'package:nodusterworkerapp/view/home_screen/pending_work_screen/pending_work_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: const DrawerWidget(),
        appBar: AppBar(
          title: const Text('Works'),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Pending Works',
                icon: Icon(Icons.pending_actions_outlined),
              ),
              Tab(
                text: 'Finished Works',
                icon: Icon(Icons.beenhere),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [PendingWorkScreen(), FinishedWorkScreen()],
        ),
      ),
    );
  }
}
