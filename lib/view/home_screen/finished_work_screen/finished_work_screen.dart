import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nodusterworkerapp/common/const.dart';
import 'package:nodusterworkerapp/model/order_model.dart';
import 'package:nodusterworkerapp/view/home_screen/pending_work_screen/pending_work_screen.dart';
import 'package:nodusterworkerapp/view/work_starting_screen/work_starting_screen.dart';

class FinishedWorkScreen extends StatelessWidget {
  const FinishedWorkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<OrderModel>>(
        stream: FirebaseFirestore.instance
            .collection('Assignedworks')
            .doc(currentemail)
            .collection('finishedworks')
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
                              padding: EdgeInsets.symmetric(horizontal: 10),
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
                                          Text(
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
                                            style: TextStyle(
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
                                          Text(
                                            "Booking ID",
                                            style: TextStyle(
                                              fontFamily: "poppinz",
                                              fontSize: 15,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Text(
                                            orderlist[index].orderid.toString(),
                                            style: TextStyle(
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
                                          Text(
                                            "Price",
                                            style: TextStyle(
                                              fontFamily: "poppinz",
                                              fontSize: 15,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Text(
                                            orderlist[index].price.toString(),
                                            style: TextStyle(
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
                                          Text(
                                            "Quantity",
                                            style: TextStyle(
                                              fontFamily: "poppinz",
                                              fontSize: 15,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Text(
                                            orderlist[index].orderquantity,
                                            style: TextStyle(
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
                                          Text(
                                            "Total Price",
                                            style: TextStyle(
                                              fontFamily: "poppinz",
                                              fontSize: 15,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Text(
                                            orderlist[index].totalprice,
                                            style: TextStyle(
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
                                  Text(
                                    "Address",
                                    style: TextStyle(
                                      fontFamily: "poppinz",
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    orderlist[index].address,
                                    style: TextStyle(
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
                                          Text(
                                            "Contact Name",
                                            style: TextStyle(
                                              fontFamily: "poppinz",
                                              fontSize: 15,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Text(
                                            orderlist[index].contactname,
                                            style: TextStyle(
                                              fontFamily: "poppinz",
                                              fontSize: 15,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            "Contact Number",
                                            style: TextStyle(
                                              fontFamily: "poppinz",
                                              fontSize: 15,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Text(
                                            orderlist[index].userphoneNumber,
                                            style: TextStyle(
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
                  'No Finished Works',
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
