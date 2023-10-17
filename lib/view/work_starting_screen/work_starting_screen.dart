import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nodusterworkerapp/common/const.dart';
import 'package:nodusterworkerapp/functions/image_fun.dart';
import 'package:nodusterworkerapp/functions/workcomplete_fun.dart';
import 'package:nodusterworkerapp/model/order_model.dart';
import 'package:nodusterworkerapp/view/home_screen/pending_work_screen/pending_work_screen.dart';

// class WorkStartScreen extends StatefulWidget {
//   const WorkStartScreen({super.key});

//   @override
//   State<WorkStartScreen> createState() => _WorkStartScreenState();
// }

// class _WorkStartScreenState extends State<WorkStartScreen> {
//   String? imagurlstart;
//   String? imagurlfinish;
//   // = 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             imagurlstart == null
//                 ? SizedBox(
//                     child: CircularProgressIndicator(),
//                   )
//                 : Container(
//                     height: 300,
//                     width: 300,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15),
//                         image: DecorationImage(
//                             image: NetworkImage(imagurlstart.toString()),
//                             fit: BoxFit.cover)),
//                   ),
//             k20height,
//             ElevatedButton(
//                 onPressed: () {
//                   setState(() async {
//                     final imageurl = await Images.getimage(ImageSource.camera);
//                     //image.add(imageurl.toString());
//                     setState(() {});
//                     imagurlstart = imageurl!;
//                     log(imageurl.toString());
//                   });
//                 },
//                 child: Text('Take image')),
//             k20height,
//             ElevatedButton(
//                 onPressed: () {
//                   //  Get.to(WorkFinishScreen());
//                 },
//                 child: Text('Upload image and Start work')),
//             k20height,
//             imagurlfinish == null
//                 ? SizedBox(
//                     child: CircularProgressIndicator(),
//                   )
//                 : Container(
//                     height: 300,
//                     width: 300,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15),
//                         image: DecorationImage(
//                             image: NetworkImage(imagurlfinish.toString()),
//                             fit: BoxFit.cover)),
//                   ),
//             k20height,
//             ElevatedButton(
//                 onPressed: () {
//                   setState(() async {
//                     final imageurl = await Images.getimage(ImageSource.camera);
//                     //image.add(imageurl.toString());
//                     setState(() {});
//                     imagurlfinish = imageurl!;
//                     log(imageurl.toString());
//                   });
//                 },
//                 child: Text('Take image')),
//             k20height,
//             ElevatedButton(
//                 onPressed: () {
//                   //  Get.to(page);
//                 },
//                 child: Text('Upload image and Finish work')),
//           ],
//         ),
//       ),
//     );
//   }
// }

class WorkStartScreen extends StatefulWidget {
  WorkStartScreen(
      {Key? key,
      required this.orderModel,
      required this.imageUrlFinish,
      required this.imageUrlStart})
      : super(key: key);
  OrderModel orderModel;
  String? imageUrlStart;
  String? imageUrlFinish;

  @override
  _WorkStartScreenState createState() => _WorkStartScreenState();
}

class _WorkStartScreenState extends State<WorkStartScreen> {
  // String? imageUrlStart;
  // String? imageUrlFinish;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Work Updates'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[300],
                  ),
                  child: widget.imageUrlStart == null
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container(
                          width: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: NetworkImage(widget.imageUrlStart!),
                                  fit: BoxFit.cover)),
                        ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final imageUrl = await Images.getimage(ImageSource.camera);
                  setState(() {
                    widget.imageUrlStart = imageUrl!;
                  });
                },
                child: Text('Take image before work'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final updateavailable = FirebaseFirestore.instance
                      .collection('Assignedworks')
                      .doc(currentemail)
                      .collection('pendingworks')
                      .doc(widget.orderModel.datetime);

                  updateavailable
                      .update({'imagestarturl': widget.imageUrlStart});

                  log(widget.imageUrlStart.toString());
                },
                child: const Text('Upload image and Start work'),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Container(
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[300],
                  ),
                  child: widget.imageUrlFinish == null
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container(
                          width: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: NetworkImage(widget.imageUrlFinish!),
                                  fit: BoxFit.cover)),

                          // child: Image.network(
                          //   imageUrlFinish!,
                          //   fit: BoxFit.cover,
                          // ),
                        ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final imageUrl = await Images.getimage(ImageSource.camera);
                  setState(() {
                    widget.imageUrlFinish = imageUrl!;
                  });
                },
                child: Text('Take image after work'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigate to another screen
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => NextScreen(),
                  //   ),
                  // );

                  final updateavailable = FirebaseFirestore.instance
                      .collection('Assignedworks')
                      .doc(currentemail)
                      .collection('pendingworks')
                      .doc(widget.orderModel.datetime);

                  updateavailable
                      .update({'imagefinishurl': widget.imageUrlFinish});

                  log(widget.imageUrlFinish.toString());
                },
                child: Text('Upload image and Finish work'),
              ),
              k20height,
              ElevatedButton(
                  onPressed: () {
                    workaddedtoFinished(
                            orderModel: widget.orderModel, context: context)
                        .then((value) {
                      deletefrompending(
                          orderModel: widget.orderModel, context: context);
                    });
                  },
                  child: Text('Work completed'))
            ],
          ),
        ),
      ),
    );
  }
}
