import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:nodusterworkerapp/model/order_model.dart';
import 'package:nodusterworkerapp/view/home_screen/home_screen.dart';

import '../view/home_screen/pending_work_screen/pending_work_screen.dart';

Future workaddedtoFinished(
    {required OrderModel orderModel, required context}) async {
  final workerdetailstofinished = FirebaseFirestore.instance
      .collection('Assignedworks')
      .doc(currentemail)
      .collection('finishedworks')
      .doc(orderModel.datetime);

  final workerdetailsjson = orderModel.toJson();
  await workerdetailstofinished.set(workerdetailsjson);

  log('Added to finished work -worker side ');

  final admindetailstofinished = FirebaseFirestore.instance
      .collection('orders')
      .doc('orders')
      .collection('finishedworks')
      .doc(orderModel.datetime);

  final admindetailsjson = orderModel.toJson();
  await admindetailstofinished.set(admindetailsjson);

  log('Added to finished work -admin side order to finished ');

  final userordertofinished = FirebaseFirestore.instance
      .collection('users')
      .doc(orderModel.userphoneNumber)
      .collection('orders')
      .doc(orderModel.datetime);

  userordertofinished.update({'isPending': false, 'isFinished': true});
  log('userside bool updated');
}

Future deletefrompending(
    {required OrderModel orderModel, required context}) async {
  final workerdetailstofinished = FirebaseFirestore.instance
      .collection('Assignedworks')
      .doc(currentemail)
      .collection('pendingworks')
      .doc(orderModel.datetime);

  await workerdetailstofinished.delete();

  log('deleted from pending from worker side');

  final admindetailstofinished = FirebaseFirestore.instance
      .collection('orders')
      .doc('orders')
      .collection('pendingworks')
      .doc(orderModel.datetime);

  await admindetailstofinished.delete();

  log('deleted from pending from admin side');
  Get.offAll(() => const HomeScreen());
}
