import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nodusterworkerapp/common/const.dart';
import 'package:nodusterworkerapp/model/order_model.dart';
import 'package:nodusterworkerapp/view/work_starting_screen/work_starting_screen.dart';

final currentemail = FirebaseAuth.instance.currentUser!.email;

class PendingWorkScreen extends StatelessWidget {
  const PendingWorkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<OrderModel>>(
        stream: FirebaseFirestore.instance
            .collection('Assignedworks')
            .doc(currentemail)
            .collection('pendingworks')
            .snapshots()
            .map((event) =>
                event.docs.map((e) => OrderModel.fromJson(e.data())).toList()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<OrderModel> orderlist = snapshot.data!;

            if (orderlist.isNotEmpty) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: GestureDetector(
                        onTap: () => Get.to(WorkStartScreen(
                          orderModel: orderlist[index],
                          imageUrlFinish: orderlist[index].workfinishimage,
                          imageUrlStart: orderlist[index].workstartimage,
                        )),
                        child: Container(
                            width: double.infinity,
                            color: Colors.grey[200],
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  k20height,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Service",
                                            style: TextStyle(
                                              fontFamily: "poppinz",
                                              fontSize: 15,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Text(
                                            orderlist[index]
                                                .specificservicename
                                                .toString(),
                                            style: const TextStyle(
                                              fontFamily: "poppinz",
                                              fontSize: 15,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Booking ID",
                                            style: TextStyle(
                                              fontFamily: "poppinz",
                                              fontSize: 15,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Text(
                                            orderlist[index].orderid.toString(),
                                            style: const TextStyle(
                                              fontFamily: "poppinz",
                                              fontSize: 15,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  k20height,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "Price",
                                            style: TextStyle(
                                              fontFamily: "poppinz",
                                              fontSize: 15,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Text(
                                            orderlist[index].price.toString(),
                                            style: const TextStyle(
                                              fontFamily: "poppinz",
                                              fontSize: 15,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "Quantity",
                                            style: TextStyle(
                                              fontFamily: "poppinz",
                                              fontSize: 15,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Text(
                                            orderlist[index].orderquantity,
                                            style: const TextStyle(
                                              fontFamily: "poppinz",
                                              fontSize: 15,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "Total Price",
                                            style: TextStyle(
                                              fontFamily: "poppinz",
                                              fontSize: 15,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Text(
                                            orderlist[index].totalprice,
                                            style: const TextStyle(
                                              fontFamily: "poppinz",
                                              fontSize: 15,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  k20height,
                                  const Text(
                                    "Address",
                                    style: TextStyle(
                                      fontFamily: "poppinz",
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    orderlist[index].address,
                                    style: const TextStyle(
                                      fontFamily: "poppinz",
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                  k20height,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                          const Text(
                                            "Contact Name",
                                            style: TextStyle(
                                              fontFamily: "poppinz",
                                              fontSize: 15,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Text(
                                            orderlist[index].contactname,
                                            style: const TextStyle(
                                              fontFamily: "poppinz",
                                              fontSize: 15,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          const Text(
                                            "Contact Number",
                                            style: TextStyle(
                                              fontFamily: "poppinz",
                                              fontSize: 15,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Text(
                                            orderlist[index].userphoneNumber,
                                            style: const TextStyle(
                                              fontFamily: "poppinz",
                                              fontSize: 15,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  k20height,
                                ],
                              ),
                            )),
                      ),
                    );
                  });
            } else {
              return Center(
                child: Text(
                  'No Pending Works',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              );
            }
          } else {
            return const Center(
              child: Text(
                'No Data',
                style: TextStyle(color: Colors.black),
              ),
            );
          }
        });
  }
}
